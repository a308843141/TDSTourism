//
//  CPasswordResetViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/9/28.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "CPasswordResetViewController.h"
#import "PassSuccessViewController.h"

@interface CPasswordResetViewController ()

@property (nonatomic, strong) UITextField *PassTextField;

@property (nonatomic, strong) UITextField *SPassTextField;

@property (nonatomic, strong) UIButton *SPassButton;

@end

@implementation CPasswordResetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"创建密码";
    
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
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(15,95,140,28);
    label.text = @"创建密码";
    label.font = [UIFont fontWithName:@"MicrosoftYaHei" size:18];
    label.textColor = [UIColor colorWithRed:26/255.0 green:26/255.0 blue:26/255.0 alpha:1];
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(15,127,kScreenWidth-30,48);
    label2.text = @"您的密码必须包含1个字符，长度至少为8个字符。";
    label2.font = [UIFont fontWithName:@"MicrosoftYaHei" size:14];
    label2.textColor = [UIColor colorWithRed:129/255.0 green:123/255.0 blue:123/255.0 alpha:1];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.numberOfLines = 0;
    [self.view addSubview:label2];
    
    
    UILabel *label3 = [[UILabel alloc] init];
    label3.frame = CGRectMake(15,CGRectGetMaxY(label2.frame)+13,36,16);
    label3.text = @"密码";
    label3.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    label3.textColor = [UIColor colorWithRed:26/255.0 green:26/255.0 blue:26/255.0 alpha:1];
    label3.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label3];
    
    
    self.PassTextField = [[UITextField alloc] initWithFrame:CGRectMake(15,CGRectGetMaxY(label3.frame)+12, kScreenWidth - 30, 30)];
    self.PassTextField.font = [UIFont systemFontOfSize:15];
    self.PassTextField.placeholder = @"请输入密码";
    self.PassTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    self.phoneTextField.returnKeyType = UIReturnKeyDone;
    self.PassTextField.keyboardType = UIKeyboardTypeDefault;
    //    self.phoneTextField.secureTextEntry = YES;
    [self.view addSubview:self.PassTextField];
    
    UIView * view1 = [[UIView alloc ] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.PassTextField.frame)+10, kScreenWidth-30, 0.5)];
    view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view1];
    
    UILabel *splabel = [[UILabel alloc] init];
    splabel.frame = CGRectMake(15,CGRectGetMaxY(view1.frame)+17,51,16);
    splabel.text = @"确认密码";
    splabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    splabel.textColor = [UIColor blackColor];
    [self.view addSubview:splabel];
    
    
    self.SPassTextField = [[UITextField alloc] initWithFrame:CGRectMake(15,CGRectGetMaxY(splabel.frame)+12, kScreenWidth - 30, 30)];
    self.SPassTextField.font = [UIFont systemFontOfSize:15];
    self.SPassTextField.placeholder = @"请输入确认密码";
    self.SPassTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    self.phoneTextField.returnKeyType = UIReturnKeyDone;
    self.SPassTextField.keyboardType = UIKeyboardTypeDefault;
    //    self.phoneTextField.secureTextEntry = YES;
    [self.view addSubview:self.SPassTextField];
    
    
    UIView * view2 = [[UIView alloc ] initWithFrame:CGRectMake(15, CGRectGetMaxY(self.SPassTextField.frame)+10, kScreenWidth-30, 0.5)];
    view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view2];
    
    self.SPassButton = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(view2.frame)+24, kScreenWidth-30, 40)];
    [self.SPassButton.layer setMasksToBounds:YES];
    [self.SPassButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    self.SPassButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.SPassButton addTarget:self action:@selector(LoginAction:) forControlEvents:UIControlEventTouchUpInside];
    self.SPassButton.backgroundColor = [UIColor CC_GColor];
    [self.SPassButton setTitle:@"下一步" forState:UIControlStateNormal];
    [self.SPassButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.SPassButton];
    
}
//重置
-(void)LoginAction:(UIButton *)btn{
    
    if ([self.CpStr isEqualToString:@"1"]) {
//        youxiang
        PassSuccessViewController *vcv = [[PassSuccessViewController alloc] init];
        vcv.Str = @"3";
        [self.navigationController pushViewController:vcv animated:YES];
    }else{
//        shujihao
        PassSuccessViewController *vcv = [[PassSuccessViewController alloc] init];
        vcv.Str = @"4";
        [self.navigationController pushViewController:vcv animated:YES];
    }
//    PassSuccessViewController *vcv = [[PassSuccessViewController alloc] init];
//    vcv.Str = self.Str;
//    [self.navigationController pushViewController:vcv animated:YES];
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
