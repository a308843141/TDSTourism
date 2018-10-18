//
//  EatHomeListViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/10/17.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "EatHomeListViewController.h"
#import "EatHomeViewController.h"
#import "EatListCell.h"
#import "EatModel.h"
#import "EatHomeViewController.h"

@interface EatHomeListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UITableView *ECounonTableView;

@property(nonatomic,strong)UIBarButtonItem *mapBtn;//第一个

@property(nonatomic,strong)UIBarButtonItem *messageBtn;//第二个

@end

@implementation EatHomeListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"吃点啥";
    [self addNavViews];
    
    //间隙
    UIBarButtonItem *fixedSpaceBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil]; fixedSpaceBarButtonItem.width = 10;
    self.navigationItem.rightBarButtonItems = @[self.messageBtn,fixedSpaceBarButtonItem,self.mapBtn];
    [self.view addSubview:self.WCounonTableView];
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


//消息
-(void)GjAction:(UIButton *)btn{
    
    NSLog(@"guojia");
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
    return 256;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EatListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EatListCell" forIndexPath:indexPath];
    
    
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
    
    EatHomeViewController *evc = [[EatHomeViewController alloc] init];

    [self.navigationController pushViewController:evc animated:NO];
    
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
    if (!_ECounonTableView) {
//        self.ECounonTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
         self.ECounonTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
   
        self.WCounonTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.WCounonTableView.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1];
        
        self.ECounonTableView.delegate = self;
        self.ECounonTableView.dataSource = self;
        [self.ECounonTableView registerClass:[EatListCell class] forCellReuseIdentifier:@"EatListCell"];
        
    }
    return _ECounonTableView;
}

//第一个
-(UIBarButtonItem *)mapBtn{
    if (!_mapBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(GjAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:[UIImage imageNamed:@"地理坐标@2x"] forState:UIControlStateNormal];
    
        [btn sizeToFit];
        _mapBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    }
    return _mapBtn;

}

//第二个
-(UIBarButtonItem *)messageBtn{
    if (!_messageBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn addTarget:self action:@selector(GjAction:) forControlEvents:UIControlEventTouchUpInside];
        [btn setTitle:@"法国" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor CC_GColor] forState:UIControlStateNormal];
        [btn sizeToFit];
        _messageBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
        
    }
    return _messageBtn;
    
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
