//
//  TGLCollectionViewCell.h
//  secret
//
//  Created by 刘旭辉 on 15/7/8.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TGLCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *roundedView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (copy, nonatomic) UIColor *color;
@property (weak, nonatomic) IBOutlet UITextView *remarkView;
@property (weak, nonatomic) IBOutlet UILabel *phoneView;
@property (weak, nonatomic) IBOutlet UILabel *pwdView;
@end
