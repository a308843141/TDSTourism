//
//  HomeViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/10/16.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "HomeViewController.h"
#import "SDCycleScrollView.h"
#import "HomeCell.h"
#import "HomeModel.h"
#import "EatHomeListViewController.h"
#import "MessageViewController.h"
#import "FlightViewController.h"

@interface HomeViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) SDCycleScrollView *lunboScrollView;//轮播

@property (strong, nonatomic) NSArray *banner_image_url;

@property (strong, nonatomic) UIButton *LoginButton;

@property (strong, nonatomic) UIButton *XxButton;

@property(nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UITableView *WCounonTableView;

@property (nonatomic, strong) UILabel *XxLabel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.view.backgroundColor = [UIColor colorWithRed:243/255.0 green:244/255.0 blue:249/255.0 alpha:1];
    self.banner_image_url = @[@"home-pic@2x",@"home-pic@2x",@"personal_center_select",@"home-pic@2x",@"traveller_select@2x"];
    
    [self CreateUI];
    [self.view addSubview:self.WCounonTableView];
}

-(void)CreateUI{
    
    UIView * Tview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 210+11+11+83)];
    self.WCounonTableView.tableHeaderView = Tview;
    
    UIView *viewAll = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 210)];
    
    
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
    
    [Tview addSubview:viewAll];
    
    self.XxButton = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-38,28,17,18)];
    [self.XxButton.layer setMasksToBounds:YES];
    [self.XxButton setImage:[UIImage imageNamed:@"home-lingdang"] forState:UIControlStateNormal];

    [self.XxButton addTarget:self action:@selector(XxAction:) forControlEvents:UIControlEventTouchUpInside];
    [Tview addSubview:self.XxButton];
    
    UIImageView *xximageview = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.XxButton.frame)-4, 20, 16, 16)];
    xximageview.image = [UIImage imageNamed:@"home-hong"];
    [Tview addSubview:xximageview];
    
    
    self.XxLabel = [[UILabel alloc] initWithFrame:CGRectMake(4, 3, 7, 10)];
    self.XxLabel.text = @"6";
    self.XxLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
    self.XxLabel.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    self.XxLabel.textAlignment = NSTextAlignmentLeft;
    [xximageview addSubview:self.XxLabel];
    
    self.LoginButton = [[UIButton alloc] initWithFrame:CGRectMake(10,CGRectGetMaxY(viewAll.frame)+9,kScreenWidth-20,83)];
    [self.LoginButton.layer setMasksToBounds:YES];
    [self.LoginButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
//    self.LoginButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.LoginButton addTarget:self action:@selector(LoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.LoginButton setImage:[UIImage imageNamed:@"首页-飞机@3x"] forState:UIControlStateNormal];
    self.LoginButton.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:215.0/255.0 blue:30.0/255.0 alpha:1];
//    [self.LoginButton setTitle:@"航班" forState:UIControlStateNormal];
//    [self.LoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Tview addSubview:self.LoginButton];
}


#pragma mark -- UITableViewDelegate & UITableViewDataSource

#pragma mark - TableViewDelegate  dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 255;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell" forIndexPath:indexPath];
    
    
//    HomeModel *model = self.dataArray[indexPath.row];
//    cell.model = model;
    
//    cell.editEventHandle = ^{
//        //编辑
//        AddressModel *model = self.dataArray[indexPath.row];
//        AddAddressViewController *vc = [[AddAddressViewController alloc] init];
//        vc.AddStr = @"2";
//        vc.AddSstr = model.id;
//        [self.tableView reloadData];
//        [self.navigationController pushViewController:vc animated:YES];
//
//    };
//    cell.deleteEventHandle  =^{
//        //删除
//        AddressModel *model = self.dataArray[indexPath.row];
//        [self deleteUserAddress:model.id];
//        NSLog(@"删除 %ld",indexPath.row);
//
//    };
//    cell.AddressEventHandle  =^(NSString *value){
//        //        button.selected = !button.selected;
//        //设置默认地址
//        AddressModel *model = self.dataArray[indexPath.row];
//        [self setCustomerAddress:model.id];
//
//    };
    
    return cell;
}

//tableview点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    EatHomeListViewController *evc = [[EatHomeListViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:evc];
    [self presentViewController:nav animated:YES completion:nil];

}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    //    NSString *idStr = self.banner_id[index];
    
    
}

//航班
-(void)LoginAction:(UIButton *)btn{
    //1
    FlightViewController *evc = [[FlightViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:evc];
    [self presentViewController:nav animated:YES completion:nil];
}


//消息
-(void)XxAction:(UIButton *)btn{
    MessageViewController *evc = [[MessageViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:evc];
    [self presentViewController:nav animated:YES completion:nil];
    
}

#pragma mark -- data

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(UITableView *)WCounonTableView{
    if (!_WCounonTableView) {
        self.WCounonTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, kScreenWidth, kScreenHeight)];
//        self.WCounonTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -20, kScreenWidth, kScreenHeight) style:UITableViewCellSeparatorStyleNone];
        self.WCounonTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.WCounonTableView.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1];

        self.WCounonTableView.delegate = self;
        self.WCounonTableView.dataSource = self;
        [self.WCounonTableView registerClass:[HomeCell class] forCellReuseIdentifier:@"HomeCell"];
        
    }
    return _WCounonTableView;
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
