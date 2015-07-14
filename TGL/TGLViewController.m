//
//  TGLViewController.m
//  secret
//
//  Created by 刘旭辉 on 15/7/8.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "TGLViewController.h"
#import "UIColor+CatColors.h"
#import "TGLCollectionViewCell.h"

@interface TGLViewController ()
@property (strong, readonly, nonatomic) NSMutableArray *cards;
@property (nonatomic, assign) BOOL doubleTapToClose;
@end

@implementation TGLViewController

@synthesize cards = _cards;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"账号";
    
    self.navigationController.toolbarHidden = YES;
    
    self.stackedLayout.layoutMargin = UIEdgeInsetsZero;
    
    self.exposedLayoutMargin = UIEdgeInsetsMake(20, 0, 0.0, 0.0);
   // self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.stackedLayout.fillHeight = YES;
    
    self.stackedLayout.alwaysBounce = YES;
    
    self.stackedLayout.topReveal = 60;
    
    self.unexposedItemsAreSelectable = YES;
  }

#pragma mark - Accessors

- (NSMutableArray *)cards {
    
    if (_cards == nil) {
        
        NSArray *cards = @[ @{ @"name" : @"Card #0", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #1", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #2", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #3", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #4", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #5", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #6", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #7", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #8", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #8", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #8", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #8", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #8", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #8", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #8", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #8", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #8", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #8", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #8", @"color" : [UIColor getRandomColor] },
                            @{ @"name" : @"Card #9", @"color" : [UIColor getRandomColor] }];
        
        _cards = [NSMutableArray arrayWithArray:cards];
    }
    
    return _cards;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
}

#pragma mark - CollectionViewDataSource protocol

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.cards.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UINib *nib = [UINib nibWithNibName:@"TGLCollectionViewCell"
                                bundle: [NSBundle mainBundle]];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"CardCell"];
    TGLCollectionViewCell *cell = [[TGLCollectionViewCell alloc]init];
    cell = [collectionView dequeueReusableCellWithReuseIdentifier: @"CardCell"
                                                     forIndexPath:indexPath];
    NSDictionary *card = self.cards[indexPath.item];
    cell.color = card[@"color"];
    cell.titleLabel.text = [NSString stringWithFormat:@"标题----》%ld",(long)indexPath.item];
    cell.titleLabel.textColor = [UIColor getRandomColor];

    return cell;
}

#pragma mark - Overloaded methods

- (void)moveItemAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    NSDictionary *card = self.cards[fromIndexPath.item];
    [self.cards removeObjectAtIndex:fromIndexPath.item];
    [self.cards insertObject:card atIndex:toIndexPath.item];
}


@end
