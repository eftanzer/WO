//
//  ProductCategory.h
//  WO
//
//  Created by Ezra on 12/29/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductCategory : NSObject

@property (strong, nonatomic) NSString *name;

+(NSArray *)listOfCategories;

@end
