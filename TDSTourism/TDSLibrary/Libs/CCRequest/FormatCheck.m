//
//  FormatCheck.m
//  XZB_V1
//
//  Created by 许国栋 on 16/4/15.
//  Copyright © 2016年 张鹏君. All rights reserved.
//

#import "FormatCheck.h"

@implementation FormatCheck

/**
 *  正则校验 是否是电话号码
 *
 *  @param strTel 要校验的字符串
 *
 *  @return YES／NO
 */
+ (BOOL)checkTel:(NSString *)str {

  if ([str length] == 0) {
    return NO;
  }
  //正则规则
  NSString *regex = @"^((13[0-9])|(147)|(17[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$";
  //正则校验类
  NSPredicate *pred =
      [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];

  return [pred evaluateWithObject:str];
}

/**
 *  正则校验 是否是email
 *
 *  @param email 要校验的字符串
 *
 *  @return YES／NO
 */
+ (BOOL)validateEmail:(NSString *)email {
    if ([email length] == 0) {
        return NO;
    }
    //正则规则
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    //正则校验类
    NSPredicate *emailTest =
      [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
  
    return [emailTest evaluateWithObject:email];
}

/**
 *  正则校验 是否是身份证号码
 *
 *  @param identityCard 要校验的字符串
 *
 *  @return YES／NO
 */
+ (BOOL)validateIdentityCard:(NSString *)identityCard {
  if (identityCard.length <= 0) {
    return NO;
  }
    //正则规则
  NSString *strIDRegex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
  NSPredicate *identityCardPredicate =
      [NSPredicate predicateWithFormat:@"SELF MATCHES %@", strIDRegex];
  return [identityCardPredicate evaluateWithObject:identityCard];
}

/**
 *  正则校验 是否是password
 *
 *  @param password 要校验的字符串8 - 10位
 *
 *  @return YES／NO
 */
+ (BOOL)validatePassword:(NSString *)password {
    BOOL result = false;
    if ([password length] >= 6){

        NSString * regex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:password];
    }
    return result;
}

/**
 *  正则校验 是否是password
 *
 *  @param password 要校验的字符串8 - 10位
 *
 *  @return YES／NO
 */
+ (BOOL)validatePassword1:(NSString *)password {
    BOOL result = false;
    if ([password length] >= 6){
        
        NSString * regex = @"^[a-zA-Z0-9]{6,20}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:password];
    }
    return result;
}




@end
