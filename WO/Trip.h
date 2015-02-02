//
//  Trip.h
//  WO
//
//  Created by Ezra on 1/24/15.
//  Copyright (c) 2015 CozE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ShoppingListItem, Store;

@interface Trip : NSManagedObject

@property (nonatomic, retain) NSSet *shoppingListItems;
@property (nonatomic, retain) NSSet *storesOnTrip;
@end

@interface Trip (CoreDataGeneratedAccessors)

- (void)addShoppingListItemsObject:(ShoppingListItem *)value;
- (void)removeShoppingListItemsObject:(ShoppingListItem *)value;
- (void)addShoppingListItems:(NSSet *)values;
- (void)removeShoppingListItems:(NSSet *)values;

- (void)addStoresOnTripObject:(Store *)value;
- (void)removeStoresOnTripObject:(Store *)value;
- (void)addStoresOnTrip:(NSSet *)values;
- (void)removeStoresOnTrip:(NSSet *)values;

@end
