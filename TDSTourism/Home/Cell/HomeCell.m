//
//  HomeCell.m
//  TDSTourism
//
//  Created by qpple on 2018/10/16.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "HomeCell.h"

@implementation HomeCell

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
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(10, 0, kScreenWidth-20, 245)];
    view1.backgroundColor = [UIColor whiteColor];
    view1.layer.cornerRadius = 3.8;
    [self.contentView addSubview:view1];
    
    
    _Name_Label = [[UILabel alloc] init];
    _Name_Label.frame = CGRectMake(18.5,15,80,20);
    _Name_Label.text = @"吃点啥";
    _Name_Label.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18.1];
    _Name_Label.textColor = [UIColor colorWithRed:51/255 green:51/255 blue:51/255 alpha:1];
    [view1 addSubview:_Name_Label];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(kScreenWidth-100,15,58.4,20);
    label.text = @"查看更多";
    label.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14.1];
    label.textColor = [UIColor colorWithRed:139/255.0 green:138/255.0 blue:138/255.0 alpha:1];
    label.textAlignment = NSTextAlignmentLeft;
    label.alpha = 1;
    label.numberOfLines = 0;
    [view1 addSubview:label];

    UIImageView *JrImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label.frame)+7, 19, 7, 12)];
    JrImage.image = [UIImage imageNamed:@"home-jinru"];
    [view1 addSubview:JrImage];
    
    
    self.OneImage = [[UIImageView alloc] init];
    self.OneImage.frame = CGRectMake(20,CGRectGetMaxY(_Name_Label.frame)+11,(kScreenWidth/2)-40,145.4);
    self.OneImage.image=[UIImage imageNamed:@"home-pic.png"];
    [view1 addSubview:self.OneImage];
    
    _One_Label = [[UILabel alloc] init];
    _One_Label.frame = CGRectMake(20,CGRectGetMaxY(_OneImage.frame)+11,(kScreenWidth/2)-40,20);
    _One_Label.text = @"南极深海螯虾";
    _One_Label.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15.1];
    _One_Label.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
    _One_Label.textAlignment = NSTextAlignmentLeft;
    _One_Label.alpha = 1;
    _One_Label.numberOfLines = 0;
    [view1 addSubview:_One_Label];

    
    _TwoImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_OneImage.frame)+20, CGRectGetMaxY(_Name_Label.frame)+11, (kScreenWidth/2)-40, 145.4)];
//    _TwoImage.contentMode = UIViewContentModeScaleAspectFit;
    _TwoImage.image = [UIImage imageNamed:@"home-pic.png"];
    [view1 addSubview:_TwoImage];

    _Two_Label = [[UILabel alloc] init];
    _Two_Label.frame = CGRectMake(CGRectGetMaxX(_OneImage.frame)+20,CGRectGetMaxY(_OneImage.frame)+11,(kScreenWidth/2)-40,20);
    _Two_Label.text = @"传统毛利窑烤大餐";
    _Two_Label.font = [UIFont fontWithName:@"MicrosoftYaHei" size:15.1];
    _Two_Label.textColor = [UIColor colorWithRed:17/255.0 green:17/255.0 blue:17/255.0 alpha:1];
    _Two_Label.textAlignment = NSTextAlignmentLeft;
    _Two_Label.alpha = 1;
    _Two_Label.numberOfLines = 0;
    [view1 addSubview:_Two_Label];

}

#pragma mark -- set

- (void)setModel:(HomeModel *)model{
    
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
