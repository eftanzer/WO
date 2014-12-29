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
    store1.tripNumber = [NSNumber numberWithInt:1];
    
    Store *store2 = [Store new];
    store2.name = @"Aldo";
    store2.tripNumber = [NSNumber numberWithInt:2];
    
    Store *store3 = [Store new];
    store3.name = @"J Crew";
    store3.tripNumber = [NSNumber numberWithInt:1];
    
    Store *store4 = [Store new];
    store4.name = @"Gap";
    store4.tripNumber = [NSNumber numberWithInt:2];
    
    return(@[store1,store2,store3,store4]);
}

@end
