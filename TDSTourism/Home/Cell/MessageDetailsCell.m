//
//  MessageDetailsCell.m
//  TDSTourism
//
//  Created by qpple on 2018/10/20.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "MessageDetailsCell.h"

@implementation MessageDetailsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addAllViews];
    }
    return self;
}


- (void)addAllViews{
    
    self.contentView.backgroundColor = [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(kScreenWidth/2-60,11,120,19.2);
    view.layer.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.31].CGColor;
    view.layer.cornerRadius = 9.6;
    [self addSubview:view];
    
    
    _Name_Label = [[UILabel alloc] init];
    _Name_Label.frame = CGRectMake(1,1,120,18);
    _Name_Label.text = @"星期三08:40";
    _Name_Label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12.8];
    _Name_Label.textColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    _Name_Label.textAlignment = NSTextAlignmentCenter;
    _Name_Label.alpha = 1;
    _Name_Label.numberOfLines = 0;
    [view addSubview:_Name_Label];
    
    UIView *Bview = [[UIView alloc] init];
    Bview.frame = CGRectMake(11,CGRectGetMaxY(view.frame)+13,kScreenWidth-20,110);
    Bview.backgroundColor = [UIColor whiteColor];
    Bview.layer.cornerRadius = 4;
    [self addSubview:Bview];
    
    _One_Label = [[UILabel alloc] init];
    _One_Label.frame = CGRectMake(10,7,kScreenWidth-40,20);
    _One_Label.text = @"包裹已下单";
    _One_Label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    _One_Label.textColor = [UIColor colorWithRed:44/255.0 green:42/255.0 blue:42/255.0 alpha:1];
    _One_Label.textAlignment = NSTextAlignmentLeft;
    _One_Label.alpha = 1;
    _One_Label.numberOfLines = 0;
    [Bview addSubview:_One_Label];
    
    _OneImage = [[UIImageView alloc] init];
    _OneImage.frame = CGRectMake(10,CGRectGetMaxY(_One_Label.frame)+4,70,70);
    _OneImage.image = [UIImage imageNamed:@"home-pic.png"];
    [Bview addSubview:_OneImage];
    
    _Two_Label = [[UILabel alloc] init];
    _Two_Label.frame = CGRectMake(CGRectGetMaxX(_OneImage.frame)+10,CGRectGetMaxY(_One_Label.frame)+4,kScreenWidth-120,60);
    _Two_Label.text = @"您的包裹已下单，A用户为你带包裹啦！ 快去查看。";
    _Two_Label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    _Two_Label.textColor = [UIColor colorWithRed:44/255.0 green:42/255.0 blue:42/255.0 alpha:1];
    _Two_Label.textAlignment = NSTextAlignmentLeft;
    _Two_Label.alpha = 1;
    _Two_Label.numberOfLines = 0;
    [Bview addSubview:_Two_Label];
    
}

@end
