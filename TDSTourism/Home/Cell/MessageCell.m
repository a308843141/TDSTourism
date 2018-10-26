//
//  MessageCell.m
//  TDSTourism
//
//  Created by qpple on 2018/10/18.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addAllViews];
    }
    return self;
}


- (void)addAllViews{
    
    self.OneImage = [[UIImageView alloc] init];
    self.OneImage.frame = CGRectMake(10,18,50,50);
    self.OneImage.image=[UIImage imageNamed:@"消息头像"];
    [self addSubview:self.OneImage];
    
    _Name_Label = [[UILabel alloc] init];
    _Name_Label.frame = CGRectMake(75,17,175,18);
    _Name_Label.text = @"通知中心";
    _Name_Label.font = [UIFont fontWithName:@"MicrosoftYaHei" size:16];
    _Name_Label.textColor = [UIColor colorWithRed:26/255.0 green:26/255.0 blue:26/255.0 alpha:1];
    _Name_Label.textAlignment = NSTextAlignmentLeft;
    _Name_Label.alpha = 1;
    _Name_Label.numberOfLines = 0;
    [self addSubview:_Name_Label];
    
    
    _One_Label = [[UILabel alloc] init];
    _One_Label.frame = CGRectMake(75,CGRectGetMaxY(_Name_Label.frame)+10,kScreenWidth-41-13-72,18);
    _One_Label.text = @"A用户为你带包裹啦！快去查看啊";
    _One_Label.font = [UIFont fontWithName:@"MicrosoftYaHei" size:14];
    _One_Label.textColor = [UIColor colorWithRed:140/255.0 green:142/255.0 blue:145/255.0 alpha:1];
    _One_Label.textAlignment = NSTextAlignmentLeft;
    _One_Label.alpha = 1;
    _One_Label.numberOfLines = 0;
    [self addSubview:_One_Label];
    
    
    _Two_Label = [[UILabel alloc] init];
    _Two_Label.frame = CGRectMake(kScreenWidth-41-13,18,41,18);
    _Two_Label.text = @"11:30";
    _Two_Label.font = [UIFont fontWithName:@"MicrosoftYaHei" size:12];
    _Two_Label.textColor = [UIColor colorWithRed:140/255.0 green:142/255.0 blue:145/255.0 alpha:1];
    _Two_Label.textAlignment = NSTextAlignmentLeft;
    _Two_Label.alpha = 1;
    _Two_Label.numberOfLines = 0;
    [self addSubview:_Two_Label];
    
    _ImageView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_Two_Label.frame)+1, 25, 6, 6)];
    _ImageView.backgroundColor = [UIColor redColor];
    [self addSubview:_ImageView];
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(70, 81, kScreenWidth-70, 0.2)];
    view.backgroundColor = [UIColor grayColor];
    [self addSubview:view];
    
    
}

@end
