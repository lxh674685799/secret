//
//  AddAccViewController.m
//  secret
//
//  Created by 刘旭辉 on 15/7/29.
//  Copyright (c) 2015年 LXH. All rights reserved.
//

#import "AddAccViewController.h"


@interface AddAccViewController ()
@property (weak, nonatomic) IBOutlet UITextView *remarksField;

@end

@implementation AddAccViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
    
    self.navigationItem.title = @"账号";
    
    UIBarButtonItem *startBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveBtn)];
    
    [self.navigationItem setRightBarButtonItem:startBtn];
   
    [self initView];
}


-(void)initView{
    _remarksField.layer.backgroundColor = [[UIColor clearColor] CGColor];
    _remarksField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _remarksField.layer.borderWidth = 3.0;
    _remarksField.layer.cornerRadius = 8.0f;
    [_remarksField.layer setMasksToBounds:YES];
}

-(void)saveBtn{
    NSLog(@"执行保存操作");
    account = [[Account alloc]init];
    account.userName = _userNameField.text;
    account.pwd = _pwdField.text;
    account.phone = _phoneField.text;
    account.remarks = _remarksField.text;
    
   BOOL save =  [account saveToDB];
    
    if (save) {
        NSLog(@"保存成功");
        
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        NSLog(@"保存失败");
    }
}

// 键盘消失
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


@end
