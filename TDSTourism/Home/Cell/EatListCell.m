//
//  EatListCell.m
//  TDSTourism
//
//  Created by qpple on 2018/10/17.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "EatListCell.h"

@implementation EatListCell

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
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10, 10, kScreenWidth-20, 246)];
    view1.backgroundColor = [UIColor whiteColor];
    view1.layer.cornerRadius = 3.8;
    [self.contentView addSubview:view1];
    
    _EatImage = [[UIImageView alloc] init];
    _EatImage.frame = CGRectMake(0,0,kScreenWidth-20,199.1);
    _EatImage.image = [UIImage imageNamed:@"home-pic"];
    [view1 addSubview:_EatImage];
    
    
    _Eat_Label = [[UILabel alloc] init];
    _Eat_Label.frame = CGRectMake(5,CGRectGetMaxY(_EatImage.frame)+10,kScreenWidth-10,19.3);
    _Eat_Label.text = @"黑边鲍鱼（Pāua）";
    _Eat_Label.font = [UIFont fontWithName:@"MicrosoftYaHei" size:16];
    _Eat_Label.textColor = [UIColor colorWithRed:14/255.0 green:14/255.0 blue:15/255.0 alpha:1];
    _Eat_Label.textAlignment = NSTextAlignmentLeft;
    _Eat_Label.alpha = 1;
    _Eat_Label.numberOfLines = 0;
    [view1 addSubview:_Eat_Label];
    
    
}

#pragma mark -- set

- (void)setModel:(EatModel *)model{
    
//    _Hb_Label.text =model.scene;
//    self.DD_Label.text =[NSString stringWithFormat:@"%@：%@",model.scene,model.order_number];
//    self.Sj_Label.text = model.pay_time;
//    self.Money_Label.text =model.alter;
//    if ([model.alter intValue] >0.00) {
//        _Money_Label.textColor = [UIColor CC_GColor];
//    }else{
//        _Money_Label.textColor = [UIColor redColor];
//    }
    
}

@end
