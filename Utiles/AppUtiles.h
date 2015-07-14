//
//  AppUtiles.h
//  kuaixiao
//
//  Created by 刘旭辉 on 14/12/9.
//  Copyright (c) 2014年 邹克鹏. All rights reserved.
//


#import <Foundation/Foundation.h>
//指纹识别
#import <LocalAuthentication/LocalAuthentication.h>

@interface AppUtiles : NSObject

/********************** System Utils ***********************/
//弹出UIAlertView
+ (void)showAlertMessage:(NSString *)msg;
//关闭键盘
+ (void)closeKeyboard;
/******* UITableView & UINavigationController Utils *******/
//返回View覆盖多余的tableview cell线条
+ (UIView *)tableViewsFooterView;
//返回UILabel作为UITableView的header
+ (UILabel *)tableViewsHeaderLabelWithMessage:(NSString *)message;
//获取没有文字的导航栏返回按钮
+ (UIBarButtonItem *)navigationBackButtonWithNoTitle;
// 返回当前活动的viewController
+ (UIViewController *)getCurrentVC;
// 显示手势解锁
+ (void)showPassWordView;
// 显示指纹解锁
+ (void)showTouchId;
// 显示密码输入框


@end
