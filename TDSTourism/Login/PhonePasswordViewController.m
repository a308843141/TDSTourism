//
//  PhonePasswordViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/9/27.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "PhonePasswordViewController.h"
#import "TEmailPasswordViewController.h"
#import "ValidationPhoneViewController.h"

@interface PhonePasswordViewController ()

@property (nonatomic, strong) UITextField *EmailTextField;

@property (nonatomic, strong) UIButton *SwitchButton;
@property (nonatomic, strong) UIButton *LoginButton;

@property (nonatomic, strong) UIButton *GjButton;


@end

@implementation PhonePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"手机密码找回";
    
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
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)Createui{
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(15,95,90,28);
    label1.text = @"忘记密码？";
    label1.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    label1.textColor = [UIColor blackColor];
    [self.view addSubview:label1];
    
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(15,127,344,28);
    label2.text = @"请输入您的电话号码或邮箱以查找您的账号。";
    label2.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    label2.textColor = [UIColor grayColor];
    [self.view addSubview:label2];
    
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.frame = CGRectMake(15,191,39,16);
    label3.text = @"手机号";
    label3.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    label3.textColor = [UIColor blackColor];
    [self.view addSubview:label3];
    
    self.GjButton = [[UIButton alloc] initWithFrame:CGRectMake(15,CGRectGetMaxY(label3.frame)+12,44,26.9)];
    [self.GjButton.layer setMasksToBounds:YES];
    [self.GjButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    self.GjButton.titleLabel.font=[UIFont systemFontOfSize:12];
    [self.GjButton addTarget:self action:@selector(GjButton:) forControlEvents:UIControlEventTouchUpInside];
    self.GjButton.backgroundColor = [UIColor CC_GColor];
    [self.GjButton setTitle:@"+86" forState:UIControlStateNormal];
    [self.GjButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.GjButton];
    
    self.EmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.GjButton.frame)+1,CGRectGetMaxY(label3.frame)+12, kScreenWidth - 121, 30)];
    self.EmailTextField.font = [UIFont systemFontOfSize:15];
    self.EmailTextField.placeholder = @"请输入手机号";
    self.EmailTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    self.phoneTextField.returnKeyType = UIReturnKeyDone;
    self.EmailTextField.keyboardType = UIKeyboardTypeDefault;
    //    self.phoneTextField.secureTextEntry = YES;
    [self.view addSubview:self.EmailTextField];
    
    
    UIView * view1 = [[UIView alloc ] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.EmailTextField.frame)+1, kScreenWidth-30, 0.5)];
    view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view1];
    
    self.LoginButton = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(view1.frame)+24, kScreenWidth-30, 40)];
    [self.LoginButton.layer setMasksToBounds:YES];
    [self.LoginButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    self.LoginButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.LoginButton addTarget:self action:@selector(LoginAction:) forControlEvents:UIControlEventTouchUpInside];
    self.LoginButton.backgroundColor = [UIColor CC_GColor];
    [self.LoginButton setTitle:@"下一步" forState:UIControlStateNormal];
    [self.LoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.LoginButton];
    
    
    self.SwitchButton= [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.LoginButton.frame)+19, 161, 25)];
    self.SwitchButton.titleLabel.font=[UIFont systemFontOfSize:14];
    [self.SwitchButton addTarget:self action:@selector(SwitchAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.SwitchButton setTitle:@"使用电子邮件地址" forState:UIControlStateNormal];
    [self.SwitchButton setTitleColor:[UIColor CC_GColor] forState:UIControlStateNormal];
    [self.SwitchButton.layer setMasksToBounds:YES];
    [self.SwitchButton.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    //边框宽度
    [self.SwitchButton.layer setBorderWidth:1.0];
    self.SwitchButton.layer.borderColor=[UIColor CC_GColor].CGColor;
    [self.view addSubview:self.SwitchButton];
    
}

-(void)GjButton:(UIButton *)btn{
    
}


-(void)LoginAction:(UIButton *)btn{
    ValidationPhoneViewController *vcv = [[ValidationPhoneViewController alloc] init];
    vcv.VpStr = @"1";
    [self.navigationController pushViewController:vcv animated:YES];
}

-(void)SwitchAction:(UIButton *)btn{
        TEmailPasswordViewController *vcv = [[TEmailPasswordViewController alloc] init];
        [self.navigationController pushViewController:vcv animated:NO];
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
