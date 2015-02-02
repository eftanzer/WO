//
//  StoreDetailViewController.h
//  WO
//
//  Created by Ezra on 12/26/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//
//
#import <UIKit/UIKit.h>
#import "Store.h"

@interface StoreDetailViewController : UIViewController

@property (strong, nonatomic) Store *store;
@property (weak, nonatomic) IBOutlet UIButton *addToTripButton;

@end
