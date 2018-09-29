//
//  LMHttpRequest.h
//  ShowYourself
//
//  Created by budgetoutsource on 2017/1/17.
//  Copyright © 2017年 LMTeam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResultModel.h"

typedef void (^HttpSuccessBlock1)(id jsonStr);
typedef void (^HttpSuccessBlock)(ResultModel * jsonModel);
typedef void (^HttpFailureBlock)(NSError * error);
typedef void (^HttpDownloadProgressBlock)(CGFloat progress);
typedef void (^HttpUploadProgressBlock)(CGFloat progress);


@interface LMHttpRequest : NSObject

/**
 *  get网络请求
 *
 *  @param path    url地址
 *  @param params  url参数  NSDictionary类型
 *  @param success 请求成功 返回NSDictionary或NSArray
 *  @param failure 请求失败 返回NSError
 */

+ (void)getWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure;

/**
 *  post网络请求
 *
 *  @param path    url地址
 *  @param params  url参数  NSDictionary类型
 *  @param success 请求成功 返回NSDictionary或NSArray
 *  @param failure 请求失败 返回NSError
 */

+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock)success
             failure:(HttpFailureBlock)failure;



+ (void)postWithPath1:(NSString *)path
               params:(NSDictionary *)params
              success:(HttpSuccessBlock1)success
              failure:(HttpFailureBlock)failure;
/**
 *  delete网络请求
 *
 *  @param path    url地址
 *  @param params  url参数  NSDictionary类型
 *  @param success 请求成功 返回NSDictionary或NSArray
 *  @param failure 请求失败 返回NSError
 */
+ (void)deleteWithPath:(NSString *)path
                params:(NSDictionary *)params
               success:(HttpSuccessBlock)success
               failure:(HttpFailureBlock)failure;


+ (void)patchWithPath:(NSString *)path
               params:(NSDictionary *)params
              success:(HttpSuccessBlock)success
              failure:(HttpFailureBlock)failure;



+ (void)putWithPath:(NSString *)path
             params:(NSDictionary *)params
            success:(HttpSuccessBlock)success
            failure:(HttpFailureBlock)failure;


/**
 *  下载文件
 *
 *  @param path     url路径
 *  @param success  下载成功
 *  @param failure  下载失败
 *  @param progress 下载进度
 */

+ (void)downloadWithPath:(NSString *)path
                 success:(HttpSuccessBlock)success
                 failure:(HttpFailureBlock)failure
                progress:(HttpDownloadProgressBlock)progress;

/**
 *  上传图片
 *
 *  @param path     url地址
 *  @param imageArr    UIImage对象数组
 *  @param imagekey    imagekey
 *  @param params  上传参数
 *  @param success  上传成功
 *  @param failure  上传失败
 *  @param progress 上传进度
 */


+ (void)uploadImageWithPath:(NSString *)path
                     params:(NSDictionary *)params
                    thumbName:(NSString *)imagekey
                   imageArr:(NSArray<UIImage *> *)imageArr
                    success:(HttpSuccessBlock)success
                    failure:(HttpFailureBlock)failure
                   progress:(HttpUploadProgressBlock)progress ;



//图片上传
+(void)upLoadImage:(UIImage *)img success:(void(^)(id))success
           failure:(void(^)())failure;


+ (NSURLRequest *)requestURLString:(NSString *)URLString
                        parameters:(id)parameters
                             error:(NSError *__autoreleasing *)error;

@end
