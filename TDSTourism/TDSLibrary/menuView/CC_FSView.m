//
//  CC_FSView.m
//  TDSTourism
//
//  Created by mac on 2018/10/30.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "CC_FSView.h"

@implementation CC_FSView
{
    UIView *backview;
}

-(instancetype)initWithFrame:(CGRect)frame withCount:(NSInteger)count
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        [self initUI];
    }
    return self;
}

-(void)initUI{
    
     backview= [[UIView alloc] initWithFrame:CGRectMake(kScreenWidth-150, 0, 150, 96)];
    backview.backgroundColor = [UIColor whiteColor];
    [self addSubview:backview];
    
    UIButton*ScButton = [[UIButton alloc] initWithFrame:CGRectMake(0,0,150,48)];
    [ScButton addTarget:self action:@selector(ScButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [backview addSubview:ScButton];
    
    UIImageView *Scimage = [[UIImageView alloc] initWithFrame:CGRectMake(18, 13, 189, 18)];

    [ScButton addSubview:Scimage];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(CGRectGetMaxX(Scimage.frame)+27,15,52,21);
    label.text = @"收藏";
    label.font = [UIFont fontWithName:@"MicrosoftYaHei" size:16];
    label.textColor = [UIColor colorWithRed:90/255.0 green:99/255.0 blue:111/255.0 alpha:1];
    label.textAlignment = NSTextAlignmentCenter;
  
    [ScButton addSubview:label];
    
    
    UIButton*FxButton = [[UIButton alloc] initWithFrame:CGRectMake(0,48,150,48)];
    [ScButton addTarget:self action:@selector(FxButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [backview addSubview:FxButton];
    
    UIImageView *Fximage = [[UIImageView alloc] initWithFrame:CGRectMake(19, CGRectGetMaxY(Scimage.frame)+26, 18, 17)];
 
    [FxButton addSubview:Fximage];
    
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(CGRectGetMaxX(Scimage.frame)+27,CGRectGetMaxY(Scimage.frame)+26,52,21);
    label1.text = @"分享";
    label1.font = [UIFont fontWithName:@"MicrosoftYaHei" size:16];
    label1.textColor = [UIColor colorWithRed:90/255.0 green:99/255.0 blue:111/255.0 alpha:1];
    label1.textAlignment = NSTextAlignmentCenter;
    [FxButton addSubview:label1];

    
}


- (void)FxButtonAction:(UIButton *)FxButtonAction{
//    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"fx");
}

- (void)ScButtonAction:(UIButton *)ScButtonAction{
//    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"sc");
}


//展示从底部向上弹出的UIView（包含遮罩）
- (void)showInView:(UIView *)view {
    if (!view) {
        return;
    }
    
    [view addSubview:self];
    [view addSubview:backview];
    
    [backview setFrame:CGRectMake(0,0,kScreenWidth, kScreenHeight)];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 1.0;
        
        [backview setFrame:CGRectMake(0, kScreenHeight, self.frame.size.width, kScreenHeight)];
    } completion:nil];
    
}
//移除从上向底部弹下去的UIView（包含遮罩）
- (void)disMissView {
    [backview setFrame:CGRectMake(0, kScreenHeight-350, self.frame.size.width, 350)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [backview setFrame:CGRectMake(0, kScreenHeight, kScreenWidth, 0)];
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         
                     }];
 
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
