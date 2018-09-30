//
//  ViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/9/2.
//  Copyright © 2018年 qpple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"途点啥";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:20];
    label.frame = CGRectMake(kScreenWidth/2-30, 200, kScreenWidth/2, 30);
    [self.view addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
