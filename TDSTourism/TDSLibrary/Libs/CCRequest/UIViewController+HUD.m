//
//  UIViewController+HUD.m
//  BlueToothDoor
//
//  Created by yuyang on 17/2/27.
//  Copyright © 2016年 许国栋. All rights reserved.
//


#import "UIViewController+HUD.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>



static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@implementation UIViewController (HUD)

- (MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showHudInView:(UIView *)view hint:(NSString *)hint {
    [self hideHud];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.removeFromSuperViewOnHide = YES;
    HUD.labelText = hint;
    HUD.dimBackground = YES;
    [view addSubview:HUD];
    [HUD show:YES];
    [self setHUD:HUD];
}

- (void)showHint:(NSString *)hint {
    [self hideHud];
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
//    hud.dimBackground = YES;
    [hud hide:YES afterDelay:2];
}


- (void)hideHud {
    if ([self HUD])
    [[self HUD] hide:YES];
}



@end
