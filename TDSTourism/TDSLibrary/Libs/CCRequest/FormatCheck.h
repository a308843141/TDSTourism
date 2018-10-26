//
//  FormatCheck.h
//  XZB_V1
//  封装了对字符串的正则校验
//  Created by 许国栋 on 16/4/15.
//  Copyright © 2016年 张鹏君. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormatCheck : NSObject

/**
 *  正则校验 是否是电话号码
 *
 *  @param strTel 要校验的字符串
 *
 *  @return YES／NO
 */
+ (BOOL)checkTel:(NSString *)strTel;

/**
 *  正则校验 是否是email
 *
 *  @param email 要校验的字符串
 *
 *  @return YES／NO
 */
+ (BOOL) validateEmail:(NSString *)email;

/**
 *  正则校验 是否是身份证号码
 *
 *  @param identityCard 要校验的字符串
 *
 *  @return YES／NO
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

/**
 *  正则校验 是否是password
 *
 *  @param password 要校验的字符串
 *
 *  @return YES／NO
 */
+ (BOOL)validatePassword:(NSString *)password;


+ (BOOL)validatePassword1:(NSString *)password;

@end
