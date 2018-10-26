//
//  TDSViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/9/4.
//  Copyright © 2018年 qpple. All rights reserved.
//

#import "TDSViewController.h"
#import "HomeViewController.h"
#import "DeliveryViewController.h"
#import "TravelViewController.h"
#import "WishViewController.h"
#import "MineViewController.h"

@interface TDSViewController ()

@end

@implementation TDSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.tintColor=[UIColor blackColor];
//    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
//    self.navigationController.navigationBar.titleTextAttributes=
//    @{NSForegroundColorAttributeName:[UIColor whiteColor],
//      NSFontAttributeName:[UIFont systemFontOfSize:20]};
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 49)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:backView atIndex:0];
    //    self.tabBar.opaque = YES;
    
    
    HomeViewController *payC = [[HomeViewController alloc] init];
//    UINavigationController *payNav = [[UINavigationController alloc] initWithRootViewController:payC];
    payC.title = @"首页";
    payC.tabBarItem.image = [UIImage imageNamed:@"frontpage_normal"];
    payC.tabBarItem.selectedImage = [UIImage imageNamed:@"frontpage_select"];
    
    
    DeliveryViewController *searchC = [[DeliveryViewController alloc] init];
    searchC.title = @"发货";
    UINavigationController *sarchNav = [[UINavigationController alloc] initWithRootViewController:searchC];
    searchC.tabBarItem.image = [UIImage imageNamed:@"send_out_normal"];
    searchC.tabBarItem.selectedImage = [UIImage imageNamed:@"send_out_select"];
    
    WishViewController *wish = [[WishViewController alloc] init];
    wish.title = @"许愿池";
    UINavigationController *wishNav = [[UINavigationController alloc] initWithRootViewController:wish];
    wishNav.tabBarItem.image = [UIImage imageNamed:@"wishpond_normal"];
    wishNav.tabBarItem.selectedImage = [UIImage imageNamed:@"wishpond_select"];
    
    TravelViewController *accountC = [[TravelViewController alloc] init];
    accountC.title = @"带货";
    UINavigationController *accountNav = [[UINavigationController alloc] initWithRootViewController:accountC];
    accountNav.tabBarItem.image = [UIImage imageNamed:@"traveller_normal"];
    accountNav.tabBarItem.selectedImage = [UIImage imageNamed:@"traveller_select"];
    
    
    MineViewController *MinetC = [[MineViewController alloc] init];
    MinetC.title = @"我的";
    //    UINavigationController *MineNav = [[UINavigationController alloc] initWithRootViewController:MinetC];
    MinetC.tabBarItem.image = [UIImage imageNamed:@"personal_center_normal"];
    MinetC.tabBarItem.selectedImage = [UIImage imageNamed:@"personal_center_select"];
    self.viewControllers = @[payC,sarchNav,wishNav,accountNav,MinetC];
    //    self.tabBarController.view.height = 140;
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
