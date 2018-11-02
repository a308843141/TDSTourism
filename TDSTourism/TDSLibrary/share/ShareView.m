//
//  ShareView.m
//  TDSTourism
//
//  Created by gongzhichao on 2018/11/1.
//  Copyright © 2018 qpple. All rights reserved.
//

#import "ShareView.h"

@implementation ShareView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.weChatImage.contentMode = UIViewContentModeScaleAspectFit;
    self.qqImage.contentMode = UIViewContentModeScaleAspectFit;
    self.qqSpace.contentMode = UIViewContentModeScaleAspectFit;
    self.weiChatImage.contentMode = UIViewContentModeScaleAspectFit;

}


- (IBAction)weChatClick:(id)sender {
    NSLog(@"111");
    self.hidden = YES;
}

- (IBAction)friedndClick:(id)sender {
    NSLog(@"222");
    self.hidden = YES;

}
- (IBAction)QQClick:(id)sender {
    NSLog(@"333");
    self.hidden = YES;

}
- (IBAction)QQSpaceClick:(id)sender {
    NSLog(@"444");
    self.hidden = YES;

}
- (IBAction)closeSshare:(id)sender {
    self.hidden = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
