//
//  ShoppingListItemDetailViewController.m
//  WO
//
//  Created by Ezra on 12/26/14.
//  Copyright (c) 2014 CozE. All rights reserved.
//

#import "ShoppingListItemDetailViewController.h"

@interface ShoppingListItemDetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ShoppingListItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"StoreCell"];
    
    return cell;
}

- (IBAction)categoryButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"CategorySegue" sender:nil];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"CategorySegue"]) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the shoppingListItem to the new view controller.
    }
}
    

@end
