//
//  InternationalViewController.m
//  TDSTourism
//
//  Created by gongzhichao on 2018/10/19.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "InternationalViewController.h"
#import "InternationModel.h"
#import "ChineseString.h"
#import "NSObject+Index.h"

@interface InternationalViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSIndexPath *selIndexPath;
    NSMutableArray * _listArray; //源数据
    NSMutableArray *_AbcSort;   //排序整理后的数组
    NSMutableArray *_sectionHeadsKeys;//存放索引的数组

}
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;
@property (nonatomic,strong)NSString *sellectId;
@property (nonatomic,strong)NSMutableArray *rightDataArray;

@end

@implementation InternationalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArray = [[NSMutableArray alloc]init];
    self.rightDataArray = [[NSMutableArray alloc]init];
     NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Property List" ofType:@"plist"]];
    for (NSDictionary *dic in arr) {
        InternationModel *model = [[InternationModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [self.dataArray addObject:model];
    }
    InternationModel *model = [self.dataArray firstObject];
    [self createDataForRightTableView:model.cityid];
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.rightTableView];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == _leftTableView) {
        return 1;
    }else{
        return [ _AbcSort count ];;

    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_leftTableView == tableView)
    {
        return self.dataArray.count;
        
    }
    else
    {
        return   [[ _AbcSort objectAtIndex :section] count ];
    }
}

- ( NSString *)tableView:( UITableView *)tableView titleForHeaderInSection:( NSInteger )section
{
    if (tableView == _leftTableView) {
        return nil;
    }else{
        return [ _sectionHeadsKeys objectAtIndex :section];
    }
   
}



- (NSArray*)sectionIndexTitlesForTableView:( UITableView *)tableView

{
    if (tableView == _leftTableView) {
        return nil;
    }else{
        return _sectionHeadsKeys ;
    }
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_leftTableView == tableView)
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LeftTableViewCell" forIndexPath:indexPath];
        if (selIndexPath) {
            if (selIndexPath == indexPath) {
                cell.textLabel.textColor = [UIColor orangeColor];
                cell.backgroundColor = [UIColor whiteColor];
            }else {
                cell.textLabel.textColor = [UIColor blackColor];
                cell.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
            }
        }else{
            cell.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
            if (indexPath.section == 0 && indexPath.row == 0) {
                cell.backgroundColor = [UIColor whiteColor];
            }
        }
        InternationModel *model = self.dataArray[indexPath.row];
        cell.textLabel.text = model.state;
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RightTableViewCell" forIndexPath:indexPath];
        if ([ _AbcSort count ] > indexPath. section )
        {
            NSArray *arr = [ _AbcSort objectAtIndex :indexPath. section ];
            if ([arr count ] > indexPath. row )
            {
                ChineseString *str = ( ChineseString *) [arr objectAtIndex :indexPath. row ];
                cell. textLabel . text = str. string ;
            }
        }
        
        cell.textLabel.textColor = [UIColor blackColor];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == _leftTableView) {
        return 0.01;

    }else{
        return 25;
    }
}


#pragma mark  -select cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"TPNotificationName" object:nil userInfo:nil];

    if (tableView == _leftTableView) {
        InternationModel *model = self.dataArray[indexPath.row];
        selIndexPath = indexPath;
        [self createDataForRightTableView:model.cityid];
        [tableView reloadData];
    }else{
//        [tableView reloadData];
    }
    
}

-(void)createDataForRightTableView:(NSString *)selectId
{
    _AbcSort=[[NSMutableArray alloc]init];
    _sectionHeadsKeys=[[NSMutableArray alloc]init];
    _listArray = [[NSMutableArray alloc]init];
//    [self.rightDataArray removeAllObjects];
    for (InternationModel *model in self.dataArray) {
        if ([model.cityid isEqualToString:selectId]) {
            [_listArray addObjectsFromArray:model.cities];
        }
    }
    
    _AbcSort = [ self getChineseStringArr : _listArray andSck:_sectionHeadsKeys ];

    [_leftTableView reloadData];
    [_rightTableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftTableView) {
        return 80;
    }else{
        return 45;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 0.00001;
}

- (UITableView *)leftTableView
{
    if (!_leftTableView)
    {
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 80, kScreenHeight-64)];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _leftTableView.showsVerticalScrollIndicator = NO;
        _leftTableView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_leftTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"LeftTableViewCell"];
        
        
    }
    return _leftTableView;
}

- (UITableView *)rightTableView
{
    if (!_rightTableView)
    {
        _rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(80, 0, kScreenWidth-80, kScreenHeight-64)];
        _rightTableView.delegate = self;
        _rightTableView.dataSource = self;
        _rightTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _rightTableView.showsVerticalScrollIndicator = NO;
        _rightTableView.backgroundColor = [UIColor clearColor];
        [_rightTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"RightTableViewCell"];
    }
    return _rightTableView;
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
