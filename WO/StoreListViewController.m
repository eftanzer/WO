//
//  StoreListViewController.m
//  WO
//
//  Created by Ezra on 1/8/15.
//  Copyright (c) 2015 CozE. All rights reserved.
//

#import "StoreListViewController.h"
#import "AppDelegate.h"
#import "Store.h"
#import "ProductCategory.h"
#import "StoreListStoreTableViewCell.h"
#import "StoreDetailViewController.h"
#import "DataManager.h"
#import <CoreData/CoreData.h>

@interface StoreListViewController () <NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *stores;
@property (strong, nonatomic) Store *storeSelected;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@end

@implementation StoreListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataManager *dataManager = (DataManager *)[[UIApplication sharedApplication] delegate];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Store"];
    [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"trip" ascending:NO],[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:dataManager.managedObjectContext sectionNameKeyPath:@"primaryCategory" cacheName:@"root"];
    [self.fetchedResultsController setDelegate:self];
    NSError *error = nil;
    [self.fetchedResultsController performFetch:&error];
    
    if (error) {
        NSLog(@"Unable to perform fetch.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
    
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription
//                                   entityForName:@"Store" inManagedObjectContext:dataManager.managedObjectContext];
//    [fetchRequest setEntity:entity];
//    [fetchRequest setReturnsObjectsAsFaults:NO];
//    [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"trip" ascending:NO],[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]]];
//    
//    NSError *error = nil;
//    
//    self.stores = [dataManager.managedObjectContext executeFetchRequest:fetchRequest error:&error];
//    
//    if (error) {
//        NSLog(@"Unable to execute fetch request.");
//        NSLog(@"%@, %@", error, error.localizedDescription);
//    } else {
//        for (Store *store in self.stores) {
//            NSLog(@"Store name: %@",store.name);
////            NSLog(@"Store desc: %@",store.desc);
////            NSLog(@"Store added to trip? %@", store.trip);
////            NSLog(@"Store cats: %@", [store categories]);
////            NSLog(@"Cats: %@", store.categories);
//            NSMutableString *categoryString = [NSMutableString stringWithCharacters:nil length:0];
////            NSLog(@"Count of cats: %lu", (unsigned long)store.categories.count);
//            for (ProductCategory *productCategory in [store categories]) {
////                ProductCategory *category = productCategory;
//                NSString *stringToAdd = [NSString stringWithFormat:@"%@", productCategory.name];
//                NSString *listedString = [NSString stringWithFormat:@"%@ : %@", categoryString, stringToAdd];
//                categoryString = [listedString mutableCopy];
////                NSLog(@"Store categories %@", productCategory.name);
//            }
////            NSLog(@"Store Categories%@", categoryString);
//        }
//    }
    
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    switch (type) {
        case NSFetchedResultsChangeInsert: {
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        case NSFetchedResultsChangeDelete: {
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
        case NSFetchedResultsChangeUpdate: {
            [self configureCell:(StoreListStoreTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
        }
        case NSFetchedResultsChangeMove: {
            [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        }
    }
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sections = [self.fetchedResultsController sections];
    id<NSFetchedResultsSectionInfo> sectionInfo = [sections objectAtIndex:section];
    
    return [sectionInfo numberOfObjects];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo name];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StoreListStoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoreCell" forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(StoreListStoreTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    Store *store = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.storeNameLabel.text = store.name;
    if (store.trip) {
        [cell.addedToTripButton setTitle:@"-" forState:UIControlStateNormal];
    } else {
        [cell.addedToTripButton setTitle:@"+" forState:UIControlStateNormal];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.storeSelected = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [self performSegueWithIdentifier:@"StoreDetailSegue" sender:nil];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"StoreDetailSegue"]) {
        StoreDetailViewController *storeDetailVC = (StoreDetailViewController *)segue.destinationViewController;
        storeDetailVC.store = self.storeSelected;
    }
}


@end
