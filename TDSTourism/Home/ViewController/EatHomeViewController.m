//
//  EatHomeViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/10/17.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "EatHomeViewController.h"

@interface EatHomeViewController ()<UIWebViewDelegate>

@property (nonatomic,strong)UIWebView *webView;

@end

@implementation EatHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"吃点啥";
    [self addNavViews];
    [self createui];

}

-(void)createui{

    
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    _webView.dataDetectorTypes = UIDataDetectorTypeAll;
    
    // 2.创建URL
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.106/home/article/show/article_id/17"]];
//    NSURL *url =[NSURL URLWithString:self.UrlStr];
    // 3.创建Request
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    // 4.加载网页
    [_webView loadRequest:request];
    
    [self.view addSubview:_webView];
    
}

//- (void)webViewDidFinishLoad:(UIWebView *)webView //网页加载完成的时候调用
//{
//    CGRect frame = _webView.frame;
//    CGSize fittingSize = [webView sizeThatFits:CGSizeZero];
//    frame.size = fittingSize;
//    _webView.frame = frame;
//
//}



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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
