//
//  Store.m
//  WO
//
//  Created by Ezra on 12/28/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//

#import "Store.h"

@implementation Store

+ (NSArray *)listOfStores {
    Store *store1 = [Store new];
    store1.name = @"Adidas";
    store1.desc = @"";
    store1.hours = @"";
    store1.phoneNumber = @"";
    store1.categories = @[@"Shoes",@"Clothing",@"Athletic Clothing",@"Sneakers"];
    
    Store *store2 = [Store new];
    store2.name = @"Aldo";
    store2.desc = @"";
    store2.hours = @"";
    store2.phoneNumber = @"";
    store2.categories = @[@"Shoes",@"Dress Shoes",@"Socks"];
    
    Store *store3 = [Store new];
    store3.name = @"J Crew";
    store3.desc = @"";
    store3.hours = @"";
    store3.phoneNumber = @"";
    store3.categories = @[@"Shoes",@"Clothing",@"Shirts",@"Sneakers",@"Pants",@"Jeans",@"Scarves"];
    
    Store *store4 = [Store new];
    store4.name = @"Gap";
    store4.desc = @"";
    store4.hours = @"";
    store4.phoneNumber = @"";
    store4.categories = @[@"Shoes",@"Clothing",@"Shirts",@"Sneakers",@"Pants",@"Jeans",@"Scarves"];
    
    return(@[store1,store2,store3,store4]);
}

@end
