//
//  ValidationEmailViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/9/27.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "ValidationEmailViewController.h"
#import "PasswordResetViewController.h"
#import "CPasswordResetViewController.h"

@interface ValidationEmailViewController ()

@property (nonatomic,strong) UIButton *codeBtn;

@property (nonatomic,strong) UIButton *XYBbtn;

@property (nonatomic, strong) UITextField *EmailTextField;

@property (nonatomic,strong) NSTimer *timer;
@property (nonatomic,strong) NSRunLoop *runloop;
@property(nonatomic,assign)int secondCount;

@end

@implementation ValidationEmailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if ([self.EmStr isEqualToString:@"1"]) {
        self.title = @"邮箱密码找回";
    }else{
        self.title = @"邮箱注册";
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
    
    // 保存
    UIButton *righrButton = [UIButton buttonWithType:UIButtonTypeSystem];
    righrButton.frame = CGRectMake(0, 0, 80, 80);
    [righrButton setTitle:@"帮助" forState:UIControlStateNormal];
    [righrButton setTitleColor:[UIColor CC_GColor] forState:UIControlStateNormal];
    UIBarButtonItem *righrButtonItem = [[UIBarButtonItem alloc] initWithCustomView:righrButton];
    self.navigationItem.rightBarButtonItem = righrButtonItem;
    [righrButton addTarget:self action:@selector(rightItemAction:) forControlEvents:UIControlEventTouchUpInside];
}

// 帮助
- (void)rightItemAction:(UIButton *)sender{
    NSLog(@"bangzhu");
//    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//    //UIAlertControllerStyleAlert在中央屏幕。
//    //UIAlertControllerStyleActionSheet在屏幕底部。
//    UIAlertAction *useCamera = [UIAlertAction actionWithTitle:@"" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"男");
//
//    }];
//
//    UIAlertAction *usePhoto = [UIAlertAction actionWithTitle:@"请再次发送验证码" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
//        NSLog(@"女");
//    }];
//
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    [alertController addAction:useCamera];
//    [alertController addAction:usePhoto];
//    [alertController addAction:cancelAction];
//    [self presentViewController:alertController animated:YES completion:nil];
}

// 返回
- (void)leftItemAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)Createui{
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(15,95,140,28);
    label1.text = @"输入4位验证码";
    label1.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    label1.textColor = [UIColor blackColor];
    [self.view addSubview:label1];
    
    
    UILabel *hintLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 127, kScreenWidth-30, 66)];
    hintLabel.numberOfLines=0;
    [self.view addSubview:hintLabel];
    
    NSMutableAttributedString *hintString=[[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"我们向2410212133@qq.com发送了一个验证码，请在下方输入%@",@""]];
    //获取要调整颜色的文字位置,调整颜色
    NSRange range1=[[hintString string]rangeOfString:@"2410212133@qq.com"];
    [hintString addAttribute:NSForegroundColorAttributeName value:[UIColor CC_GColor] range:range1];
    
//    NSRange range2=[[hintString string]rangeOfString:@"服务协议"];
//    [hintString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range2];
    
    hintLabel.attributedText=hintString;
    

    [self.view addSubview:hintLabel];
    
    UILabel *Codelabel = [[UILabel alloc] init];
    Codelabel.frame = CGRectMake(15,191,59,16);
    Codelabel.text = @"4位验证码";
    Codelabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
    [self.view addSubview:Codelabel];
    
    
    //    获取验证码
    
    self.codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.codeBtn.frame = CGRectMake(kScreenWidth-70, 191, 61, 16);
//    [self.codeBtn setBackgroundImage:[UIImage imageNamed:@"注册_手机号"] forState:UIControlStateNormal];
    [self.codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.codeBtn setTitleColor:[UIColor CC_GColor] forState:UIControlStateNormal];
    self.codeBtn.titleLabel.font = [UIFont systemFontOfSize:10];
    [self.codeBtn addTarget:self action:@selector(codeWithBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.codeBtn];
    
    self.EmailTextField = [[UITextField alloc] initWithFrame:CGRectMake(15,CGRectGetMaxY(Codelabel.frame)+12, kScreenWidth - 30, 30)];
    self.EmailTextField.font = [UIFont systemFontOfSize:15];
    self.EmailTextField.placeholder = @"请输入邮箱验证码";
    self.EmailTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    self.phoneTextField.returnKeyType = UIReturnKeyDone;
    self.EmailTextField.keyboardType = UIKeyboardTypeDefault;
    //    self.phoneTextField.secureTextEntry = YES;
    [self.view addSubview:self.EmailTextField];
    
    
    UIView * view1 = [[UIView alloc ] initWithFrame:CGRectMake(20, CGRectGetMaxY(self.EmailTextField.frame)+1, kScreenWidth-30, 0.5)];
    view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view1];
    
    self.XYBbtn = [[UIButton alloc] initWithFrame:CGRectMake(15, CGRectGetMaxY(view1.frame)+24, kScreenWidth-30, 40)];
    [self.XYBbtn.layer setMasksToBounds:YES];
    [self.XYBbtn.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    self.XYBbtn.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.XYBbtn addTarget:self action:@selector(LoginAction:) forControlEvents:UIControlEventTouchUpInside];
    self.XYBbtn.backgroundColor = [UIColor CC_GColor];
    [self.XYBbtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.XYBbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:self.XYBbtn];
    
}
//下一步
-(void)LoginAction:(UIButton *)btn{
    
    
    if ([self.EmStr isEqualToString:@"1"]) {
        PasswordResetViewController *vcv = [[PasswordResetViewController alloc] init];
        vcv.Str = @"1";
        [self.navigationController pushViewController:vcv animated:YES];
    }else{
        CPasswordResetViewController *vcv = [[CPasswordResetViewController alloc] init];
        vcv.CpStr = @"1";
        [self.navigationController pushViewController:vcv animated:YES];
    }
}

//获取验证码网络请求
-(void)codeWithBtn:(UIButton *)btn {
    
    [self codeBtnClick];
    
}


- (NSTimer *)timer {
    if (!_timer) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeCode:) userInfo:nil repeats:YES];
            
            self.runloop = [NSRunLoop currentRunLoop];
            [self.runloop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        });
    }
    return _timer;
}

-(void)timeCode:(NSTimer *)theTimer{
    self.secondCount--;
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if (self.secondCount <= 0) {
            [theTimer invalidate];
            [self cleanTimer];
            [self.codeBtn setTitle:@"重新获取" forState:UIControlStateNormal];
            self.codeBtn.enabled = YES;
            
        } else {
            self.codeBtn.enabled = NO;
            [self.codeBtn setTitle:[NSString stringWithFormat:@"%lds",(long)self.secondCount] forState:UIControlStateNormal];
        }
    });
}

-(void)cleanTimer {
    [_timer invalidate];
    _timer = nil;
    if (_runloop) {
        CFRunLoopStop([_runloop getCFRunLoop]);
    }
    
    [UIView animateWithDuration:0.1 animations:^{
        
    }];
}

-(void)codeBtnClick{
    self.secondCount = 60;
    [self.timer fire];
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
