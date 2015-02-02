//
//  ShoppingCategory.h
//  WO
//
//  Created by Ezra on 1/24/15.
//  Copyright (c) 2015 CozE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ShoppingListItem, Store;

@interface ShoppingCategory : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *shoppingListItems;
@property (nonatomic, retain) NSSet *stores;
@end

@interface ShoppingCategory (CoreDataGeneratedAccessors)

- (void)addShoppingListItemsObject:(ShoppingListItem *)value;
- (void)removeShoppingListItemsObject:(ShoppingListItem *)value;
- (void)addShoppingListItems:(NSSet *)values;
- (void)removeShoppingListItems:(NSSet *)values;

- (void)addStoresObject:(Store *)value;
- (void)removeStoresObject:(Store *)value;
- (void)addStores:(NSSet *)values;
- (void)removeStores:(NSSet *)values;

@end
