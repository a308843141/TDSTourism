//
//  RecommendView.m
//  ocCrazy
//
//  Created by mac on 2017/11/6.
//  Copyright © 2017年 dukai. All rights reserved.
//

#import "RecommendView.h"
//#import "shareObject.h"
@implementation RecommendView{
    NSString *topStr;
    NSString *bottomStr;
    UIImageView *ImageView;
}

- (void)awakeFromNib{
    
    [super awakeFromNib];
    
    //    [CrazyAutoLayout frameOfSuperView:self];
    
    self.topView.layer.cornerRadius = HEIGHT(4);
    self.topView.layer.masksToBounds = YES;
    self.bottomView.layer.cornerRadius = HEIGHT(4);
    self.bottomView.layer.masksToBounds = YES;
    
    
//    self.bottomView.sd_layout.bottomSpaceToView(self,HEIGHT(7));
//    
//    self.bottomView.sd_layout.heightIs(HEIGHT(30));
//    
//    self.topView.sd_layout.bottomSpaceToView(self, HEIGHT(41));
//    
//    self.topView.sd_layout.heightIs(HEIGHT(88));
}

- (IBAction)handlerAction:(id)sender {
    self.hidden = YES;
}
- (IBAction)clickBtn:(UIButton *)sender {
    //    NSString *user_id = UID;
    //
    //    NSString *url ;
    //    if ([self.pageNum isEqualToString:@"1"]) {
    //        //推荐好友
    //        url = [NSString stringWithFormat:@"%@%@",[RequestUrl share].share_firend,user_id] ;
    //
    //        topStr = @"【善投慧推荐好友】";
    //        bottomStr = @"至善赢得客户，智慧创造财富。一起加入我们吧！";
    //
    //    }else if ([self.pageNum isEqualToString:@"2"]){
    //        //消息
    //        url = [NSString stringWithFormat:@"%@?id=%@&user_id=%@",[RequestUrl share].share_message,self.productId,UID?UID:@""] ;
    //
    //        if ([_hotOrStrock isEqualToString:@"1"]) {
    //            //推送消息
    //            topStr = @"【善投慧消息详情】";
    //            bottomStr = @"至善赢得客户，智慧创造财富。一起加入我们吧！";
    //        }else{
    //            //公告消息
    //            topStr = @"【善投慧公告消息】";
    //            bottomStr = @"即时信息，时刻掌握最新动态；";
    //        }
    //    }else if ([self.pageNum isEqualToString:@"3"]){
    //        //金币商品
    //        url = [NSString stringWithFormat:@"%@?id=%@",[RequestUrl share].share_gold,self.productId] ;
    //        topStr = [NSString stringWithFormat:@"【善投慧金币商城%@】",self.title];
    //        bottomStr = @"金币拼团，赢取超级大奖；";
    //    }else if ([self.pageNum isEqualToString:@"4"]){
    //        //银币商品
    //        url = [NSString stringWithFormat:@"%@?id=%@",[RequestUrl share].share_coin,self.productId] ;
    //        topStr = [NSString stringWithFormat:@"【善投慧银币拼团的%@】",self.title];
    //        bottomStr = @"银币兑换，享受优雅生活；";
    //    }else if ([self.pageNum isEqualToString:@"5"]){
    //        //产品详情
    //         url = [NSString stringWithFormat:@"%@?id=%@",[RequestUrl share].share_product,self.productId] ;
    //        topStr = [NSString stringWithFormat:@"【善投慧产品%@】",self.title];
    //
    //        bottomStr = @"随时查看最新基金产品，多种基金产品任君选择；";
    //    }else if ([self.pageNum isEqualToString:@"6"]){
    //        //视频
    //        url = [NSString stringWithFormat:@"%@?id=%@",[RequestUrl share].share_video,self.productId] ;
    //        topStr = [NSString stringWithFormat:@"【善投慧视频%@】",self.title];
    //
    //        bottomStr = @"学习海量金融知识，了解最新金融资讯。";
    //
    //    }else if ([self.pageNum isEqualToString:@"7"]){
    //        //营销短信
    //        url = [NSString stringWithFormat:@"%@?id=%@",[RequestUrl share].marketingSms,self.productId] ;
    //        topStr = @"【善投慧】";
    //        bottomStr = @"善投慧";
    //
    //    }else if ([self.pageNum isEqualToString:@"8"]){
    //        //募集详情
    //        url = [NSString stringWithFormat:@"%@?id=%@",[RequestUrl share].share_donation,self.productId] ;
    //        topStr = [NSString stringWithFormat:@"【善投慧%@产品的募集账号详情】",self.title];
    //        bottomStr = @"链接财富第一步；";
    //
    //    }else if ([self.pageNum isEqualToString:@"9"]){
    //        //理财师
    //        url = [NSString stringWithFormat:@"%@?id=%@",[RequestUrl share].sharemyPlanner,self.productId] ;
    //        topStr = [NSString stringWithFormat:@"【金牌理财师%@，为您的财富增值助力，保驾护航】",self.title];
    //        bottomStr = @"专业理财师，为您提供最佳的理财方案；";
    //
    //    }else if ([self.pageNum isEqualToString:@"10"]){
    //        //亮点
    //         url = [NSString stringWithFormat:@"%@?id=%@",[RequestUrl share].share_highlights,self.productId] ;
    //        topStr = [NSString stringWithFormat:@"【善投慧产品%@亮点】",self.title];
    //        bottomStr = @"基金产品丰富，涉及领域全面；";
    //
    //    }else if ([self.pageNum isEqualToString:@"11"]){
    //        //股权项目还是热点资讯
    //
    //        url = [NSString stringWithFormat:@"%@?id=%@",[RequestUrl share].share_hotnews,self.productId] ;
    //
    //        if ([_hotOrStrock isEqualToString:@"1"]) {
    //
    //            //股权项目
    //            topStr = [NSString stringWithFormat:@"【善投慧股权项目%@】",self.title];
    //
    //            bottomStr = @"快速了解最新股权项目，足不出户获取丰厚收益；";
    //
    //        }else if ([self.hotOrStrock isEqualToString:@"2"]){
    //            //热点资讯
    //            topStr = [NSString stringWithFormat:@"【善投慧热点资讯%@】",self.title];
    //
    //            bottomStr = @" 学习海量金融知识，了解最新金融资讯。";
    //
    //        }
    //
    //    }else if ([self.pageNum isEqualToString:@"12"]){
    //        //基本信息
    //        url = [NSString stringWithFormat:@"%@?id=%@",[RequestUrl share].share_basic,self.productId] ;
    //        topStr = [NSString stringWithFormat:@"【善投慧%@的产品基本信息】",self.title];
    //
    //        bottomStr = @"低成本，低收益；高风险，高回报；";
    //    }
    
    if (sender.tag == 10) {
        //微信好友
        NSLog(@"微信好友");
        
//        SendMessageToWXReq *req1 = [[SendMessageToWXReq alloc]init];
//
//        // 是否是文档
//        req1.bText =  NO;
//
//        //            WXSceneSession  = 0,        /**< 聊天界面    */
//        //    WXSceneTimeline = 1,        /**< 朋友圈      */
//        //    WXSceneFavorite = 2,
//
//
//        req1.scene = WXSceneSession;
//
//        NSLog(@"%@",self.imageName);
//        //创建分享内容对象
//        WXMediaMessage *urlMessage = [WXMediaMessage message];
//        urlMessage.title = self.title;//分享标题
//        urlMessage.description = self.introduce;//分享描述
//        [urlMessage setThumbImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageName]]]];//分享图片,使用SDK的setThumbImage方法可压缩图片大小
//
//
//        //创建多媒体对象
//        WXWebpageObject *webObj = [WXWebpageObject object];
//        webObj.webpageUrl = self.url;//分享链接
//
//        //完成发送对象实例
//        urlMessage.mediaObject = webObj;
//        req1.message = urlMessage;
//
//        //发送分享信息
//        [WXApi sendReq:req1];
        
        
        
        /*
         //创建发送对象实例
         SendMessageToWXReq *sendReq = [[SendMessageToWXReq alloc] init];
         sendReq.bText = NO;//不使用文本信息
         sendReq.scene = 0;//0 = 好友列表 1 = 朋友圈 2 = 收藏
         
         //创建分享内容对象
         WXMediaMessage *urlMessage = [WXMediaMessage message];
         urlMessage.title = topStr;//分享标题
         urlMessage.description = self.seletstr?self.seletstr:@"";//分享描述
         [urlMessage setThumbImage:[UIImage imageNamed:@"testImg"]];//分享图片,使用SDK的setThumbImage方法可压缩图片大小
         
         //创建多媒体对象
         WXWebpageObject *webObj = [WXWebpageObject object];
         //    webObj.webpageUrl = kLinkURL;//分享链接
         
         //完成发送对象实例
         urlMessage.mediaObject = webObj;
         sendReq.message = urlMessage;
         
         //发送分享信息
         [WXApi sendReq:sendReq];
         
         //        [shareObject showShareActionSheet:self activePlatforms:@"微信好友" urlStr:url page:self.seletstr?self.seletstr:@"" topTitle:topStr bottomTitle:bottomStr productId:self.productId?self.productId:@""];
         */
        
    }else if (sender.tag == 20){
        NSLog(@"微信朋友圈");
        //微信朋友圈
//        SendMessageToWXReq *req1 = [[SendMessageToWXReq alloc]init];
//
//        // 是否是文档
//        req1.bText =  NO;
//
//        //            WXSceneSession  = 0,        /**< 聊天界面    */
//        //    WXSceneTimeline = 1,        /**< 朋友圈      */
//        //    WXSceneFavorite = 2,
//
//
//        req1.scene = WXSceneTimeline;
//
//        NSLog(@"%@",self.imageName);
//        //创建分享内容对象
//        WXMediaMessage *urlMessage = [WXMediaMessage message];
//        urlMessage.title = self.title;//分享标题
//        urlMessage.description = self.introduce;//分享描述
//        [urlMessage setThumbImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imageName]]]];//分享图片,使用SDK的setThumbImage方法可压缩图片大小
//
//
//        //创建多媒体对象
//        WXWebpageObject *webObj = [WXWebpageObject object];
//        webObj.webpageUrl = self.url;//分享链接
//
//        //完成发送对象实例
//        urlMessage.mediaObject = webObj;
//        req1.message = urlMessage;
//
//        //发送分享信息
//        [WXApi sendReq:req1];
        
    }else if (sender.tag == 50){
        //取消
        self.hidden = YES;
    }
    
}



@end
