//
//  MyTripViewController.m
//  WO
//
//  Created by Ezra on 12/27/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//

#import "MyTripViewController.h"
#import "Store.h"
#import "MyTripStoreTableCell.h"
#import "ProductCategory.h"

@interface MyTripViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *storesInTrip;
@property (nonatomic) BOOL inEditMode;
@property (weak, nonatomic) IBOutlet UIButton *manuallyOrderButton;
@property (weak, nonatomic) IBOutlet UIView *mapView;
@property (nonatomic) BOOL mapViewVisible;
@property (weak, nonatomic) IBOutlet UIView *storesView;
@property (nonatomic) BOOL storesViewVisible;
@property (strong, nonatomic) NSArray *categories;

@end

@implementation MyTripViewController
{
    NSArray *searchResults;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setup];
}

- (void)setup {
    [self loadStoresForTrip];
    [self populateCategories];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MyTripStoreTableCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    self.inEditMode = NO;
    self.mapViewVisible = YES;
    self.storesViewVisible = YES;
}

- (void)loadStoresForTrip {
    //self.storesInTrip = [[NSMutableArray alloc] initWithArray:[Store listOfStores]];
    NSLog(@"Stores: %@",self.storesInTrip);
}

- (void)populateCategories {
    self.categories = [[NSArray alloc] initWithArray:[ProductCategory listOfCategories]];
    NSLog(@"Categories: %@",self.categories);
}

- (IBAction)orderManually:(id)sender {
    if (self.inEditMode) {
        [self.manuallyOrderButton setTitle:@"Manually Order" forState:UIControlStateNormal];
        self.inEditMode = NO;
        self.tableView.editing = NO;
    } else {
        [self.manuallyOrderButton setTitle:@"Save Order" forState:UIControlStateNormal];
        self.inEditMode = YES;
        self.tableView.editing = YES;
    }
}

- (IBAction)showExpandMap:(id)sender {
    NSLog(@"execute code to pop up map with full route car --> stores --> car");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.storesInTrip.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTripStoreTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.numberLabel.text = [NSString stringWithFormat:@"%ld", (indexPath.row +1)];
    cell.storeNameLabel.text = [[self.storesInTrip objectAtIndex:indexPath.row] name];
    return cell;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tableView accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {    
    return UITableViewCellAccessoryDisclosureIndicator;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    NSString *stringToMove = self.storesInTrip[sourceIndexPath.row];
    [self.storesInTrip removeObjectAtIndex:sourceIndexPath.row];
    [self.storesInTrip insertObject:stringToMove atIndex:destinationIndexPath.row];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.storesInTrip removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
