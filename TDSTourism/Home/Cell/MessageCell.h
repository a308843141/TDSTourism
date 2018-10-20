//
//  MessageCell.h
//  TDSTourism
//
//  Created by qpple on 2018/10/18.
//  Copyright © 2018 qpple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MessageCell : UITableViewCell

@property (strong, nonatomic) UILabel *Name_Label;

@property (strong, nonatomic) UILabel *One_Label;

@property (strong, nonatomic) UILabel *Two_Label;

@property (strong, nonatomic) UIImageView *OneImage;

@property (strong, nonatomic) UIView *ImageView;

@property(nonatomic,strong) MessageModel *model;

@end

NS_ASSUME_NONNULL_END
