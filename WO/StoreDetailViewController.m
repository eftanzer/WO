//
//  StoreDetailViewController.m
//  WO
//
//  Created by Ezra on 12/26/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//
//
#import "StoreDetailViewController.h"
#import "Store.h"
#import "DataManager.h"
#import "Trip.h"

@interface StoreDetailViewController ()

@end

@implementation StoreDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view.

}

- (void)setup {
    self.title = self.store.name;
    [self setAddOrRemoveFromTripButtonTitle];
}

- (void)setAddOrRemoveFromTripButtonTitle {
    if (self.store.trip) {
        [self.addToTripButton setTitle:@"Remove From Trip" forState:UIControlStateNormal];
    } else {
        [self.addToTripButton setTitle:@"Add To Trip" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addToTripButtonPressed:(id)sender {
    Trip *trip = [[DataManager sharedDataManager] fetchTrip];
    if (self.store.trip) {
        [trip removeStoresOnTripObject:self.store];
    } else {
       [trip addStoresOnTripObject:self.store];
    }
    [[DataManager sharedDataManager] saveContext];
    [self setAddOrRemoveFromTripButtonTitle];
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
