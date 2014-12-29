//
//  ParkingViewController.m
//  WO
//
//  Created by Ezra on 12/26/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//

#import "ParkingViewController.h"
#import "MenuCollectionCell.h"

typedef NS_ENUM(NSInteger, WOMenuItemsForAlreadyParked) {
    WOFindMyCar,
    WOUnsaveLocation,
};

typedef NS_ENUM(NSInteger, WOMenuItemsForNotParked) {
    WOSaveCurrentParkingLocation,
    WORecommendParking,
};

NSString * const kWOFindMyCar = @"Find My Car";
NSString * const kWOUnsaveLocation = @"Unsave Location";
NSString * const kWOSaveCurrnetParkingLocation = @"Save Current Parking Location";
NSString * const kWORecommendParking = @"Recommend Parking";

@interface ParkingViewController ()

@property (nonatomic) BOOL isCarLocationSaved;
@property (strong, nonatomic) NSMutableArray *parkingMenuItems;
@property (weak, nonatomic) IBOutlet UICollectionView *parkingMenuCollectionView;

@end

@implementation ParkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.isCarLocationSaved = YES;
    
    [self drawParkingMenuItems];
    
    [self.parkingMenuCollectionView registerNib:[UINib nibWithNibName:@"CollectionCell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
    
    [self setMenuCollectionViewSize];
}

- (void)setMenuCollectionViewSize {
    [self.parkingMenuCollectionView removeConstraints:self.parkingMenuCollectionView.constraints];
    NSLayoutConstraint *con1 = [NSLayoutConstraint constraintWithItem:self.parkingMenuCollectionView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.parkingMenuCollectionView attribute:NSLayoutAttributeWidth multiplier:0.5  constant:5];
    [self.parkingMenuCollectionView addConstraints:@[con1]];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    float cellSideLength = (collectionView.frame.size.width - 30) / 2;
    return CGSizeMake(cellSideLength, cellSideLength);
}

- (void)drawParkingMenuItems {
    
    [self.parkingMenuItems removeAllObjects];
    
    if (self.isCarLocationSaved) {
        self.parkingMenuItems = [NSMutableArray arrayWithObjects:kWOFindMyCar,kWOUnsaveLocation,nil];
    } else {
        self.parkingMenuItems = [NSMutableArray arrayWithObjects:kWOSaveCurrnetParkingLocation,kWORecommendParking,nil];
    }
}

#pragma mark - UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.parkingMenuItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MenuCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.titleLabel.text = [self.parkingMenuItems objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.isCarLocationSaved) {
        if (indexPath.row == WOFindMyCar) {
            NSLog(@"Execute code to find my car");
        } else if (indexPath.row == WOUnsaveLocation) {
            NSLog(@"Execute code to unsave the location");
            [self carLocationSavedChanged];
        }
        
    } else {
        if (indexPath.row == WOSaveCurrentParkingLocation) {
            NSLog(@"Execute code save current parking location");
            [self carLocationSavedChanged];
        } else if (indexPath.row == WORecommendParking) {
            NSLog(@"Execute code to recommend parking");
        }
    }
}

- (void)carLocationSavedChanged {
    if (self.isCarLocationSaved) {
        self.isCarLocationSaved = NO;
        NSLog(@"Car Location Saved now equals NO");
        //additional code to update stuff now
    } else {
        self.isCarLocationSaved = YES;
        NSLog(@"Car Location Saved now equals YES");
        //additional code to update stuff now
    }
    [self updateUserInterface];
}

- (void)updateUserInterface{
    //code to refresh shit
    [self drawParkingMenuItems];
    [self.parkingMenuCollectionView reloadData];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
