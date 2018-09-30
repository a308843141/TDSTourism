//
//  RegisteredViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/9/18.
//  Copyright © 2018年 qpple. All rights reserved.
//

#import "RegisteredViewController.h"
#import "ValidationEmailViewController.h"
#import "TPhoneRegisteredViewController.h"

@interface RegisteredViewController ()

@property (nonatomic, strong) UITextField *EmailTextField;

@property (nonatomic, strong) UIButton *SysjButton;
@property (nonatomic, strong) UIButton *RegistButton;

@property (nonatomic, strong) UIButton *ImButton;
@property (nonatomic, strong) UIButton *XYButton;

@end

@implementation RegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"邮箱注册";
    
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
    [righrButton setTitle:@"登录" forState:UIControlStateNormal];
    [righrButton setTitleColor:[UIColor CC_GColor] forState:UIControlStateNormal];
    UIBarButtonItem *righrButtonItem = [[UIBarButtonItem alloc] initWithCustomView:righrButton];
    self.navigationItem.rightBarButtonItem = righrButtonItem;
    [righrButton addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
}

// 邮箱忘记密码
- (void)rightItemAction:(UIButton *)sender{
    NSLog(@"登录");
    [self.navigationController popViewControllerAnimated:NO];
//    EmailPasswordViewController *Syr = [[EmailPasswordViewController alloc] init];
//    [self.navigationController pushViewController:Syr animated:YES];
}

// 返回
- (void)leftItemAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)Createui{
    
    UILabel *EmLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 123, 77, 16)];
    EmLabel.text = @"邮箱地址";
    EmLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    EmLabel.textColor = [UIColor blackColor];
    [self.view addSubview:EmLabel];
   
    self.EmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(20,CGRectGetMaxY(EmLabel.frame)+12, kScreenWidth - 40, 30)];
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
    
    
    self.SysjButton= [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(view1.frame)+19, 121, 25)];
    self.SysjButton.titleLabel.font=[UIFont systemFontOfSize:14];
    [self.SysjButton addTarget:self action:@selector(SyAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.SysjButton setTitle:@"使用手机号" forState:UIControlStateNormal];
    [self.SysjButton setTitleColor:[UIColor CC_GColor] forState:UIControlStateNormal];
    [self.SysjButton.layer setMasksToBounds:YES];
    [self.SysjButton.layer setCornerRadius:10.0]; //设置矩形四个圆角半径
    //边框宽度
    [self.SysjButton.layer setBorderWidth:1.0];
    self.SysjButton.layer.borderColor=[UIColor CC_GColor].CGColor;
    [self.view addSubview:self.SysjButton];
    
    //
    self.RegistButton = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.SysjButton.frame)+13, kScreenWidth-40, 40)];
    [self.RegistButton.layer setMasksToBounds:YES];
    [self.RegistButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    self.RegistButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.RegistButton addTarget:self action:@selector(RegistAction:) forControlEvents:UIControlEventTouchUpInside];
    self.RegistButton.backgroundColor = [UIColor CC_GColor];
    [self.RegistButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.RegistButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.RegistButton];
    
    self.ImButton = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.RegistButton.frame)+18, 12, 12)];
    [self.ImButton setImage:[UIImage imageNamed:@"fuxuankuang"] forState:UIControlStateNormal];
    [self.ImButton addTarget:self action:@selector(ImButton:) forControlEvents:UIControlEventTouchUpInside];
    self.ImButton.backgroundColor = [UIColor CC_GColor];
//    [self.ImButton setTitle:@"注册" forState:UIControlStateNormal];
    [self.ImButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.ImButton];
    
    self.XYButton = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.ImButton.frame)+1,CGRectGetMaxY(self.RegistButton.frame)+11,172,12)];
    
    [self.XYButton.titleLabel setTextColor:[UIColor grayColor]];
    self.XYButton.titleLabel.font=[UIFont systemFontOfSize:12];
    
    [self.view addSubview:self.XYButton];
    
    NSString*str =@"同意并接受《途点啥用户协议》";
    
    NSMutableAttributedString* attributedString1 = [[NSMutableAttributedString alloc]initWithString:str];
    

    [attributedString1 addAttribute:NSForegroundColorAttributeName value:[UIColor  colorWithRed:32.0/255.0 green:181.0/255.0 blue:255.0/255.0 alpha:1] range:NSMakeRange(5,9)];
//    //获取要调整颜色的文字位置,调整颜色
//    NSRange range1=[[hintString string]rangeOfString:@"2410212133@qq.com"];
//    [hintString addAttribute:NSForegroundColorAttributeName value:[UIColor CC_GColor] range:range1];
    
    [self.XYButton setAttributedTitle:attributedString1 forState:UIControlStateNormal];
    
    [self.XYButton sizeToFit];
    
    [self.XYButton addTarget:self action:@selector(XYButton:) forControlEvents:UIControlEventTouchUpInside];
   
}

-(void)SyAction:(UIButton *)SyAction {
    NSLog(@"shiyong");
    TPhoneRegisteredViewController *Tvc = [[TPhoneRegisteredViewController alloc ] init];
    [self.navigationController pushViewController:Tvc animated:NO];
}

-(void)RegistAction:(UIButton *)RegistAction {
    
    if (![FormatCheck validateEmail:self.EmailTextField.text]) {
        [self showHint:@"邮箱不符合"];
        return;
    }
    NSLog(@"RegistAction");
    ValidationEmailViewController* vpvc = [[ValidationEmailViewController alloc] init];
    vpvc.EmStr = @"2";
    [self.navigationController pushViewController:vpvc animated:NO];
}

-(void)ImButton:(UIButton *)ImButton {
    NSLog(@"ImButton");
    ImButton.selected = !ImButton.selected;
    
    if(ImButton.selected == YES){
        
        [self.ImButton setImage:[UIImage imageNamed:@"fuxuankuang-click"] forState:UIControlStateNormal];
        
    }
    
    else{
        
         [self.ImButton setImage:[UIImage imageNamed:@"fuxuankuang"] forState:UIControlStateNormal];
        
    }
    
}

-(void)XYButton:(UIButton *)XYButton {
    NSLog(@"XYButton");
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
