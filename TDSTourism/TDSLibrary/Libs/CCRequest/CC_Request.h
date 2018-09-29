//
//  CC_Request.h
//  HFShoping
//
//  Created by cfc on 2018/5/21.
//  Copyright © 2018年 HuiFeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CC_Request : NSObject

+(CC_Request *)share;

#pragma mark 默认请求
@property (nonatomic,strong) NSString * defaultRequestURL;

@property (nonatomic,strong) NSString * defaultRequestURLL;

#pragma mark 注册 登录
 @property (strong, nonatomic) NSString *sendCodet;//1发送验证码（注册）
 @property (strong, nonatomic) NSString *sendCodeo;//1发送验证码（登录|忘记密码）
 @property (strong, nonatomic) NSString *checklogin;//1手机快捷登录
 @property (strong, nonatomic) NSString *accountlogin;//1账户密码登录
 @property (strong, nonatomic) NSString *forgetpwd;//1忘记密码
 @property (strong, nonatomic) NSString *registeruser;//1注册
 @property (strong, nonatomic) NSString *sendCodeth;//1发送验证码(快捷登录)
 @property (strong, nonatomic) NSString *get_wx_login;//微信登陆


#pragma mark 我的
@property (strong, nonatomic) NSString *getinformation;//基本信息
@property (strong, nonatomic) NSString *updatePwd;// 修改密码
@property (strong, nonatomic) NSString *checkSms;// 支付密码短信验证
@property (strong, nonatomic) NSString *setPayPwd;// 设置/重置支付密码
@property (strong, nonatomic) NSString *setNickName;// 设置昵称
@property (strong, nonatomic) NSString *setTrueName;//真实姓名
@property (strong, nonatomic) NSString *setSexData;//真实性别
@property (strong, nonatomic) NSString *setIDCard;//真实身份证
@property (strong, nonatomic) NSString *setEmail;//邮箱
@property (strong, nonatomic) NSString *updateTel;//认证手机修改
@property (strong, nonatomic) NSString *setHeadPic;//真实头像
@property (strong, nonatomic) NSString *setBrithDay;//真实生日

@property (strong, nonatomic) NSString *loadingFeedSort;//意见反馈-下载问题分类
@property (strong, nonatomic) NSString *uploadFeedBack;//意见反馈-上传问题
@property (strong, nonatomic) NSString *listActive;//活动
@property (strong, nonatomic) NSString *get_user_coupon;//优惠券
@property (strong, nonatomic) NSString *get_user_message;
@property (strong, nonatomic) NSString *delete_user_message;

#pragma mark  收货地址
@property (strong, nonatomic) NSString *setReceiverAddress;//新增收货地址
@property (strong, nonatomic) NSString *updateReceiverAddress;//修改收货地址
@property (strong, nonatomic) NSString *detailReceiverAddress;//单一收货地址
@property (strong, nonatomic) NSString *deleteReceiverAddress;//删除收货地址
@property (strong, nonatomic) NSString *listReceiverAddress;//请求收货地址列表
@property (strong, nonatomic) NSString *setDefaultAddress;//默认收货地址列表

#pragma mark   我的收藏
@property (strong, nonatomic) NSString *list_product_favorite;//收藏列表
@property (strong, nonatomic) NSString *delete_product_favorite;//删除收藏
@property (strong, nonatomic) NSString *add_product_favorite;//添加收藏

#pragma mark   我的订单
@property (strong, nonatomic) NSString *get_user_order;//订单列表
@property (strong, nonatomic) NSString *delete_user_order;//删除订单
@property (strong, nonatomic) NSString *cancel_user_order;//取消订单
@property (strong, nonatomic) NSString *confirm_user_order;//确认收货
@property (strong, nonatomic) NSString *order_detail;//订单详情
@property (strong, nonatomic) NSString *pay_order;//付款

#pragma mark   分类
@property (strong, nonatomic) NSString *get_product_category;//分类展示
@property (strong, nonatomic) NSString *get_product_list;//产品列表
@property (strong, nonatomic) NSString *delete_search_history;//删除历史搜索

@property (strong, nonatomic) NSString *get_hot_keywords;//热搜关键词
@property (strong, nonatomic) NSString *get_search_history;//历史搜索
@property (strong, nonatomic) NSString *get_search_product_list;//搜索列表页
@property (strong, nonatomic) NSString *drop_down_brand;//列表页品牌下拉
@property (strong, nonatomic) NSString *get_product_detail;//产品详情


#pragma mark   购物车
@property (strong, nonatomic) NSString *get_user_shoppingcart;//购物车列表
@property (strong, nonatomic) NSString *user_total_cart;//商品数量
@property (strong, nonatomic) NSString *cart_plus_nums;//加商品
@property (strong, nonatomic) NSString *cart_subduction_nums;//减商品
@property (strong, nonatomic) NSString *delete_cart_product;//删除购物车商品

@property (strong, nonatomic) NSString *get_similar_keywords;//相关关键词下拉  第一版本不写
@property (strong, nonatomic) NSString *get_freights;//获取邮费

#pragma mark   订单确认
@property (strong, nonatomic) NSString *order_confrim;//加载订单数据（购物车结算按钮）
@property (strong, nonatomic) NSString *available_coupons;//加载可用优惠券（列表）
@property (strong, nonatomic) NSString *calculation_order;//计算订单明细
@property (strong, nonatomic) NSString *confirm_order;//确认下单

@property (strong, nonatomic) NSString *confirm_balance_pay;//确认支付
@property (strong, nonatomic) NSString *pwd_balance_pay;//支付密码验证后扣款

@property (strong, nonatomic) NSString *request_alipay;//支付宝支付
@property (strong, nonatomic) NSString *request_wxpay;//微信支付

#pragma mark   充值
@property (strong, nonatomic) NSString *recharge_order_confrim;//充值订单确认
@property (strong, nonatomic) NSString *get_balance_history;//余额历史记录
@property (strong, nonatomic) NSString *get_lottery_draw_product;//抽奖初始化
@property (strong, nonatomic) NSString *lottery_draw_doing;//点击抽奖
@property (strong, nonatomic) NSString *get_lottery_draw_history;//获取用户抽奖记录

#pragma mark   个人收益金
@property (strong, nonatomic) NSString *get_basic_param_commission;//个人收益金概况
@property (strong, nonatomic) NSString *get_commission_list;//个人收益金明细
//@property (strong, nonatomic) NSString *get_commission_list;//7日待收明细

#pragma mark   首页

@property (strong, nonatomic) NSString *get_nine_product;//9.9元专区
@property (strong, nonatomic) NSString *get_flash_sale_product;//限时抢购详情
@property (strong, nonatomic) NSString *get_banner;//banner图
@property (strong, nonatomic) NSString *get_product_recommend;//爆款推介
@property (strong, nonatomic) NSString *get_index_product;//惠丰超市商品

@end
