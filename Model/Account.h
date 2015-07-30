//
//  account.h
//  trunk
//
//  Created by 刘旭辉 on 15/7/28.
//  Copyright (c) 2015年 LXH. All rights reserved.
//  账号

#import <Foundation/Foundation.h>
#import "AccountType.h"

@interface Account : NSObject

//用户名
@property(copy,nonatomic)NSString* userName;
//密码
@property(copy,nonatomic)NSString* pwd;
//密码
@property(copy,nonatomic)NSString* phone;
//密码
@property(copy,nonatomic)NSString* createTime;
//备注
@property(copy,nonatomic)NSString* remarks;
//类型
@property(strong,nonatomic)AccountType* type;

@end
