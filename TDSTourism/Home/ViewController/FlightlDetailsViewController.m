//
//  FlightlDetailsViewController.m
//  TDSTourism
//
//  Created by mac on 2018/10/30.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "FlightlDetailsViewController.h"
#import "CC_FSView.h"
#import "UIBarButtonItem+XYMenu.h"
#import "ShareView.h"

@interface FlightlDetailsViewController ()<UIWebViewDelegate>

@property (nonatomic,strong)CC_FSView *FSView;

@property (nonatomic,strong)UIWebView *webView;

@end

@implementation FlightlDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"详情";
    [self addNavViews];
    [self createui];
    
}

-(void)createui{
    
    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _webView.dataDetectorTypes = UIDataDetectorTypeAll;
    
    // 2.创建URL
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.120/home/article/show/article_id/17"]];
    //    NSURL *url =[NSURL URLWithString:self.UrlStr];
    // 3.创建Request
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    // 4.加载网页
    [_webView loadRequest:request];
    
    [self.view addSubview:_webView];
    
}

- (void)addNavViews{
    
    // 返回按钮
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.frame = CGRectMake(0, 0, 10, 10);
    [leftButton setBackgroundImage:[UIImage imageNamed:@"Disclosure Indicator"] forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftItem;
    [leftButton addTarget:self action:@selector(leftItemAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImage *rightImage = [[UIImage imageNamed:@"详情更多"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc]initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(RightButtonAction:)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    
}

- (void)RightButtonAction:(id)sender{
    UIBarButtonItem *item = (UIBarButtonItem *)sender;
    NSArray *imageArr = @[@"详情收 藏", @"详情分享"];
    NSArray *titleArr = @[@"收藏", @"分享"];
    [item xy_showMenuWithImages:imageArr titles:titleArr menuType:XYMenuRightNavBar currentNavVC:self.navigationController withItemClickIndex:^(NSInteger index) {
        NSLog(@"index    %ld",(long)index);
        [self selectIndex:index];
    }];
}

//点击的第几个、、、、1收藏   2 分享
-(void)selectIndex:(NSInteger)index
{
    switch (index) {
        case 1:
            
            break;
        case 2:
            [self shareClick];
            
            break;
        default:
            break;
    }
}

-(void)shareClick
{
    ShareView *view = [[[NSBundle mainBundle]loadNibNamed:@"ShareView" owner:self options:nil]objectAtIndex:0];
    view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [[[UIApplication sharedApplication].delegate window]addSubview:view];
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
