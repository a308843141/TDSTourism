//
//  EmailPasswordViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/9/26.
//  Copyright © 2018年 qpple. All rights reserved.
//

#import "EmailPasswordViewController.h"
#import "ValidationEmailViewController.h"
#import "TPhonePasswordViewController.h"

@interface EmailPasswordViewController ()

@property (nonatomic, strong) UITextField *EmailTextField;

@property (nonatomic, strong) UIButton *SwitchButton;
@property (nonatomic, strong) UIButton *LoginButton;

@end

@implementation EmailPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"邮箱密码找回";
    
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
    label3.frame = CGRectMake(15,191,102,16);
    label3.text = @"使用电子邮件地址";
    label3.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    label3.textColor = [UIColor blackColor];
    [self.view addSubview:label3];
    
    self.EmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(15,CGRectGetMaxY(label3.frame)+12, kScreenWidth - 30, 30)];
    self.EmailTextField.font = [UIFont systemFontOfSize:15];
    self.EmailTextField.placeholder = @"请输入邮箱地址";
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
    [self.LoginButton setTitle:@"发送邮件" forState:UIControlStateNormal];
    [self.LoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.LoginButton];
    
    
    self.SwitchButton= [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.LoginButton.frame)+19, 121, 25)];
    self.SwitchButton.titleLabel.font=[UIFont systemFontOfSize:14];
    [self.SwitchButton addTarget:self action:@selector(SwitchAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.SwitchButton setTitle:@"使用手机号" forState:UIControlStateNormal];
    [self.SwitchButton setTitleColor:[UIColor CC_GColor] forState:UIControlStateNormal];
    [self.SwitchButton.layer setMasksToBounds:YES];
    [self.SwitchButton.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    //边框宽度
    [self.SwitchButton.layer setBorderWidth:1.0];
    self.SwitchButton.layer.borderColor=[UIColor CC_GColor].CGColor;
    [self.view addSubview:self.SwitchButton];
    
}

-(void)LoginAction:(UIButton *)btn{
    
    //    if (![FormatCheck validateEmail:self.EmailTextField.text]) {
    //        [self showHint:@"邮箱不符合"];
    //        return;
    //    }
    
    ValidationEmailViewController *vcv = [[ValidationEmailViewController alloc] init];
    vcv.EmStr = @"1";
    [self.navigationController pushViewController:vcv animated:YES];
}

-(void)SwitchAction:(UIButton *)btn{
    TPhonePasswordViewController *pvc = [[TPhonePasswordViewController alloc] init];
    [self.navigationController pushViewController:pvc animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
