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
#import "AddAccViewController.h"

@interface TGLViewController ()
@property (strong, readonly, nonatomic) NSMutableArray *cards;
@property (nonatomic, assign) BOOL doubleTapToClose;
@end

@implementation TGLViewController

@synthesize cards = _cards;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"账号";
    
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAccount)];
    
    UIBarButtonItem *searchBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAccount)];
    
    NSArray *btnArr = [NSArray arrayWithObjects:saveBtn,searchBtn,nil];
    
    [self.navigationItem setRightBarButtonItems:btnArr
                                       animated:YES];
    
    self.navigationController.toolbarHidden = YES;
    
    self.stackedLayout.layoutMargin = UIEdgeInsetsZero;
    
    self.exposedLayoutMargin = UIEdgeInsetsMake(20, 0, 0,0);
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.stackedLayout.fillHeight = YES;
    
    self.stackedLayout.alwaysBounce = YES;
    
    self.stackedLayout.topReveal = 60;
    
    self.unexposedItemsAreSelectable = YES;
  }

-(void)searchAccount{
    NSLog(@"显示搜索框");
    
    
    
}

-(void)addAccount{
    NSLog(@"跳转到添加页面");
    AddAccViewController *myBusinessVC = [[AddAccViewController alloc]initWithNibName:@"AddAccViewController" bundle:nil];
    [self.navigationController pushViewController:myBusinessVC animated:YES];
}

-(void)viewWillAppear:(BOOL)animated{
     _cards = [Account searchWithWhere:nil orderBy:nil offset:0 count:0];
    [self.collectionView reloadData];
}

#pragma mark - Accessors

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
 
    Account *account = self.cards[indexPath.item];
    cell.color = [UIColor getRandomColor];
    cell.titleLabel.text = account.userName;
    //cell.titleLabel.textColor = [UIColor getRandomColor];
    cell.phoneView.text = account.phone;
    cell.pwdView.text = account.pwd;
    cell.remarkView.text = account.remarks;

    return cell;
}

#pragma mark - Overloaded methods

- (void)moveItemAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath{
    NSDictionary *card = self.cards[fromIndexPath.item];
    [self.cards removeObjectAtIndex:fromIndexPath.item];
    [self.cards insertObject:card atIndex:toIndexPath.item];
}


@end
