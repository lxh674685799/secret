//
//  accountType.h
//  trunk
//
//  Created by 刘旭辉 on 15/7/28.
//  Copyright (c) 2015年 LXH. All rights reserved.
//  账号类型

#import <Foundation/Foundation.h>

@interface AccountType : NSObject

//类型名称
@property(copy,nonatomic)NSString* typeName;
//相关网站
@property(copy,nonatomic)NSString* webURL ;
//图片地址
@property(copy,nonatomic)NSString* imgPath ;
//创建时间
@property(copy,nonatomic)NSString* createTime;

@end
