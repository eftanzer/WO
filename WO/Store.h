//
//  Store.h
//  WO
//
//  Created by Ezra on 12/28/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *hours;
@property (strong, nonatomic) NSString *phoneNumber;
@property (nonatomic) BOOL addedtoTrip;
@property (strong, nonatomic) NSNumber *tripNumber;

+(NSArray *)listOfStores;

@end
