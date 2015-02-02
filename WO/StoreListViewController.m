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

@interface StoreListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *stores;
@property (strong, nonatomic) Store *storeSelected;

@end

@implementation StoreListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataManager *dataManager = (DataManager *)[[UIApplication sharedApplication] delegate];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Store" inManagedObjectContext:dataManager.managedObjectContext];
    [fetchRequest setEntity:entity];
    [fetchRequest setReturnsObjectsAsFaults:NO];
    [fetchRequest setSortDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"trip" ascending:NO],[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]]];
    
    NSError *error = nil;
    
    self.stores = [dataManager.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    } else {
        for (Store *store in self.stores) {
            NSLog(@"Store name: %@",store.name);
//            NSLog(@"Store desc: %@",store.desc);
//            NSLog(@"Store added to trip? %@", store.trip);
//            NSLog(@"Store cats: %@", [store categories]);
//            NSLog(@"Cats: %@", store.categories);
            NSMutableString *categoryString = [NSMutableString stringWithCharacters:nil length:0];
//            NSLog(@"Count of cats: %lu", (unsigned long)store.categories.count);
            for (ProductCategory *productCategory in [store categories]) {
//                ProductCategory *category = productCategory;
                NSString *stringToAdd = [NSString stringWithFormat:@"%@", productCategory.name];
                NSString *listedString = [NSString stringWithFormat:@"%@ : %@", categoryString, stringToAdd];
                categoryString = [listedString mutableCopy];
//                NSLog(@"Store categories %@", productCategory.name);
            }
//            NSLog(@"Store Categories%@", categoryString);
        }
    }
    
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.stores.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StoreListStoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoreCell" forIndexPath:indexPath];
    
    Store *store = [self.stores objectAtIndex:indexPath.row];
    
    cell.storeNameLabel.text = store.name;
    if (store.trip) {
        [cell.addedToTripButton setTitle:@"-" forState:UIControlStateNormal];
    } else {
        [cell.addedToTripButton setTitle:@"+" forState:UIControlStateNormal];
    }
    
    //order by addedToTrip = YES, then alphabetically
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.storeSelected = [self.stores objectAtIndex:indexPath.row];
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
