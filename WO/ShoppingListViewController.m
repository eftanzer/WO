//
//  ShoppingListViewController.m
//  WO
//
//  Created by Ezra on 12/26/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//

#import "ShoppingListViewController.h"
#import "ShoppingListSearchResultsTableView.h"
#import "ProductCategory.h"

@interface ShoppingListViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ShoppingListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupProductCategories];
}

- (void)setupProductCategories {
    self.productCategories = [[NSArray alloc] initWithArray:[ProductCategory listOfCategories]];
    NSLog(@"Categories: %@",self.productCategories);
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"addedItemCell"];
        
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //get shoppingListItem for index path & save to local property
    [self performSegueWithIdentifier:@"ShoppingListItemDetailSegue" sender:nil];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString: @"ShoppingListItemDetailSegue"]) {
    // Pass the shoppingListItem object to the new view controller.
    }
}

@end
