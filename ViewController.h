//
//  ViewController.h
//  secret
//
//  Created by 刘旭辉 on 15/7/1.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LNERadialMenu.h"
#import "UIColor+CatColors.h"
#import "MainView.h"
#import "RGCardViewController.h"
#import "TGLViewController.h"
#import "SettingViewController.h"


@interface ViewController : UIViewController<LNERadialMenuDataSource, LNERadialMenuDelegate>{
    UIWebView *webView;
}

@property (nonatomic) NSMutableArray *views;

@end

