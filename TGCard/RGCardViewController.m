//
//  RGCardViewController.m
//  secret
//
//  Created by 刘旭辉 on 15/7/8.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "RGCardViewController.h"

@interface RGCardViewController ()

@end

@implementation RGCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"账号";
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  4;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UINib *nib = [UINib nibWithNibName:@"RGCardCollectionViewCell"
                                bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"RGcardCell"];
    RGCardCollectionViewCell *cell = [[RGCardCollectionViewCell alloc]init];
    cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"RGcardCell"
                                                     forIndexPath:indexPath];
    
    [self configureCell:cell withIndexPath:indexPath];
    cell.color =  [UIColor getRandomColor];
    return cell;
}

- (void)configureCell:(RGCardCollectionViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    UIView  *subview = [cell.contentView viewWithTag:TAG];
    [subview removeFromSuperview];
    
    switch (indexPath.section) {
        case 0:
            cell.imageView.image =  [UIImage imageNamed:@"i1"];
            cell.mainLabel.text = @"Glaciers";
            break;
        case 1:
            cell.imageView.image =  [UIImage imageNamed:@"i2"];
            cell.mainLabel.text = @"Parrots";
            break;
        case 2:
            cell.imageView.image =  [UIImage imageNamed:@"i3"];
            cell.mainLabel.text = @"Whales";
            break;
        case 3:
            cell.imageView.image =  [UIImage imageNamed:@"i4"];
            cell.mainLabel.text = @"Lake View";
            break;
        case 4:
            cell.imageView.image =  [UIImage imageNamed:@"i5"];
            break;
        default:
            break;
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"选中的cell---------->%@",indexPath);
    
}

@end
