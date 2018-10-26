//
//  ResultModel.m
//  StudentBenefit
//
//  Created by 恒悦科技 on 2017/6/21.
//  Copyright © 2017年 李响. All rights reserved.
//

#import "ResultModel.h"

@implementation ResultModel


-(void)setCode:(NSString *)code{
    _code = code;
    self.success = ([code integerValue] == 0);
}

@end
