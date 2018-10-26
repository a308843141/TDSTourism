//
//  PhoneLoginViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/9/26.
//  Copyright © 2018年 qpple. All rights reserved.
//

#import "PhoneLoginViewController.h"
#import "PhonePasswordViewController.h"
#import "PhoneRegisteredViewController.h"
#import "TDSViewController.h"

@interface PhoneLoginViewController ()

@property (nonatomic, strong) UITextField *EmailTextField;
@property (nonatomic, strong) UITextField *PassWordTextField;

@property (nonatomic, strong) UIButton *SwitchButton;
@property (nonatomic, strong) UIButton *LoginButton;
@property (nonatomic, strong) UIButton *RegistButton;
@property (nonatomic, strong) UIButton *AgreementButton;
@property (nonatomic, strong) UIButton *XyButton;

@property (nonatomic, strong) UIButton *GjButton;

@end

@implementation PhoneLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"手机登录";
    
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
    
    // 保存
    UIButton *righrButton = [UIButton buttonWithType:UIButtonTypeSystem];
    righrButton.frame = CGRectMake(0, 0, 80, 80);
    [righrButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    [righrButton setTitleColor:[UIColor CC_GColor] forState:UIControlStateNormal];
    UIBarButtonItem *righrButtonItem = [[UIBarButtonItem alloc] initWithCustomView:righrButton];
    self.navigationItem.rightBarButtonItem = righrButtonItem;
    [righrButton addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
}

// 邮箱忘记密码
- (void)rightItemAction:(UIButton *)sender{
    NSLog(@"手机忘记密码");
    PhonePasswordViewController *Syr = [[PhonePasswordViewController alloc] init];
    [self.navigationController pushViewController:Syr animated:YES];
}

// 返回
- (void)leftItemAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)Createui{
    
    UILabel *EmLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 123, 77, 16)];
    EmLabel.text = @"手机号";
    EmLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    EmLabel.textColor = [UIColor blackColor];
    [self.view addSubview:EmLabel];
    
    
    self.GjButton = [[UIButton alloc] initWithFrame:CGRectMake(15,CGRectGetMaxY(EmLabel.frame)+12,44,26.9)];
    [self.GjButton.layer setMasksToBounds:YES];
    [self.GjButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    self.GjButton.titleLabel.font=[UIFont systemFontOfSize:12];
    [self.GjButton addTarget:self action:@selector(GjButton:) forControlEvents:UIControlEventTouchUpInside];
    self.GjButton.backgroundColor = [UIColor CC_GColor];
    [self.GjButton setTitle:@"+86" forState:UIControlStateNormal];
    [self.GjButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.GjButton];

    
    self.EmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.GjButton.frame)+1,CGRectGetMaxY(EmLabel.frame)+12, kScreenWidth - 40, 30)];
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
    
    
    UILabel *PassLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(view1.frame)+19, 26, 16)];
    PassLabel.text = @"密码";
    PassLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    PassLabel.textColor = [UIColor blackColor];
    [self.view addSubview:PassLabel];
    
    //    self.XyButton= [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-45, CGRectGetMaxY(view1.frame)+19, 30, 16)];
    //    self.XyButton.titleLabel.font=[UIFont systemFontOfSize:12];
    //    [self.XyButton addTarget:self action:@selector(XyButton:) forControlEvents:UIControlEventTouchUpInside];
    //    [self.XyButton setTitle:@"显示" forState:UIControlStateNormal];
    //    [self.XyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //
    //    [self.view addSubview:self.XyButton];
    
    self.PassWordTextField = [[UITextField alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(PassLabel.frame)+12, kScreenWidth - 40, 30)];
    self.PassWordTextField.font = [UIFont systemFontOfSize:15];
    self.PassWordTextField.placeholder = @"请输入密码";
    self.PassWordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    self.phoneTextField.returnKeyType = UIReturnKeyDone;
    self.PassWordTextField.keyboardType = UIKeyboardTypeDefault;
    self.PassWordTextField.secureTextEntry = YES;
    [self.view addSubview:self.PassWordTextField];
    
    UIView * view2 = [[UIView alloc ] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.PassWordTextField.frame)+1, kScreenWidth-30, 0.5)];
    view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view2];
    
    self.SwitchButton= [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(view2.frame)+19, 157, 25)];
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
    
    //
    self.LoginButton = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.SwitchButton.frame)+13, kScreenWidth-40, 40)];
    [self.LoginButton.layer setMasksToBounds:YES];
    [self.LoginButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    self.LoginButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.LoginButton addTarget:self action:@selector(LoginAction:) forControlEvents:UIControlEventTouchUpInside];
    self.LoginButton.backgroundColor = [UIColor CC_GColor];
    [self.LoginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.LoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.LoginButton];
    
    self.RegistButton = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.LoginButton.frame)+20, kScreenWidth-40, 40)];
    [self.RegistButton.layer setMasksToBounds:YES];
    [self.RegistButton.layer setCornerRadius:2.0]; //设置矩形四个圆角半径
    self.RegistButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.RegistButton addTarget:self action:@selector(RegistButton:) forControlEvents:UIControlEventTouchUpInside];
    //    self.RegistButton.backgroundColor = [UIColor CC_GColor];
    [self.RegistButton setTitle:@"没有帐号？请注册" forState:UIControlStateNormal];
    [self.RegistButton setTitleColor:[UIColor colorWithRed:50.0/255.0 green:87.0/255.0 blue:121.0/255.0 alpha:1] forState:UIControlStateNormal];
    [self.RegistButton.layer setMasksToBounds:YES];
    [self.RegistButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    //边框宽度
    [self.RegistButton.layer setBorderWidth:1.0];
    self.RegistButton.layer.borderColor=[UIColor colorWithRed:50.0/255.0 green:87.0/255.0 blue:121.0/255.0 alpha:1].CGColor;
    [self.view addSubview:self.RegistButton];
    
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(40, kScreenHeight-120, kScreenWidth-80,100)];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:whiteView];
    NSArray *buttonImages =@[@"Group 7@2x", @"Group 4@2x", @"Group 6@2x"];
    NSArray *titleArray = @[@"微信", @"支付宝", @"QQ"];
    
    for (int i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((kScreenWidth-80)/3-40 + (60 ) * (i % 3),  15, 60, 60);
        [button setImage:[UIImage imageNamed:buttonImages[i]] forState:UIControlStateNormal];
        button.tag = 400 + i;
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [whiteView addSubview:button];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(button.frame) - 5, CGRectGetMaxY(button.frame) + 8, CGRectGetWidth(button.frame) + 10, 13)];
        label.font = [UIFont systemFontOfSize:13];
        label.text = titleArray[i];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor colorWithWhite:0.231 alpha:1.000];
        [whiteView addSubview:label];
    }
    
}

//-(void)XyButton:(UIButton *)btn{
//
//}



-(void)GjButton:(UIButton *)btn{
    
}

-(void)LoginAction:(UIButton *)btn{
    
    
//    if (![FormatCheck checkTel:self.EmailTextField.text]) {
//        [self showHint:@"手机号不符合"];
//        return;
//    }
//
//    if (![FormatCheck validatePassword1:self.PassWordTextField.text]) {
//        [self showHint:@"请输入8位以上字母或数字"];
//        return;
//    }
    
    TDSViewController *detail= [[TDSViewController alloc]initWithNibName:@"TDSViewController" bundle:[NSBundle mainBundle]];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:detail];
    [self presentViewController:nav animated:YES completion:nil];
}

-(void)SwitchAction:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)RegistButton:(UIButton *)btn{
    PhoneRegisteredViewController *rvc = [[PhoneRegisteredViewController alloc] init];
    [self.navigationController pushViewController:rvc animated:YES];
}

- (void)buttonClicked:(UIButton *)sender{
    
    if (UID == nil) {
        
        //        LoginViewController *detail= [[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:[NSBundle mainBundle]];
        //        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:detail];
        //        [self presentViewController:nav animated:YES completion:nil];
        
    }else{
        
        NSInteger index = sender.tag - 400;
        switch (index) {
            case 0: {
                
            }
                break;
            case 1: {
                
            }
                break;
            case 2: {
                
            }
                break;
            case 3: {
                
            }
                break;
                
            default:
                break;
        }
    }
    
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
