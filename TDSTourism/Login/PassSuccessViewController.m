//
//  PassSuccessViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/9/27.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "PassSuccessViewController.h"
#import "LoginViewController.h"

@interface PassSuccessViewController ()

@property (nonatomic, strong) UIButton *DzyjButton;

@end

@implementation PassSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([self.Str isEqualToString:@"1"]) {
        self.title = @"密码重置";
    }else if ([self.Str isEqualToString:@"3"]){
        self.title = @"邮箱注册";
    }else if ([self.Str isEqualToString:@"4"]){
        self.title = @"手机号注册";
    }
    
    
    [self Createui];
    
    [self addNavViews];
    
    self.view.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerTapped:)];
    
    [self.view addGestureRecognizer:singleTap];
    
}

-(void)fingerTapped:(UITapGestureRecognizer *)gestureRecognizer

{
    [self.view endEditing:YES];
    
}

- (void)addNavViews{
    
    // 返回按钮
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.frame = CGRectMake(0, 0, 10, 10);
    [leftButton setBackgroundImage:[UIImage imageNamed:@"Disclosure Indicator"] forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    [leftButton addTarget:self action:@selector(leftItemAction:) forControlEvents:UIControlEventTouchUpInside];
    
}


// 返回
- (void)leftItemAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)Createui{
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(kScreenWidth/2-40,174,80,80);
    [UIImage imageNamed:@"Bitmap.png"];
    imageView.backgroundColor = [UIColor redColor];
    [self.view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(kScreenWidth/2-60,289,150,26);
    
    if ([self.Str isEqualToString:@"1"]) {
        label.text = @"密码重置成功！";
    }else if ([self.Str isEqualToString:@"3"]){
        label.text = @"您已经有账号了！";
    }else if ([self.Str isEqualToString:@"4"]){
        label.text = @"您已经有账号了！";
    }
    label.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:label];
    
    
    
    self.DzyjButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth/2-35, CGRectGetMaxY(label.frame)+16, 70, 19)];
    
    self.DzyjButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.DzyjButton addTarget:self action:@selector(SyAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.DzyjButton setTitle:@"马上登录" forState:UIControlStateNormal];
    [self.DzyjButton setTitleColor:[UIColor CC_GColor] forState:UIControlStateNormal];
    [self.view addSubview:self.DzyjButton];
    
    // underline Terms and condidtions
    NSMutableAttributedString* tncString = [[NSMutableAttributedString alloc] initWithString:@"马上登录"];
    
    //设置下划线...
    /*
     NSUnderlineStyleNone                                    = 0x00, 无下划线
     NSUnderlineStyleSingle                                  = 0x01, 单行下划线
     NSUnderlineStyleThick NS_ENUM_AVAILABLE(10_0, 7_0)      = 0x02, 粗的下划线
     NSUnderlineStyleDouble NS_ENUM_AVAILABLE(10_0, 7_0)     = 0x09, 双下划线
     */
    
    [tncString addAttribute:NSUnderlineStyleAttributeName
                      value:@(NSUnderlineStyleSingle)
                      range:(NSRange){0,[tncString length]}];
    //此时如果设置字体颜色要这样
    [tncString addAttribute:NSForegroundColorAttributeName value:[UIColor CC_GColor]  range:NSMakeRange(0,[tncString length])];
    
    //设置下划线颜色...
    [tncString addAttribute:NSUnderlineColorAttributeName value:[UIColor CC_GColor] range:(NSRange){0,[tncString length]}];
    [self.DzyjButton setAttributedTitle:tncString forState:UIControlStateNormal];
    
}

-(void)SyAction:(UIButton *)SyAction {
    NSLog(@"shiyong");
//    LoginViewController *vcv = [[LoginViewController alloc] init];
//    
//    [self.navigationController pushViewController:vcv animated:YES];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
