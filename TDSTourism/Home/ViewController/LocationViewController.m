//
//  LocationViewController.m
//  TDSTourism
//
//  Created by gongzhichao on 2018/10/19.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "LocationViewController.h"
#import "ZCSearchBar.h"
#import "MenuView.h"
#import "InternationalViewController.h"
#import "DomesticViewController.h"

@interface LocationViewController ()<UISearchBarDelegate,MenuViewDelegate,UIScrollViewDelegate>
@property (nonatomic,strong)ZCSearchBar *searchBar;
// 滑动视图
@property (nonatomic, strong) UIScrollView *scrollView;
// 标签栏
@property (nonatomic, strong) MenuView *menuView;

@property (nonatomic, strong) InternationalViewController *internationVC;
@property (nonatomic, strong) DomesticViewController *demesticVC;

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addSearchBar];
    [self addNavViews];
    [self.view addSubview:self.menuView];
    [self.view addSubview:self.scrollView];
    [self addChildVC];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(searchKeyboardCannel) name:@"TPNotificationName" object:nil];


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

- (void)addChildVC
{
    [self addChildViewController:self.internationVC];
    [self addChildViewController:self.demesticVC];
    // daifahuo
    [self.internationVC willMoveToParentViewController:self];
    self.internationVC.view.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, self.scrollView.frame.size.height);
    [self.scrollView addSubview:self.internationVC.view];
    [self.internationVC didMoveToParentViewController:self];
    // daifukuan
    [self.demesticVC willMoveToParentViewController:self];
    self.demesticVC.view.frame = CGRectMake(0, 0, kScreenWidth, self.scrollView.frame.size.height);
    [self.scrollView addSubview:self.demesticVC.view];
    [self.demesticVC didMoveToParentViewController:self];
   
}

#pragma mark scrollView滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger pageIndex = scrollView.contentOffset.x / DeviceSize.width;
    [self.menuView menuDidSelectAtIndex:pageIndex];
}

#pragma mark - MenuView Delegate
- (void)menuButtonDidSelectAtIndex:(NSInteger)index
{
    [UIView animateWithDuration:0.2 animations:^{
        [self.scrollView setContentOffset:CGPointMake(kScreenWidth * index, 0)];
    }];
}

- (MenuView *)menuView{
    if (!_menuView) {
        _menuView = [[MenuView alloc] initWithFrame:CGRectMake(0, 75, kScreenWidth, kMenuHeight)];
        _menuView.listArray = @[@"国内城市", @"国际/地区"];
        _menuView.delegate = self;
    }
    return _menuView;
}

#pragma mark - 懒加载
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kMenuHeight+75, kScreenWidth, kScreenHeight - kMenuHeight)];
        [_scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(kScreenWidth * 2, 0);
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.pagingEnabled = YES;

    }
    return _scrollView;
}
// 返回
- (void)leftItemAction:(UIButton *)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}


//添加搜索条
- (void)addSearchBar {
    //加上 搜索栏
    _searchBar = [[ZCSearchBar alloc] initWithFrame:CGRectMake(40, 0, self.view.frame.size.width - 60, 35)];
    _searchBar.backgroundColor = [UIColor clearColor];
    _searchBar.delegate = self;
    _searchBar.placeholder = @"城市(如beijing)";
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


- (InternationalViewController *)internationVC{
    if (!_internationVC) {
        _internationVC = [InternationalViewController new];
    }
    return _internationVC;
}

- (DomesticViewController *)demesticVC{
    if (!_demesticVC) {
        _demesticVC = [DomesticViewController new];
    }
    return _demesticVC;
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
