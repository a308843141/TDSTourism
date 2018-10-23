//
//  MenuView.h
//  ChengDe
//
//  Created by mac on 15/12/7.
//  Copyright (c) 2015年 wgy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuViewDelegate <NSObject>

- (void)menuButtonDidSelectAtIndex:(NSInteger)index;

@end

@interface MenuView : UIView

@property (nonatomic, strong) NSArray *listArray;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, assign) id <MenuViewDelegate> delegate;

- (void)menuDidSelectAtIndex:(NSInteger)index;

@end
