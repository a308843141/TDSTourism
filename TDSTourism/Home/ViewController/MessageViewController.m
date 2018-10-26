//
//  MessageViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/10/18.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageModel.h"
#import "MessageCell.h"
#import "MessageDetailsViewController.h"

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UITableView *MCounonTableView;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"消息";
    [self addNavViews];
    
    //间隙
    UIBarButtonItem *fixedSpaceBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil]; fixedSpaceBarButtonItem.width = 10;
    
    [self.view addSubview:self.MCounonTableView];
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


#pragma mark -- UITableViewDelegate & UITableViewDataSource

#pragma mark - TableViewDelegate  dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 82;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     MessageCell*cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCell" forIndexPath:indexPath];
    
    
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
    
    MessageDetailsViewController *evc = [[MessageDetailsViewController alloc] init];

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

-(UITableView *)MCounonTableView{
    if (!_MCounonTableView) {
        //        self.ECounonTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
        self.MCounonTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        
        self.MCounonTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.MCounonTableView.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1];
        
        self.MCounonTableView.delegate = self;
        self.MCounonTableView.dataSource = self;
        [self.MCounonTableView registerClass:[MessageCell class] forCellReuseIdentifier:@"MessageCell"];
        
    }
    return _MCounonTableView;
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
