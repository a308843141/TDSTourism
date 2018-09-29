//
//  ResultModel.h
//  StudentBenefit
//
//  Created by 恒悦科技 on 2017/6/21.
//  Copyright © 2017年 李响. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResultModel : NSObject


@property(nonatomic,copy)NSString * code;
@property(nonatomic,copy)NSString * msg;
@property(nonatomic,strong)id  data;
@property(nonatomic,assign)BOOL success;

@property(nonatomic,copy)NSString *token_type; //token类型
@property(nonatomic,copy)NSString *expires_in; //token过期时间
@property(nonatomic,copy)NSString *access_token;//访问认证token 请求头内需带入
@property(nonatomic,copy)NSString *refresh_token;//用于刷新 access_token


@end
