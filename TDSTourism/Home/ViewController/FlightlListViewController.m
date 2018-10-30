//
//  FlightlListViewController.m
//  TDSTourism
//
//  Created by qpple on 2018/10/26.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "FlightlListViewController.h"
#import "ZCSearchBar.h"
#import "ChineseString.h"
#import "NSObject+Index.h"

@interface FlightlListViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray * _listArray; //源数据
    NSMutableArray *_AbcSort;   //排序整理后的数组
    NSMutableArray *_sectionHeadsKeys;//存放索引的数组
}

@property (nonatomic,strong)ZCSearchBar *searchBar;
@property (nonatomic, strong) UITableView *WCounonTableView;


@end

@implementation FlightlListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     [self addNavViews];
    [self addSearchBar];
    
    _AbcSort=[[NSMutableArray alloc]init];
    _sectionHeadsKeys=[[NSMutableArray alloc]init];
    _listArray = [[NSMutableArray alloc]init];
    NSArray *arrr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"]];
    for (NSDictionary *dic in arrr) {
        [_listArray addObjectsFromArray:dic[@"cities"]];
    }
    //获取数据
    _AbcSort = [ self getChineseStringArr : _listArray andSck:_sectionHeadsKeys ];
    [self.view addSubview:self.WCounonTableView];

}

- ( NSInteger )tableView:( UITableView *)tableView numberOfRowsInSection:( NSInteger )section

{
    
    return   [[ _AbcSort objectAtIndex :section] count ];
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(cell == nil)
    {
        //默认单元格样式
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    
    if ([ _AbcSort count ] > indexPath. section )
    {
        NSArray *arr = [ _AbcSort objectAtIndex :indexPath. section ];
        if ([arr count ] > indexPath. row )
        {
            ChineseString *str = ( ChineseString *) [arr objectAtIndex :indexPath. row ];
            cell. textLabel . text = str. string ;
        }
    }
    
    
    
    return cell;
    
    
}

- ( NSString *)tableView:( UITableView *)tableView titleForHeaderInSection:( NSInteger )section

{
    return [ _sectionHeadsKeys objectAtIndex :section];
    
}



- (NSArray*)sectionIndexTitlesForTableView:( UITableView *)tableView

{
    
    return _sectionHeadsKeys ;
    
}
- (NSInteger)numberOfSectionsInTableView:( UITableView *)tableView
{
    
    return [ _AbcSort count ];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TPNotificationName" object:nil userInfo:nil];
    
}


-(UITableView *)WCounonTableView{
    if (!_WCounonTableView) {
        self.WCounonTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
        self.WCounonTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.WCounonTableView.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1];
        self.WCounonTableView.delegate = self;
        self.WCounonTableView.dataSource = self;
        
    }
    return _WCounonTableView;
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
    [self.navigationController popViewControllerAnimated:NO];
}

//添加搜索条
- (void)addSearchBar {
    //加上 搜索栏
    _searchBar = [[ZCSearchBar alloc] initWithFrame:CGRectMake(40, 0, self.view.frame.size.width - 60, 35)];
    _searchBar.backgroundColor = [UIColor clearColor];
    _searchBar.delegate = self;
    _searchBar.placeholder = @"请搜索航空／航空代码";
    _searchBar.cursorColor = [UIColor grayColor];
    _searchBar.searchBarTextField.layer.cornerRadius = 0.2;
    _searchBar.searchBarTextField.layer.masksToBounds = YES;
    _searchBar.searchBarTextField.textColor = [UIColor grayColor];
    _searchBar.searchBarTextField.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
    _searchBar.clearButtonImage = [UIImage imageNamed:@"demand_delete"];
    _searchBar.hideSearchBarBackgroundImage = YES;
    self.navigationItem.titleView = _searchBar;
}

#pragma mark - UISearchBar Delegate

//已经开始编辑时的回调
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    ZCSearchBar *sear = (ZCSearchBar *)searchBar;
    //取消按钮
    sear.cancleButton.backgroundColor = [UIColor clearColor];
    [sear.cancleButton setTitle:@"取消" forState:UIControlStateNormal];
    [sear.cancleButton setTitleColor:[UIColor colorWithWhite:0.8 alpha:1] forState:UIControlStateNormal];
    sear.cancleButton.titleLabel.font = [UIFont systemFontOfSize:14];
}

//编辑文字改变的回调
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"searchText:%@",searchText);
}

//搜索按钮
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
}

//取消按钮点击的回调
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    searchBar.showsCancelButton = NO;
    searchBar.text = nil;
    [self.view endEditing:YES];
    [searchBar resignFirstResponder];
}

-(void)searchKeyboardCannel
{
    if (_searchBar.showsCancelButton) {
        _searchBar.showsCancelButton = NO;
        [self.view endEditing:YES];
        [_searchBar resignFirstResponder];
    }
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
