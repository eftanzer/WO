//
//  AppDelegate.m
//  WO
//
//  Created by Ezra on 12/26/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//

#import "AppDelegate.h"
#import "ShoppingCategory.h"
#import "ShoppingListItem.h"
#import "Store.h"
#import "Trip.h"
#import "DataManager.h"

@interface AppDelegate ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.managedObjectContext = [[DataManager sharedDataManager] managedObjectContext];
    self.managedObjectModel = [[DataManager sharedDataManager] managedObjectModel];
    self.persistentStoreCoordinator = [[DataManager sharedDataManager] persistentStoreCoordinator];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"HasLaunchedOnce"])
    {
        //Just chill. Don't add anything to Core Data
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"HasLaunchedOnce"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        // This is the first launch ever
        
        NSError *error = nil;
        
        //Create 1 trip
        NSEntityDescription *entityTrip = [NSEntityDescription entityForName:@"Trip" inManagedObjectContext:self.managedObjectContext];
        Trip *trip = [[Trip alloc] initWithEntity:entityTrip insertIntoManagedObjectContext:self.managedObjectContext];
        
        if (![trip.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        //Create 3 stores
        NSEntityDescription *entityStore = [NSEntityDescription entityForName:@"Store" inManagedObjectContext:self.managedObjectContext];
        
        Store *store1 = [[Store alloc] initWithEntity:entityStore insertIntoManagedObjectContext:self.managedObjectContext];
        store1.name = @"J Crew";
        store1.desc = @"We sell classy, overpriced, I'm-Better-Than-You-Style outfits to preppy young men & women.";
        store1.primaryCategory = @"Designer Fashion and Sportswear";
        
        if (![store1.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        Store *store2 = [[Store alloc] initWithEntity:entityStore insertIntoManagedObjectContext:self.managedObjectContext];
        store2.name = @"Oakley Vault";
        store2.desc = @"Want to look like a douchebag? Buy sunglasses here!";
        store2.primaryCategory = @"Sportswear";
        
        if (![store2.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        Store *store3 = [[Store alloc] initWithEntity:entityStore insertIntoManagedObjectContext:self.managedObjectContext];
        store3.name = @"Reebok";
        store3.desc = @"We sell generic sneakers in bulk to your grandfather.";
        store3.primaryCategory = @"Designer Fashion and Sportswear";
        
        [store1 setValue:@"J Crew" forKey:@"name"];
        [store1 setValue:@"We sell classy, overpriced, I'm-Better-Than-You-Style outfits to preppy young men & women." forKey:@"desc"];
    
        if (![store3.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        //Create 10 Shopping Categories
        
        NSEntityDescription *entityShoppingCategory = [NSEntityDescription entityForName:@"ShoppingCategory" inManagedObjectContext:self.managedObjectContext];
        
        ShoppingCategory *shoppingCategory1 = [[ShoppingCategory alloc] initWithEntity:entityShoppingCategory insertIntoManagedObjectContext:self.managedObjectContext];
        shoppingCategory1.name = @"Shoes";
        
        if (![shoppingCategory1.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        ShoppingCategory *shoppingCategory2 = [[ShoppingCategory alloc] initWithEntity:entityShoppingCategory insertIntoManagedObjectContext:self.managedObjectContext];
        shoppingCategory2.name = @"Clothing";
        
        if (![shoppingCategory2.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        ShoppingCategory *shoppingCategory3 = [[ShoppingCategory alloc] initWithEntity:entityShoppingCategory insertIntoManagedObjectContext:self.managedObjectContext];
        shoppingCategory3.name = @"Athletic Clothing";
        
        if (![shoppingCategory3.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        ShoppingCategory *shoppingCategory4 = [[ShoppingCategory alloc] initWithEntity:entityShoppingCategory insertIntoManagedObjectContext:self.managedObjectContext];
        shoppingCategory4.name = @"Sneakers";
        
        if (![shoppingCategory4.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        ShoppingCategory *shoppingCategory5 = [[ShoppingCategory alloc] initWithEntity:entityShoppingCategory insertIntoManagedObjectContext:self.managedObjectContext];
        shoppingCategory5.name = @"Dress Shoes";
        
        if (![shoppingCategory5.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        ShoppingCategory *shoppingCategory6 = [[ShoppingCategory alloc] initWithEntity:entityShoppingCategory insertIntoManagedObjectContext:self.managedObjectContext];
        shoppingCategory6.name = @"Glasses";
        
        if (![shoppingCategory6.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        ShoppingCategory *shoppingCategory7 = [[ShoppingCategory alloc] initWithEntity:entityShoppingCategory insertIntoManagedObjectContext:self.managedObjectContext];
        shoppingCategory7.name = @"Sunglasses";
        
        if (![shoppingCategory7.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        ShoppingCategory *shoppingCategory8 = [[ShoppingCategory alloc] initWithEntity:entityShoppingCategory insertIntoManagedObjectContext:self.managedObjectContext];
        shoppingCategory8.name = @"Shirts";
        
        if (![shoppingCategory8.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        ShoppingCategory *shoppingCategory9 = [[ShoppingCategory alloc] initWithEntity:entityShoppingCategory insertIntoManagedObjectContext:self.managedObjectContext];
        shoppingCategory9.name = @"Jeans";
        
        if (![shoppingCategory9.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        ShoppingCategory *shoppingCategory10 = [[ShoppingCategory alloc] initWithEntity:entityShoppingCategory insertIntoManagedObjectContext:self.managedObjectContext];
        shoppingCategory10.name = @"Socks";
        
        if (![shoppingCategory10.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
        }
        
        //Add categories to stores
        [store1 addCategories: [NSSet setWithArray:@[shoppingCategory1, shoppingCategory2, shoppingCategory5, shoppingCategory7, shoppingCategory8, shoppingCategory9, shoppingCategory10]]];
        
        if (![store1.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);

        }
        
        [store2 addCategories: [NSSet setWithArray:@[shoppingCategory6, shoppingCategory7]]];
    
        if (![store2.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
            
        }
        
        [store3 addCategories: [NSSet setWithArray:@[shoppingCategory1, shoppingCategory2, shoppingCategory3, shoppingCategory4, shoppingCategory7, shoppingCategory8, shoppingCategory10]]];
        
        if (![store3.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
            
        }
        
        //Add store to trip (TEST ONLY)
        [trip addStoresOnTripObject:store1];
        
        if (![trip.managedObjectContext save:&error]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@ %@",error, error.localizedDescription);
            
        }
        
    }

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [[DataManager sharedDataManager] saveContext];
}

@end
