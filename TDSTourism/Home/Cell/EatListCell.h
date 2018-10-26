//
//  EatListCell.h
//  TDSTourism
//
//  Created by qpple on 2018/10/17.
//  Copyright © 2018 qpple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EatModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EatListCell : UITableViewCell

@property (strong, nonatomic) UILabel *Eat_Label;

@property (strong, nonatomic) UIImageView *EatImage;

@property (strong, nonatomic) EatModel *model;

@end

NS_ASSUME_NONNULL_END
