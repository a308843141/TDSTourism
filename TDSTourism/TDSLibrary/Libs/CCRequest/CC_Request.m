//
//  CC_Request.m
//  HFShoping
//
//  Created by cfc on 2018/5/21.
//  Copyright © 2018年 HuiFeng. All rights reserved.
//

#import "CC_Request.h"

static CC_Request * request = nil;
@implementation CC_Request

+(CC_Request *)share{
    
    if (!request) {
        
        request = [[CC_Request alloc] init];
        
    }
    
    return request;
}
-(id)init{
    if ([super init]) {
        
        [self creatUrl];
        
    }
    
    return self;
}
-(NSString *)defaultURL:(NSString *)str{
//    http
//   NSString * urlString = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    

    return [NSString stringWithFormat:@"%@%@",self.defaultRequestURL,str];
    
}

-(NSString *)defaultURLL:(NSString *)str{
//    https
//     NSString * urlString = [str stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    return [NSString stringWithFormat:@"%@%@",self.defaultRequestURLL,str];
    
}
-(void)creatUrl{
    
//    域名
//    NSString * urlString = [@"http://140.143.167.192/index.php/" stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
    
//    self.defaultRequestURL = @"http://140.143.167.192/index.php/";
    
//    正式域名
     self.defaultRequestURL = @"https://www.xfxhfgs.cn/index.php/";
//    测试域名
//    self.defaultRequestURL = @"http://dev.xfxhfgs.cn/index.php/";
    
    
//    NSString * urlStringg = [@"https://www.xfxhfgs.cn/index.php/" stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
//    self.defaultRequestURLL= @"https://www.xfxhfgs.cn/index.php/";
    
//    self.checklogin =[self defaultURL:@"use"];
    
//    注册登录
    self.sendCodet = [self defaultURL:@"user/user/sendCode/2"];
    self.sendCodeo =[self defaultURL:@"user/user/sendCode/1"];
    self.checklogin =[self defaultURL:@"user/user/checklogin"];
    self.accountlogin =[self defaultURL:@"user/user/accountlogin"];
    self.forgetpwd =[self defaultURL:@"user/user/forgetpwd"];
    self.registeruser =[self defaultURL:@"user/user/registeruser"];
    self.sendCodeth =[self defaultURL:@"user/user/sendCode/3"];
    self.get_wx_login =[self defaultURL:@"user/user/get_wx_login"];
    
    
    
//    我的
    self.getinformation =[self defaultURL:@"user/user/getinformation"];
    self.updatePwd =[self defaultURL:@"user/user/updatePwd"];
    self.checkSms =[self defaultURL:@"user/user/checkSms"];
    self.setPayPwd =[self defaultURL:@"user/user/setPayPwd"];
    self.setNickName =[self defaultURL:@"user/user/setNickName"];
    self.setTrueName =[self defaultURL:@"user/user/setTrueName"];
    self.setSexData =[self defaultURL:@"user/user/setSexData"];
    self.setIDCard =[self defaultURL:@"user/user/setIDCard"];
    self.setEmail =[self defaultURL:@"user/user/setEmail"];
    self.updateTel =[self defaultURL:@"user/user/updateTel"];
    self.setHeadPic =[self defaultURL:@"user/user/setHeadPic"];
    self.setBrithDay =[self defaultURL:@"user/user/setBrithDay"];
    
    self.loadingFeedSort =[self defaultURL:@"user/user/loadingFeedSort"];
    self.uploadFeedBack =[self defaultURL:@"user/user/uploadFeedBack"];
    self.listActive =[self defaultURL:@"user/user/listActive"];
    self.get_user_coupon =[self defaultURL:@"user/user/get_user_coupon"];
    self.get_user_message =[self defaultURL:@"user/user/get_user_message"];
    self.delete_user_message =[self defaultURL:@"user/user/delete_user_message"];
    
    
#pragma mark  收货地址
    self.setReceiverAddress =[self defaultURL:@"user/user/setReceiverAddress"];
    self.updateReceiverAddress =[self defaultURL:@"user/user/updateReceiverAddress"];
    self.detailReceiverAddress =[self defaultURL:@"user/user/detailReceiverAddress"];
    self.deleteReceiverAddress =[self defaultURL:@"user/user/deleteReceiverAddress"];
    self.listReceiverAddress =[self defaultURL:@"user/user/listReceiverAddress"];
    self.setDefaultAddress =[self defaultURL:@"user/user/setDefaultAddress"];
    
#pragma mark  收藏
    self.list_product_favorite =[self defaultURL:@"user/user/list_product_favorite"];
    self.add_product_favorite =[self defaultURL:@"user/user/add_product_favorite"];
    self.delete_product_favorite =[self defaultURL:@"user/user/delete_product_favorite"];
   
    
#pragma mark   我的订单
    
    self.get_user_order =[self defaultURL:@"user/order/get_user_order"];
    self.delete_user_order =[self defaultURL:@"user/order/delete_user_order"];
    self.cancel_user_order =[self defaultURL:@"user/order/cancel_user_order"];
    self.confirm_user_order =[self defaultURL:@"user/order/confirm_user_order"];
    self.order_detail =[self defaultURL:@"user/order/order_detail"];
    self.pay_order =[self defaultURL:@"user/order/pay_order"];
    //付款
    //订单详情
    
#pragma mark  分类
    
    self.get_product_category =[self defaultURL:@"user/order/get_product_category"];
    self.get_product_list =[self defaultURL:@"user/order/get_product_list"];
    self.delete_search_history =[self defaultURL:@"user/order/delete_search_history"];
    
    self.cart_plus_nums =[self defaultURL:@"user/order/cart_plus_nums"];
    self.user_total_cart =[self defaultURL:@"user/order/user_total_cart"];
    self.get_hot_keywords =[self defaultURL:@"user/order/get_hot_keywords"];
    self.get_search_history =[self defaultURL:@"user/order/get_search_history"];
    self.get_search_product_list =[self defaultURL:@"user/order/get_search_product_list"];
    self.drop_down_brand =[self defaultURL:@"user/order/drop_down_brand"];
    
    
#pragma mark   购物车
    
    self.get_user_shoppingcart =[self defaultURL:@"user/order/get_user_shoppingcart"];
    self.cart_subduction_nums =[self defaultURL:@"user/order/cart_subduction_nums"];
    self.get_product_detail =[self defaultURL:@"user/order/get_product_detail"];
    self.delete_cart_product =[self defaultURL:@"user/order/delete_cart_product"];
    self.get_freights =[self defaultURL:@"user/order/get_freights"];
    
#pragma mark   订单确认
    
    self.order_confrim =[self defaultURL:@"user/order/order_confrim"];
    self.available_coupons =[self defaultURL:@"user/order/available_coupons"];
    self.calculation_order =[self defaultURL:@"user/order/calculation_order"];
    self.confirm_order =[self defaultURL:@"user/order/confirm_order"];

    //加载订单数据（购物车结算按钮）
    //加载可用优惠券（列表）
    //计算订单明细
    //确认下单
    self.confirm_balance_pay =[self defaultURL:@"user/Pay/confirm_balance_pay"];
    self.pwd_balance_pay =[self defaultURL:@"user/Pay/pwd_balance_pay"];
    //确认支付
    //支付密码验证后扣款

    self.request_alipay =[self defaultURL:@"user/Pay/request_alipay"];
    self.request_wxpay =[self defaultURL:@"user/Pay/request_wxpay"];
    //支付宝支付
    //微信支付

    #pragma mark   充值
    self.recharge_order_confrim =[self defaultURL:@"user/order/recharge_order_confrim"];
    self.get_balance_history =[self defaultURL:@"user/pay/get_balance_history"];

    self.get_lottery_draw_product =[self defaultURL:@"user/Lottery_draw/get_lottery_draw_product"];
    self.lottery_draw_doing =[self defaultURL:@"user/Lottery_draw/lottery_draw_doing"];
    self.get_lottery_draw_history =[self defaultURL:@"user/Lottery_draw/get_lottery_draw_history"];
//    充值订单确认
//    余额历史记录
//    抽奖初始化
//    点击抽奖
//    获取用户抽奖记录
    
#pragma mark   个人收益金
    
    self.get_basic_param_commission =[self defaultURL:@"user/Commission/get_basic_param_commission"];
    self.get_commission_list =[self defaultURL:@"user/Commission/get_commission_list"];
    
    //个人收益金概况
    //个人收益金明细
    
#pragma mark   首页
    self.get_nine_product =[self defaultURL:@"user/Product/get_nine_product"];
    //9.9元专区
    self.get_flash_sale_product =[self defaultURL:@"user/Product/get_flash_sale_product"];
    //限时抢购详情
    self.get_banner =[self defaultURL:@"user/Default_page/get_banner/4"];
    self.get_product_recommend =[self defaultURL:@"user/Default_page/get_product_recommend/2"];
    //banner图
    //爆款推介
    self.get_index_product =[self defaultURL:@"user/Default_page/get_index_product"];
    //惠丰超市商品
   
}

@end
