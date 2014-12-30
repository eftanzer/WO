//
//  ShoppingListSearchResultsTableView.m
//  WO
//
//  Created by Ezra on 12/30/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//

#import "ShoppingListSearchResultsTableView.h"
#import "ProductCategory.h"
#import "CategorySearchResultCell.h"

@implementation ShoppingListSearchResultsTableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.filteredCategories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ProductCategory *productCategory = self.filteredCategories[indexPath.row];
    
    CategorySearchResultCell *cell = (CategorySearchResultCell *)[self dequeueReusableCellWithIdentifier:@"Cell"];
    //assert(cell != nil);    // we should always have a cell
    cell.categoryNameLabel.text = productCategory.name;
    return cell;
}

@end
