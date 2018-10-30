//
//  FlightlDetailsViewController.m
//  TDSTourism
//
//  Created by mac on 2018/10/30.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "FlightlDetailsViewController.h"
#import "CC_FSView.h"

@interface FlightlDetailsViewController ()

@property (nonatomic,strong)CC_FSView *FSView;

@end

@implementation FlightlDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"详情";
    [self addNavViews];
}

- (void)addNavViews{
    
    // 返回按钮
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.frame = CGRectMake(0, 0, 10, 10);
    [leftButton setBackgroundImage:[UIImage imageNamed:@"Disclosure Indicator"] forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    [leftButton addTarget:self action:@selector(leftItemAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(RightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"详情更多"] forState:UIControlStateNormal];
    
    [btn sizeToFit];
    UIBarButtonItem *RightItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = RightItem;
    
}

- (void)RightButtonAction:(UIButton *)RightButtonAction{

    self.FSView= [[CC_FSView alloc]init];
//    self.FSView.passTimeDelegate = self;
    
    [self.FSView showInView:self.view];
    
}


// 返回
- (void)leftItemAction:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
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
