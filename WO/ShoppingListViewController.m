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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *searchResultCell = [self.tableView dequeueReusableCellWithIdentifier:@"searchResultCell"];
    UITableViewCell *addedItemCell = [self.tableView dequeueReusableCellWithIdentifier:@"addedItemCell"];
    
    UITableViewCell *cell = nil;
    
    if (indexPath.row == 0) {
        cell = searchResultCell;
    } else if (indexPath.row == 1) {
        cell = addedItemCell;
    }
    return cell;
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
