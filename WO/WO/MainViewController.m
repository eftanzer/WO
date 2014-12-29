//
//  MainViewController.m
//  WO
//
//  Created by Ezra on 12/26/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//

#import "MainViewController.h"
#import "MenuCollectionCell.h"
#import "ParkingViewController.h"

typedef NS_ENUM(NSInteger, WOMenuItems) {
    WOMallMap,
    WOShoppingList,
    WOMyTrip,
    WOParking,
    WOInfo,
    WOResetTrip,
};


NSString * const kWOMallMap = @"Mall Map";
NSString * const kWOShoppingList = @"Shopping List";
NSString * const kWOMyTrip = @"My Trip";
NSString * const kWOParking = @"Parking";
NSString * const kWOInfo = @"Info";
NSString * const kWOResetTrip = @"Reset Trip";


NSString * const kWOMallMapSegue = @"MallMapSegue";
NSString * const kWOShoppingListSegue = @"ShoppingListSegue";
NSString * const kWOMyTripSegue = @"MyTripSegue";
NSString * const kWOParkingSegue = @"ParkingSegue";
NSString * const kWOInfoSegue = @"InfoSegue";

NSInteger const kWONumberOfMenuItems = 6;

@interface MainViewController ()

//@property (strong, nonatomic) NSArray *menuItems;
//@property (strong, nonatomic) NSArray *menuItemSegues;
@property (weak, nonatomic) IBOutlet UICollectionView *menuCollectionView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //self.menuItems = @[@"Parking",@"Mall Map",@"Stores",@"Pee",@"Info",@"Shopping List",@"Route"];
    //self.menuItemSegues = @[@"parkingSegue",@"mallMapSegue",@"storesSegue",@"peeSegue",@"infoSegue",@"shoppingListSegue",@"routeSegue"];
    
    [self.menuCollectionView registerNib:[UINib nibWithNibName:@"CollectionCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    
    [self setMenuCollectionViewSize];
}

- (void)setMenuCollectionViewSize {
    [self.menuCollectionView removeConstraints:self.menuCollectionView.constraints];
    NSLayoutConstraint *con1 = [NSLayoutConstraint constraintWithItem:self.menuCollectionView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.menuCollectionView attribute:NSLayoutAttributeWidth multiplier:1.5  constant:-5];
    [self.menuCollectionView addConstraints:@[con1]];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    float cellSideLength = (collectionView.frame.size.width - 30) / 2;
    return CGSizeMake(cellSideLength, cellSideLength);
}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return kWONumberOfMenuItems;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MenuCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString *menuTitleText = nil;
    
    switch (indexPath.row) {
        case WOMallMap: menuTitleText = kWOMallMap; break;
        case WOShoppingList: menuTitleText = kWOShoppingList; break;
        case WOMyTrip: menuTitleText = kWOMyTrip; break;
        case WOParking: menuTitleText = kWOParking; break;
        case WOInfo: menuTitleText = kWOInfo; break;
        case WOResetTrip: menuTitleText = kWOResetTrip; break;
        default: nil;
    }
    //cell.titleLabel.text = [self.menuItems objectAtIndex:indexPath.row];
    cell.titleLabel.text = menuTitleText;
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *segueName = nil;
    switch (indexPath.row) {
        
        case WOMallMap: segueName = kWOMallMapSegue; break;
        case WOShoppingList: segueName = kWOShoppingListSegue; break;
        case WOMyTrip: segueName = kWOMyTripSegue; break;
        case WOParking: segueName = kWOParkingSegue; break;
        case WOInfo: segueName = kWOInfoSegue; break;
        default: nil;
    }
    
    if (indexPath.row == WOResetTrip) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reset?"
                                                        message:@"This will erase your stores, shopping list, and parking."
                                                       delegate:self
                                              cancelButtonTitle:@"Cancel"
                                              otherButtonTitles:@"Reset", nil];
        [alert show];
    } else {
        [self performSegueWithIdentifier:segueName sender:nil];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    // the user clicked OK
    if (buttonIndex) {
        //code to reset trip, wiping out everything that is saved
    }
}

@end
