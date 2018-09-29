//
//  UIViewController+HUD.h
//  BlueToothDoor
//
//  Created by yuyang on 17/2/27.
//  Copyright © 2016年 许国栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)

- (void)showHudInView:(UIView *)view hint:(NSString *)hint;

- (void)hideHud;

- (void)showHint:(NSString *)hint;



@end
