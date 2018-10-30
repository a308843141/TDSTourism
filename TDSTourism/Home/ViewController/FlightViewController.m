//
//  FlightViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/10/25.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "FlightViewController.h"
#import "HomeCell.h"
#import "FlightlListViewController.h"
#import "FlightlDetailsViewController.h"

@interface FlightViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UIButton *LoginButton;

@property (nonatomic, strong) UITableView *WCounonTableView;

@property(nonatomic,strong) NSMutableArray *dataArray;

@property(nonatomic,strong) UILabel *SerchLabel;


@end

@implementation FlightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"查点啥";
    [self addNavViews];
    [self CreateUI];
    [self.view addSubview:self.WCounonTableView];
}

-(void)CreateUI{
    
    UIView * Tview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 141+733+191)];
    Tview.layer.backgroundColor = [UIColor colorWithRed:243/255.0 green:244/255.0 blue:249/255.0 alpha:1].CGColor;
    self.WCounonTableView.tableHeaderView = Tview;
    
    
    self.LoginButton = [[UIButton alloc] initWithFrame:CGRectMake(10,0,kScreenWidth-20,83)];
    [self.LoginButton.layer setMasksToBounds:YES];
    [self.LoginButton.layer setCornerRadius:5.0]; //设置矩形四个圆角半径
    //    self.LoginButton.titleLabel.font=[UIFont systemFontOfSize:16];
    [self.LoginButton addTarget:self action:@selector(LoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.LoginButton setImage:[UIImage imageNamed:@"首页-飞机@3x"] forState:UIControlStateNormal];
    self.LoginButton.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:215.0/255.0 blue:30.0/255.0 alpha:1];
    //    [self.LoginButton setTitle:@"航班" forState:UIControlStateNormal];
    //    [self.LoginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Tview addSubview:self.LoginButton];
    
    UIView *viewAll = [[UIView alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(self.LoginButton.frame), kScreenWidth-20, 55)];
    viewAll.backgroundColor = [UIColor whiteColor];
    [Tview addSubview:viewAll];
    
    
    UIImageView *sview = [[UIImageView alloc] init];
    sview.frame = CGRectMake(17,15,kScreenWidth-44-38,27);
    sview.layer.backgroundColor = [UIColor colorWithRed:243/255.0 green:244/255.0 blue:249/255.0 alpha:1].CGColor;
    sview.layer.cornerRadius = 4;
    [viewAll addSubview:sview];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTap:)];
    // 允许用户交互
    sview.userInteractionEnabled = YES;
    
    [sview addGestureRecognizer:tap];

    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(kScreenWidth-45-15,20,35,12);
    label.text = @"搜索";
    label.font = [UIFont fontWithName:@"MicrosoftYaHei" size:12];
    label.textColor = [UIColor colorWithRed:245/255.0 green:166/255.0 blue:35/255.0 alpha:1];
    label.textAlignment = NSTextAlignmentLeft;
    label.alpha = 1;
    label.numberOfLines = 0;
    [viewAll addSubview:label];
    
    UIImageView *images = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, 16, 16)];
    images.image = [UIImage imageNamed:@"Shape@2x"];
//    images.backgroundColor = [UIColor redColor];
    [sview addSubview:images];
    
    self.SerchLabel = [[UILabel alloc] init];
    self.SerchLabel.frame = CGRectMake(49,4,242,19);
    self.SerchLabel.text = @"全日空";
    self.SerchLabel.font = [UIFont fontWithName:@"MicrosoftYaHei" size:14];
    self.SerchLabel.textColor = [UIColor colorWithRed:20/255.0 green:21/255.0 blue:23/255.0 alpha:1];
    self.SerchLabel.textAlignment = NSTextAlignmentLeft;
    self.SerchLabel.alpha = 1;
    self.SerchLabel.numberOfLines = 0;
    [sview addSubview:self.SerchLabel];
    
    UIView *zview = [[UIView alloc] init];
    zview.frame = CGRectMake(10,148,kScreenWidth-20,723+191);
    zview.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1].CGColor;
    zview.layer.cornerRadius = 4;
    zview.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.15].CGColor;
    zview.layer.shadowOffset = CGSizeMake(0,5);
    zview.layer.shadowOpacity = 1;
    zview.layer.shadowRadius = 14;
    [Tview addSubview:zview];
    
    UIImageView *view1 = [[UIImageView alloc] init];
    view1.frame = CGRectMake(0,0,kScreenWidth-20,63+48);
    view1.image = [UIImage imageNamed:@"航班@2x"];
    [zview addSubview:view1];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.frame = CGRectMake(10,28,196,24);
    label1.text = @"行李规格限制";
    label1.font = [UIFont fontWithName:@"MicrosoftYaHei" size:16];
    label1.textColor = [UIColor colorWithRed:26/255.0 green:26/255.0 blue:26/255.0 alpha:1];
    label1.textAlignment = NSTextAlignmentLeft;
    [zview addSubview:label1];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.frame = CGRectMake(10,81,180,22);
    label2.text = @"免费行李额";
    label2.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    label2.textColor = [UIColor colorWithRed:3/255.0 green:53/255.0 blue:119/255.0 alpha:1];
    label2.textAlignment = NSTextAlignmentLeft;
    label2.alpha = 1;
    label2.numberOfLines = 0;
    [zview addSubview:label2];
    
    UIImageView *image11 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(view1.frame), kScreenWidth-20, 201)];
    image11.image = [UIImage imageNamed:@"Group 38@2x"];
    [zview addSubview:image11];
    
    UIView *bview = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(image11.frame), kScreenWidth-20, 44)];
    bview.backgroundColor = [UIColor whiteColor];
    [zview addSubview:bview];
    
    UILabel *label22 = [[UILabel alloc] init];
    label22.frame = CGRectMake(10,15,296,22);
    label22.text = @"额外行李费用";
    label22.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    label22.textColor = [UIColor colorWithRed:3/255.0 green:53/255.0 blue:119/255.0 alpha:1];
    label22.textAlignment = NSTextAlignmentLeft;
    label22.alpha = 1;
    label22.numberOfLines = 0;
    [bview addSubview:label22];
    
    UIImageView *image22 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bview.frame), kScreenWidth-20, 201)];
    image22.image = [UIImage imageNamed:@"Group 37"];
    [zview addSubview:image22];
    
    UIView *bview1 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(image22.frame), kScreenWidth-20, 44)];
    bview1.backgroundColor = [UIColor whiteColor];
    [zview addSubview:bview1];
    
    UILabel *labe33 = [[UILabel alloc] init];
    labe33.frame = CGRectMake(10,15,260,22);
    labe33.text = @"我们如何携带下类物品";
    labe33.font = [UIFont fontWithName:@"PingFangSC-Regular" size:16];
    labe33.textColor = [UIColor colorWithRed:3/255.0 green:53/255.0 blue:119/255.0 alpha:1];
    labe33.textAlignment = NSTextAlignmentLeft;
    labe33.alpha = 1;
    labe33.numberOfLines = 0;
    [bview1 addSubview:labe33];

    
    UIImageView *image33 = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bview1.frame), kScreenWidth-20, 102)];
    image33.image = [UIImage imageNamed:@"Group 371"];
//    image33.backgroundColor = [UIColor blackColor];
    [zview addSubview:image33];
    
    UIButton *FButton = [[UIButton alloc] initWithFrame:CGRectMake(0,CGRectGetMaxY(image33.frame)+10,kScreenWidth,181)];
    [FButton.layer setMasksToBounds:YES];

    [FButton addTarget:self action:@selector(FAction:) forControlEvents:UIControlEventTouchUpInside];
    [FButton setImage:[UIImage imageNamed:@"shipping"] forState:UIControlStateNormal];

    [zview addSubview:FButton];
    
}

//航班
-(void)LoginAction:(UIButton *)btn{
    //1
    
}

//托运
-(void)FAction:(UIButton *)btn{
    //1
    FlightlDetailsViewController *Fvc = [[FlightlDetailsViewController alloc] init];
    [self.navigationController pushViewController:Fvc animated:YES];
    
}
//搜索
- (void)doTap:(NSString *)str{
    NSLog(@"111");
    FlightlListViewController *Fvc = [[FlightlListViewController alloc] init];
    [self.navigationController pushViewController:Fvc animated:NO];
}


#pragma mark -- UITableViewDelegate & UITableViewDataSource

#pragma mark - TableViewDelegate  dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 1;
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
    [self dismissViewControllerAnimated:NO completion:nil];
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
        self.WCounonTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
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
