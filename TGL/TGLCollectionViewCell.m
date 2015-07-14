//
//  TGLCollectionViewCell.m
//  secret
//
//  Created by 刘旭辉 on 15/7/8.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "TGLCollectionViewCell.h"

@implementation TGLCollectionViewCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.opaque = NO;
    self.backgroundColor = [UIColor clearColor];
    
    self.roundedView.backgroundColor = self.color;
    self.roundedView.layer.cornerRadius = 10.0;
    self.roundedView.layer.borderWidth = 1.0;
    //  self.roundedView.layer.borderColor = [UIColor blackColor].CGColor;
}

#pragma mark - Accessors

- (void)setColor:(UIColor *)color {
    
    _color = [color copy];
    
    self.roundedView.backgroundColor = self.color;
}

#pragma mark - Methods

- (void)setSelected:(BOOL)selected {
    
    [super setSelected:selected];
    
    self.roundedView.layer.borderColor = self.selected ? [UIColor whiteColor].CGColor : [UIColor blackColor].CGColor;
}


@end
