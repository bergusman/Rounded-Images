//
//  VBCell.m
//  Rounded Images
//
//  Created by Vitaly Berg on 24.07.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "VBCell.h"

#import <QuartzCore/QuartzCore.h>

#import <SDWebImage/UIImageView+WebCache.h>

@interface VBCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation VBCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    //shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 160, 80) cornerRadius:10].CGPath;
    //shapeLayer.fillColor = [UIColor redColor].CGColor;
    
    shapeLayer.shadowOffset = CGSizeMake(0, 0);
    shapeLayer.shadowOpacity = 0.5;
    shapeLayer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 160, 80) cornerRadius:10].CGPath;
    [self.contentView.layer addSublayer:shapeLayer];
    
    
    //self.photoImageView.layer.cornerRadius = 10;
    //self.photoImageView.layer.masksToBounds = YES;
    
    //self.photoImageView.layer.shadowOffset = CGSizeMake(0, 0);
    //self.photoImageView.layer.shadowOpacity = 0.5;
    //self.photoImageView.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 160, 80) cornerRadius:10].CGPath;
}

@end
