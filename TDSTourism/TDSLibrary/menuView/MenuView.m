//
//  MenuView.m
//  ChengDe
//
//  Created by mac on 15/12/7.
//  Copyright (c) 2015年 wgy. All rights reserved.
//

#import "MenuView.h"


@interface MenuView ()


@end

@implementation MenuView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addAllViews];
    }
    return self;
}

- (void)setListArray:(NSArray *)listArray{
    _listArray = listArray;
    for (int i = 0; i < self.listArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(kScreenWidth / self.listArray.count * i, 0, kScreenWidth / self.listArray.count, CGRectGetHeight(self.frame) - 2);
        [button setTitle:self.listArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithWhite:0.325 alpha:1.000] forState:UIControlStateNormal];
        if (i == 0) {
            [button setTitleColor:[UIColor CC_GColor] forState:UIControlStateNormal];
        }
        button.tag = 200 + i;
        [button addTarget:self action:@selector(buttonDidSelect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 2, kScreenWidth / self.listArray.count, 2)];
    self.lineView.backgroundColor = [UIColor CC_GColor];
    [self addSubview:self.lineView];
    
}

- (void)addAllViews{
    NSLog(@"%@", self.listArray);
    for (int i = 0; i < self.listArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(kScreenWidth / self.listArray.count * i, 0, kScreenWidth / self.listArray.count, CGRectGetHeight(self.frame) - 2);
        [button setTitle:self.listArray[i] forState:UIControlStateNormal];
        button.tag = 200 + i;
        [button addTarget:self action:@selector(buttonDidSelect:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.frame) - 2, kScreenWidth / self.listArray.count, 2)];
    self.lineView.backgroundColor = [UIColor CC_GColor];
}

- (void)buttonDidSelect:(UIButton *)sender{
    for (UIButton *button in self.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            [button setTitleColor:[UIColor colorWithWhite:0.325 alpha:1.000] forState:UIControlStateNormal];
        }
    }
    [sender setTitleColor:[UIColor CC_GColor] forState:UIControlStateNormal];
    if (self.delegate && [self.delegate respondsToSelector:@selector(menuButtonDidSelectAtIndex:)]) {
        [self.delegate menuButtonDidSelectAtIndex:sender.tag - 200];
    }
}

- (void)menuDidSelectAtIndex:(NSInteger)index{
    [UIView animateWithDuration:0.25 animations:^{
        [self.lineView setFrame:CGRectMake(kScreenWidth / self.listArray.count * index, CGRectGetHeight(self.frame) - 2, kScreenWidth / self.listArray.count, 2)];
        for (UIButton *button in self.subviews) {
            if ([button isKindOfClass:[UIButton class]]) {
                [button setTitleColor:[UIColor colorWithWhite:0.325 alpha:1.000] forState:UIControlStateNormal];
            }
            if (button.tag == index + 200) {
                [button setTitleColor:[UIColor CC_GColor] forState:UIControlStateNormal];
            }
        }
    }];
}

@end
