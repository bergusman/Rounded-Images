//
//  VBImageView.m
//  Rounded Images
//
//  Created by Vitaly Berg on 24.07.13.
//  Copyright (c) 2013 Vitaly Berg. All rights reserved.
//

#import "VBImageView.h"

#import "UIImage+Resize.h"
#import "UIImage+RoundedCorner.h"

#import <QuartzCore/QuartzCore.h>

@interface VBInnerImageView : UIView

@property (strong, nonatomic) UIImage *image;

@end

@implementation VBInnerImageView

- (void)drawRect:(CGRect)rect {
    //[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) cornerRadius:10] addClip];
    //[self.image drawInRect:rect];
    [self.image drawAtPoint:CGPointMake(0, 0)];
}

@end



@interface VBImageView ()

@property (strong, nonatomic) VBInnerImageView *innerImageView;

@end


@implementation VBImageView {
    NSInteger index;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.innerImageView = [[VBInnerImageView alloc] init];
    self.innerImageView.frame = self.bounds;
    self.innerImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.innerImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.innerImageView];
    
    
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 0.5;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10].CGPath;
    
    
}

- (void)setImage:(UIImage *)image {
    if (!image) {
        super.image = nil;
        self.innerImageView.image = nil;
        [self.innerImageView setNeedsDisplay];
        return;
    }
    
    //image = [image resizedImage:self.bounds.size interpolationQuality:kCGInterpolationMedium];
    //image = [image roundedCornerImage:10 borderSize:0];
    
    super.image = image;
    self.innerImageView.image = image;
    [self.innerImageView setNeedsDisplay];
    
    return;
    index++;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, [UIScreen mainScreen].scale);
        
        [image drawInRect:self.bounds];
        
        UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        index--;
        
        if (index == 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                super.image = resultImage;
            });
        }
    });
    
    
    
    
   
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10].CGPath;
}


@end
