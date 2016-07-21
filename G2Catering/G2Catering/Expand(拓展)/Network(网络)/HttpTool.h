//
//  HttpTool.h
//  RuiMu
//
//  Created by wd on 16/4/25.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface HttpTool : NSObject

typedef void (^success)(id response);
typedef void (^failure)(NSError *error);


+(void)startNetworkMonitoring;

+(BOOL)isConnectionAvailable;

+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(success)success
     failure:(failure)failure;

+(void)GET:(NSString *)URLString
parameters:(id)parameters
   success:(success)success
   failure:(failure)failure;


+(void)getWithForm:(NSString *)restPath
       parameters:(id)parameters
        modelClass:(Class)modelClass
           keyPath:(NSString *)keyPath
           success:(success)success
           failure:(failure)failure;


+(void)postWithForm:(NSString *)restPath
         parameters:(id)parameters
         modelClass:(Class)modelClass
            keyPath:(NSString *)keyPath
            success:(success)success
            failure:(failure)failure;

// 请求购物车列表
+(void)postListWithForm:(NSString *)restPath
             parameters:(id)parameters
                keyPath:(NSString *)keyPath
                success:(success)success
                failure:(failure)failure;

@end
