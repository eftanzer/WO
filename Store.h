//
//  Store.h
//  WO
//
//  Created by Ezra on 1/7/15.
//  Copyright (c) 2015 CozE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Store : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * tripOrder;

@end
