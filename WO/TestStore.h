//
//  TestStore.h
//  WO
//
//  Created by Ezra on 12/28/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProductCategory.h"

@interface TestStore : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *hours;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSArray *categories;
@property (strong, nonatomic) NSArray *shoppingListItems;
@property (nonatomic) BOOL storeAddedToTrip;

+(NSArray *)listOfStores;

@end