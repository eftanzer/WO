//
//  StoreListStoreTableViewCell.h
//  WO
//
//  Created by Ezra on 1/8/15.
//  Copyright (c) 2015 CozE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreListStoreTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *storeNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *addedToTripButton;
@property (weak, nonatomic) IBOutlet UIButton *getDirectionsButton;

@end
