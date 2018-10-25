//
//  DomesticViewController.m
//  TDSTourism
//
//  Created by gongzhichao on 2018/10/19.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "DomesticViewController.h"
#import "ChineseString.h"
#import "NSObject+Index.h"

@interface DomesticViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray * _listArray; //源数据
    NSMutableArray *_AbcSort;   //排序整理后的数组
    NSMutableArray *_sectionHeadsKeys;//存放索引的数组
    
    
}

@property (nonatomic, strong) UITableView *WCounonTableView;


@end

@implementation DomesticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
