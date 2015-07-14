//
//  ViewController.m
//  secret
//
//  Created by 刘旭辉 on 15/7/1.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "ViewController.h"
#import "CoreArchive.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (ios8x) {
        [AppUtiles showTouchId];
    }else{
        [AppUtiles showPassWordView];
    }
}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(presentMenu:)];
    longPressRecognizer.minimumPressDuration = 1;
    
    [self.view addGestureRecognizer:longPressRecognizer];
}

-(void) presentMenu:(UILongPressGestureRecognizer *)gestureRecognizer{
    CGPoint location = [gestureRecognizer locationInView:self.view];
    if(gestureRecognizer.state == UIGestureRecognizerStateBegan){
        LNERadialMenu *thisMenu = [[LNERadialMenu alloc] initFromPoint:location withDataSource:self andDelegate:self];
        
        [thisMenu showMenu];
    }
}

#pragma mark - Radial Menu datasource and delegate
-(NSInteger) numberOfButtonsForRadialMenu:(LNERadialMenu *)radialMenu{
    return 4;
}

-(CGFloat) radiusLenghtForRadialMenu:(LNERadialMenu *)radialMenu{
    return 50;
}

-(UIButton *)radialMenu:(LNERadialMenu *)radialMenu elementAtIndex:(NSInteger)index{
    
    UIButton *element = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    element.tag = index;

    switch (index) {
        case 0:
        {
            [element setBackgroundImage:[UIImage imageNamed:@"add.png"]forState:UIControlStateNormal];
        }
            break;
        case 1:
        {
           [element setBackgroundImage:[UIImage imageNamed:@"search.png"]forState:UIControlStateNormal];
        }
            break;
        case 2:
        {
           [element setBackgroundImage:[UIImage imageNamed:@"world.png"]forState:UIControlStateNormal];
        }
            break;
        case 3:
        {
           [element setBackgroundImage:[UIImage imageNamed:@"setting.png"]forState:UIControlStateNormal];
        }
            break;
        default:
            break;
    }
       return element;
}

-(void)radialMenu:(LNERadialMenu *)radialMenu didSelectButton:(UIButton *)button{
    NSLog(@"button(element) index:%ld",(long)button.tag);
    [radialMenu closeMenu];
    
    switch (button.tag) {
        case 0:
        {
           
        }
            break;
        case 1:
        {
            [CLLockVC showModifyLockVCInVC:[AppUtiles getCurrentVC] successBlock:^(CLLockVC *lockVC, NSString *pwd) {
                NSLog(@"修改密码");
                [lockVC dismiss:1.0f];
            }];
        }
            break;
        case 2:
        {
            [CLLockVC showSettingLockVCInVC:[AppUtiles getCurrentVC] successBlock:^(CLLockVC *lockVC, NSString *pwd) {
                NSLog(@"密码设置成功");
                [lockVC dismiss:1.0f];
            }];

        }
            break;
        case 3:
        {
            SettingViewController *settingView = [[SettingViewController alloc]initWithNibName:@"SettingViewController" bundle:nil];
            [self.navigationController pushViewController:settingView animated:YES];
        }
            break;
        default:
            break;
    }

}

-(UIView *)viewForCenterOfRadialMenu:(LNERadialMenu *)radialMenu{
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20,20)];
    centerView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    return centerView;
}

-(void)radialMenu:(LNERadialMenu *)radialMenu customizationForRadialMenuView:(UIView *)radialMenuView{
    CALayer *bgLayer = [CALayer layer];
    bgLayer.backgroundColor = [UIColor clearColor].CGColor;
    bgLayer.borderColor = [UIColor colorWithWhite:200.0/255.0 alpha:1].CGColor;
    bgLayer.borderWidth = 1;
    bgLayer.cornerRadius = radialMenu.menuRadius;
    bgLayer.frame = CGRectMake(radialMenuView.frame.size.width/2.0-radialMenu.menuRadius, radialMenuView.frame.size.height/2.0-radialMenu.menuRadius, radialMenu.menuRadius*2, radialMenu.menuRadius*2);
    [radialMenuView.layer insertSublayer:bgLayer atIndex:0];
}

-(BOOL)canDragRadialMenu:(LNERadialMenu *)radialMenu{
    return YES;
}

//显示GIF图片
-(void)loadGifView{
    self.navigationController.navigationBarHidden = YES;
    // 设定位置和大小
    CGRect frame = CGRectMake(0,0,ScreenWidth,ScreenHeight);
  //  frame.size = [UIImage imageNamed:@"launch.gif"].size;
    // 读取gif图片数据
    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"launch" ofType:@"gif"]];
    // view生成
    webView = [[UIWebView alloc] initWithFrame:frame];
    webView.userInteractionEnabled = NO;//用户不可交互
    [webView loadData:gif MIMEType:@"image/gif" textEncodingName:nil baseURL:nil];
    webView.scalesPageToFit = YES;
    
    [self.view addSubview:webView];
    
    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(removewebView) userInfo:nil repeats:NO];
}

-(void)removewebView{
    self.navigationController.navigationBarHidden = NO;
    [webView removeFromSuperview];
    [AppUtiles showTouchId];
}

//跳转纵向页面
- (IBAction)toTGLView:(id)sender {
    RGCardViewController *myBusinessVC = [[RGCardViewController alloc]initWithNibName:@"RGCardViewController" bundle:nil];
     [self.navigationController pushViewController:myBusinessVC animated:YES];
}

//跳转横向页面
- (IBAction)toRGCardView:(id)sender {
    TGLViewController *myBusinessVC = [[TGLViewController alloc]initWithNibName:@"TGLViewController" bundle:nil];
    
     [self.navigationController pushViewController:myBusinessVC animated:YES];
    
}

@end
