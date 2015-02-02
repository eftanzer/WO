//
//  ShoppingListItem.h
//  WO
//
//  Created by Ezra on 1/24/15.
//  Copyright (c) 2015 CozE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ShoppingCategory, Store, Trip;

@interface ShoppingListItem : NSManagedObject

@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) ShoppingCategory *category;
@property (nonatomic, retain) NSSet *linkedStores;
@property (nonatomic, retain) NSSet *potentialStores;
@property (nonatomic, retain) Trip *trip;
@end

@interface ShoppingListItem (CoreDataGeneratedAccessors)

- (void)addLinkedStoresObject:(Store *)value;
- (void)removeLinkedStoresObject:(Store *)value;
- (void)addLinkedStores:(NSSet *)values;
- (void)removeLinkedStores:(NSSet *)values;

- (void)addPotentialStoresObject:(Store *)value;
- (void)removePotentialStoresObject:(Store *)value;
- (void)addPotentialStores:(NSSet *)values;
- (void)removePotentialStores:(NSSet *)values;

@end
