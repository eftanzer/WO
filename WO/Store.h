//
//  Store.h
//  WO
//
//  Created by Ezra on 1/24/15.
//  Copyright (c) 2015 CozE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ShoppingCategory, ShoppingListItem, Trip;

@interface Store : NSManagedObject

@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *categories;
@property (nonatomic, retain) NSSet *linkedShoppingListItems;
@property (nonatomic, retain) NSSet *potentialShoppingListItems;
@property (nonatomic, retain) Trip *trip;
@end

@interface Store (CoreDataGeneratedAccessors)

- (void)addCategoriesObject:(ShoppingCategory *)value;
- (void)removeCategoriesObject:(ShoppingCategory *)value;
- (void)addCategories:(NSSet *)values;
- (void)removeCategories:(NSSet *)values;

- (void)addLinkedShoppingListItemsObject:(ShoppingListItem *)value;
- (void)removeLinkedShoppingListItemsObject:(ShoppingListItem *)value;
- (void)addLinkedShoppingListItems:(NSSet *)values;
- (void)removeLinkedShoppingListItems:(NSSet *)values;

- (void)addPotentialShoppingListItemsObject:(ShoppingListItem *)value;
- (void)removePotentialShoppingListItemsObject:(ShoppingListItem *)value;
- (void)addPotentialShoppingListItems:(NSSet *)values;
- (void)removePotentialShoppingListItems:(NSSet *)values;

@end
