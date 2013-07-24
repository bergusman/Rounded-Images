//
//  VBViewController.m
//  Rounded Images
//
//  Created by Vitaly Berg on 24.07.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "VBViewController.h"
#import "VBCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface VBViewController ()

@property (strong, nonatomic) NSMutableArray *items;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation VBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    self.items = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        /*
        [self.items addObject:@"http://farm9.staticflickr.com/8455/7944486832_467cd9b664_b.jpg"];
        [self.items addObject:@"http://farm9.staticflickr.com/8434/7557382036_b84a2f5597_b.jpg"];
        [self.items addObject:@"http://farm8.staticflickr.com/7112/7437229256_c95a9d0d57_b.jpg"];
        [self.items addObject:@"http://farm9.staticflickr.com/8439/7822149328_c8634296ff_b.jpg"];
        [self.items addObject:@"http://farm9.staticflickr.com/8146/7423119394_d36b255e3e_b.jpg"];
        [self.items addObject:@"http://farm8.staticflickr.com/7084/7157264045_112b0fda33_b.jpg"];
        [self.items addObject:@"http://farm8.staticflickr.com/7084/7302900070_7749dff2a9_b.jpg"];
        [self.items addObject:@"http://farm9.staticflickr.com/8164/7533015734_78d90239e9_b.jpg"];
         */
        
        
    }
}

#pragma mark - Setups

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([VBCell class]) bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cell"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellId = @"cell";
    VBCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    NSString *item = self.items[indexPath.row];
    [cell.photoImageView setImageWithURL:[NSURL URLWithString:item] placeholderImage:nil];
    
    return cell;
}

#pragma mark - UITableViewDelegate

@end
