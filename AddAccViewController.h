//
//  AddAccViewController.h
//  secret
//
//  Created by 刘旭辉 on 15/7/29.
//  Copyright (c) 2015年 LXH. All rights reserved.
//  添加用户

#import <UIKit/UIKit.h>
#import "Account.h"
@interface AddAccViewController : UIViewController{
    Account *account ;
}
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@end