//
//  TypeDefine.h
//  ChengDe
//
//  Created by mac on 16/1/20.
//  Copyright (c) 2016年 wgy. All rights reserved.
//

#ifndef ChengDe_TypeDefine_h
#define ChengDe_TypeDefine_h

#define kPhone @"phone"
#define kPassWord @"passWord"
#define kUserId @"userId"
#define kAuthKey @"auth"
#define kGroupVar @"group"
#define kIsLogined @"isLogined"

#define NSLog(FORMAT, ...) fprintf(stderr,"☀️【%s:%d行】☀️ %s\n %s\n\n\n\n\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __func__,[[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);







//=======

















#endif
