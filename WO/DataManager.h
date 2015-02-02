//
//  DataManager.h
//  WO
//
//  Created by Ezra on 2/2/15.
//  Copyright (c) 2015 CozE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Store;
@class Trip;
@class ShoppingListItem;
@class ShoppingCategory;

@interface DataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (id)sharedDataManager;

// Stock methods
- (void)saveContext;

// Custom methods
- (Trip *)fetchTrip;

@end
