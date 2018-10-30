//
//  RecommendView.h
//  ocCrazy
//
//  Created by mac on 2017/11/6.
//  Copyright © 2017年 dukai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommendView : UIView
@property (strong, nonatomic) IBOutlet UIView *topView;
@property (strong, nonatomic) IBOutlet UIView *bottomView;

@property (strong, nonatomic) IBOutlet UIView *backgroundView;
@property (strong, nonatomic) NSString *seletstr;
@property (strong, nonatomic) NSString *videoStr;

@property (strong, nonatomic) NSString *pageNum;
@property (strong, nonatomic) NSString *productId;
@property (strong, nonatomic) IBOutlet UIView *blackView;

@property (strong, nonatomic) NSString *title;//分享的标题

@property (strong, nonatomic) NSString *hotOrStrock;

@property (strong, nonatomic) NSString *imageName;


@end
