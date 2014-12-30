//
//  ProductCategory.m
//  WO
//
//  Created by Ezra on 12/29/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//

#import "ProductCategory.h"

@implementation ProductCategory

+ (NSArray *)listOfCategories {
    
    ProductCategory *category1 = [ProductCategory new];
    category1.name = @"Shoes";
    ProductCategory *category2 = [ProductCategory new];
    category2.name = @"Clothing";
    ProductCategory *category3 = [ProductCategory new];
    category3.name = @"Athletic Clothing";
    ProductCategory *category4 = [ProductCategory new];
    category4.name = @"Sneakers";
    ProductCategory *category5 = [ProductCategory new];
    category5.name = @"Dress Shoes";
    ProductCategory *category6 = [ProductCategory new];
    category6.name = @"Socks";
    ProductCategory *category7 = [ProductCategory new];
    category7.name = @"Shirts";
    ProductCategory *category8 = [ProductCategory new];
    category8.name = @"Pants";
    ProductCategory *category9 = [ProductCategory new];
    category9.name = @"Jeans";
    ProductCategory *category10 = [ProductCategory new];
    category10.name = @"Scarves";
    
    return(@[category1,category2,category3,category4,category5,category6,category7,category8,category9,category10]);
}

@end
