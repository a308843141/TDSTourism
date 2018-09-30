//
//  HomeViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/9/4.
//  Copyright © 2018年 qpple. All rights reserved.
//

#import "HomeViewController.h"
#import "SDCycleScrollView.h"

@interface HomeViewController ()<SDCycleScrollViewDelegate>

@property (strong, nonatomic) SDCycleScrollView *lunboScrollView;//轮播

@property (strong, nonatomic) NSArray *banner_image_url;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title =@"途点啥-您的跨国寄运专家";
    
    self.banner_image_url = @[@"WechatIMG13",@"frontpage_normal@2x",@"personal_center_select",@"send_out_select@2x",@"traveller_select@2x"];
    
    [self CreateUI];
    //  @{@"home-t@2x",@"分类"};
    
}

-(void)CreateUI{
    UIView *viewAll = [[UIView alloc] initWithFrame:CGRectMake(0, 24, kScreenWidth, 170)];
    
    
    if (self.banner_image_url.count == 1) {
        self.lunboScrollView = [SDCycleScrollView cycleScrollViewWithFrame:viewAll.frame  shouldInfiniteLoop:NO imageNamesGroup:self.banner_image_url];
    }else{
        // 本地加载图片的轮播器
        self.lunboScrollView = [SDCycleScrollView cycleScrollViewWithFrame:viewAll.frame  imageNamesGroup:self.banner_image_url];
        
        // 网络加载图片的轮播器
        //        self.lunboScrollView = [SDCycleScrollView cycleScrollViewWithFrame:viewAll.frame imageURLStringsGroup:self.banner_image_url placeholderImage:[UIImage imageNamed:@"home-t@2x"]];
    }
    self.lunboScrollView.delegate = self;
    self.lunboScrollView.autoScroll = YES;
    self.lunboScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    [viewAll addSubview:self.lunboScrollView];
    
    
    [self.view addSubview:viewAll];
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    //    NSString *idStr = self.banner_id[index];
   
    
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