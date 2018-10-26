//
//  HomeCell.h
//  TDSTourism
//
//  Created by qpple on 2018/10/16.
//  Copyright © 2018 qpple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeCell : UITableViewCell

@property (strong, nonatomic) UILabel *Name_Label;

@property (strong, nonatomic) UILabel *One_Label;

@property (strong, nonatomic) UILabel *Two_Label;

@property (strong, nonatomic) UIImageView *OneImage;

@property (strong, nonatomic) UIImageView *TwoImage;

@property(nonatomic,strong) HomeModel *model;

@end

NS_ASSUME_NONNULL_END
