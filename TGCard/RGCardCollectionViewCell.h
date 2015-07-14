//
//  RGCardCollectionViewCell.h
//  secret
//
//  Created by 刘旭辉 on 15/7/8.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGCardCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UIView *roundedView;
@property (copy, nonatomic) UIColor *color;
@end
