//
//  LMHttpRequest.m
//  ShowYourself
//
//  Created by budgetoutsource on 2017/1/17.
//  Copyright © 2017年 LMTeam. All rights reserved.
//

#import "LMHttpRequest.h"

#import "AFNetworking.h"
#import "LoginViewController.h"
#import <UIKit/UIKit.h>

//#define Kboundary  @"----WebKitFormBoundary35cxmtFcIglrls"
#define Kboundary  @""
#define KNewLine [@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]

@interface AFHttpClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end

@implementation AFHttpClient



+ (instancetype)sharedClient {
    
    static AFHttpClient * client = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        
        client = [[AFHttpClient alloc] initWithBaseURL:[NSURL URLWithString:baseUrl] sessionConfiguration:configuration];
        //接收参数类型
        client.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"text/plain",@"image/gif", @"image/jpeg",@"image/png",@"image/jpg", @"application/octet-stream",@"text/html",@"multipart/form-data",  nil];
       
        
        //设置超时时间
        client.requestSerializer.timeoutInterval = 15;
        //安全策略
        client.securityPolicy = [AFSecurityPolicy defaultPolicy];
        
        //解决JSON乱码
        client.requestSerializer = [AFJSONRequestSerializer serializer];
    });
    
    return client;
}

@end

@interface LMHttpRequest()<NSURLSessionDataDelegate>
@property (nonatomic, strong) NSURLSession *session;

@end


@implementation LMHttpRequest

-(NSURLSession *)session
{
    if (_session == nil) {
        
        NSURLSessionConfiguration *conf =  [NSURLSessionConfiguration defaultSessionConfiguration];
        conf.timeoutIntervalForRequest = 10;
        //蜂窝网络有用
        conf.allowsCellularAccess = YES;
        
        _session= [NSURLSession sessionWithConfiguration:conf delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}



+ (void)postWithPath:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock)success
             failure:(HttpFailureBlock)failure {

      NSDictionary * param = [self addLoginInfoWithParam:params];
    
//    http://192.168.1.157/user/pwdLogin
    path = [path stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    [[AFHttpClient sharedClient] POST:path parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
//        MLog(@"==param=%@",responseObject);
//        ResultModel * result = [ResultModel yy_modelWithDictionary:responseObject];
//        if ([result.msg isEqualToString:@"Unauthenticated"]) {
//
//            [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"access_token"];
//            [[NSNotificationCenter defaultCenter]postNotificationName:@"loginOut" object:nil];
//            return ;
//        }
//
//           success(result);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"====%@",error);
       
        failure(error);
        
    }];
    
}

+ (void)postWithPath1:(NSString *)path
              params:(NSDictionary *)params
             success:(HttpSuccessBlock1)success
             failure:(HttpFailureBlock)failure {
    
    NSDictionary * param = [self addLoginInfoWithParam:params];
    
    path = [path stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    [[AFHttpClient sharedClient] POST:path parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {

        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        
    }];
    
}



+ (NSMutableDictionary *)addLoginInfoWithParam:(NSDictionary *)param {
    // 参数初始化
    NSMutableDictionary *dicParam;
    if (param) {
        dicParam = [NSMutableDictionary dictionaryWithDictionary:param];
    } else {
        dicParam = [NSMutableDictionary dictionary];
    }

//    NSString * token = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
//
//    if (token) {
//
//        NSString * tokenStr = [NSString stringWithFormat:@"%@ %@",@"Bearer",token];
//        [[AFHttpClient sharedClient].requestSerializer setValue:tokenStr  forHTTPHeaderField:@"Authorization"];
//      
//    }
//
//      [[AFHttpClient sharedClient].requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    
    return dicParam;
}

+ (NSURLRequest *)requestURLString:(NSString *)URLString
                        parameters:(id)parameters
                             error:(NSError *__autoreleasing *)error {
    
    AFHTTPRequestSerializer *serializer = [AFHttpClient sharedClient].requestSerializer;
    NSURLRequest *request = [serializer requestWithMethod:@"GET" URLString:URLString parameters:parameters error:error];
    return request;
}

+(void)upLoadImage:(UIImage *)img success:(void(^)(id))success
           failure:(void(^)())failure{

    NSURLSession *session = [NSURLSession sharedSession];
    
    //2.创建task
    //2.1 创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.1.157/user/updateUserPhoto"]]];
    //2.2 设置请求方法
    request.HTTPMethod = @"POST";
    
    //2.3.设置请求头
    NSString *header = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",Kboundary];
    [request setValue:header forHTTPHeaderField:@"Content-Type"];
    
    
    NSURLSessionUploadTask *task = [session uploadTaskWithRequest:request fromData:[self getBodyWithImage:img] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError * err;
        
      
        if (!data) return ;
        
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableContainers
                                                              error:&err];
       
        if ([dic[@"code"] intValue] == 200) {
            if ([dic[@"msg"] isEqualToString:@"Unauthenticated"]) {
                
                [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:@"access_token"];
                [[NSNotificationCenter defaultCenter]postNotificationName:@"loginOut" object:nil];
                return ;
            }

            success(dic);
        }else{
            failure();
        }
    }];
    
    //3.开启执行
    [task resume];
    
}

+(NSData *)getBodyWithImage:(UIImage *)img
{
    
    //5.设置请求体
    NSMutableData *fileData = [NSMutableData data];
    
    //5.1 文件参数
    /*
     --分隔符
     Content-Disposition: form-data; name="file"; filename="123.png"
     Content-Type: image/png
     空行
     文件数据
     */
    NSString *str = [NSString stringWithFormat:@"--%@",Kboundary];
    [fileData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    [fileData appendData:[@"Content-Disposition: form-data; name=\"upfile\"; filename=\"123.jpg\"" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    [fileData appendData:[@"Content-Type: image/jpeg" dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
//    [fileData appendData:KNewLine];
    [fileData appendData:KNewLine];
    
    NSData *imageData = UIImageJPEGRepresentation(img, 0.2);
    [fileData appendData:imageData];
    [fileData appendData:KNewLine];
    
    //5.2 非文件参数
    /*
     --分隔符
     Content-Disposition: form-data; name="username"
     空行
     yy
     */
    
//    [fileData appendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileData appendData:KNewLine];
//    [fileData appendData:[@"Content-Disposition: form-data; name=\"old_pics\"" dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileData appendData:KNewLine];
//    [fileData appendData:KNewLine];
//    [fileData appendData:KNewLine];
//    [fileData appendData:[@"3030" dataUsingEncoding:NSUTF8StringEncoding]];
//    [fileData appendData:KNewLine];
    
    //5.3 结尾标识
    /*
     --分隔符--
     */
    [fileData appendData:[[NSString stringWithFormat:@"--%@--",Kboundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [fileData appendData:KNewLine];
    
    return fileData;
    
}

-(void)dealloc{
    //注意:在不用的时候一定要调用该方法来释放,不然会出现内存泄露问题
    [self.session invalidateAndCancel];
    
}


@end
