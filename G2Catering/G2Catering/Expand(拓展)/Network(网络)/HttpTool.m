//
//  HttpTool.m
//  RuiMu
//
//  Created by wd on 16/4/25.
//  Copyright © 2016年 NDL. All rights reserved.
//


#import "HttpTool.h"
#import "AFNetworking.h"
#import "MJExtension.h"

#import "ShopCustomModel.h"
#import "ShopGoodsDetailModel.h"

@implementation HttpTool

static BOOL isExistenceNetwork = YES;


+(void)startNetworkMonitoring{
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        NSLog(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        
        switch (status) {
                
            case AFNetworkReachabilityStatusNotReachable:{
                
                NSLog(@"无网络");
                
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo: [UIApplication sharedApplication].keyWindow animated:YES];
                hud.removeFromSuperViewOnHide =YES;
                hud.mode = MBProgressHUDModeText;
                hud.labelText = @"当前网络不可用，请检查网络连接";  //提示的内容
                hud.minSize = CGSizeMake(132.f, 108.0f);
                [hud hide:YES afterDelay:3];
                
                break;
                
            }
                
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                
                NSLog(@"WiFi网络");
                isExistenceNetwork = YES;
                break;
                
            }
                
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                
                NSLog(@"无线网络");
                isExistenceNetwork = YES;
                break;
                
            }
                
            default:
                
                break;
                
        }
    }];
     
        
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
}

+(BOOL) isConnectionAvailable{
    
    
    if (!isExistenceNetwork) {
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo: [UIApplication sharedApplication].keyWindow animated:YES];
        hud.removeFromSuperViewOnHide =YES;
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"当前网络不可用，请检查网络连接";  //提示的内容
        hud.minSize = CGSizeMake(132.f, 108.0f);
        [hud hide:YES afterDelay:3];
        
    }
    
    return isExistenceNetwork;
    
}



+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(success)success
     failure:(failure)failure{
    
  
    //if ([HttpTool isConnectionAvailable]) {
        
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
//
//    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
//    
//    [sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    
    //parameters = @{@"1":@"XXXX",@"2":@"XXXX",@"3":@"XXXXX"};
    
    [sessionManager POST:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        success(responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        
        failure(error);
        
    }];
        
   // }
    
    
}

+(void)GET:(NSString *)URLString
parameters:(id)parameters
   success:(success)success
   failure:(failure)failure{
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    [sessionManager GET:URLString parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        success(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        failure(error);
    }];
}



+(void)getWithForm:(NSString *)restPath
        parameters:(id)parameters
        modelClass:(Class)modelClass
           keyPath:(NSString *)keyPath
           success:(success)success
           failure:(failure)failure{
    
    
    AFHTTPSessionManager *sessionManager = [ AFHTTPSessionManager manager];
    
    [sessionManager GET:restPath parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        
        
        if ([responseObject[@"status"] isEqualToString:@"OK"]) {
            
            id  result;
            id  tmp;
            
            if (keyPath && ![keyPath isEqualToString:@""]) {
                tmp = [responseObject valueForKeyPath:keyPath];
            }else{
                tmp = responseObject;
            }
            
            if (modelClass) {
                
                if ([tmp isKindOfClass:[NSArray class]]) {
                    
                    
                    result = [modelClass mj_objectArrayWithKeyValuesArray:tmp];
                    
                    
                    
                }else if([tmp isKindOfClass:[NSDictionary class]]){
                    
                    result = [modelClass mj_objectWithKeyValues:tmp];
                    
                    
                }else if([tmp isKindOfClass:[NSNull class]]){
                    
                    result = nil;
                    
                }
                else if([tmp isKindOfClass:[NSObject class]]){
                    
                    result = [modelClass mj_objectWithKeyValues:tmp];
                    
                    
                }
            }else{
                
                result = tmp;
            }
            
            
            success(result);
            
        }else{
            
            
            NSError *error = [NSError errorWithDomain:@"" code:1
                                             userInfo:responseObject];
            
            failure(error);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        failure(error);
    }];
    
}

+(void)postWithForm:(NSString *)restPath
         parameters:(id)parameters
         modelClass:(Class)modelClass
            keyPath:(NSString *)keyPath
            success:(success)success
            failure:(failure)failure{
    
    //if ([HttpTool isConnectionAvailable]) {
    
        //创建请求url
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    
    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    [sessionManager POST:restPath parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {

        if ([responseObject[@"status"] isEqualToString:@"OK"]) {
            
            id  result;
            id  tmp;
            
            if (keyPath && ![keyPath isEqualToString:@""]) {
                tmp = [responseObject valueForKeyPath:keyPath];
            }else{
                tmp = responseObject;
            }
            
            if (modelClass) {
                
                if ([tmp isKindOfClass:[NSArray class]]) {
                    
                    
                    result = [modelClass mj_objectArrayWithKeyValuesArray:tmp];
                    
                    
                    
                }else if([tmp isKindOfClass:[NSDictionary class]]){
                    
                    result = [modelClass mj_objectWithKeyValues:tmp];
                    
                    
                }else if([tmp isKindOfClass:[NSNull class]]){
                    
                    result = nil;
                    
                }
                else if([tmp isKindOfClass:[NSObject class]]){
                    
                    result = [modelClass mj_objectWithKeyValues:tmp];
                    
                    
                }
            }else{
                
                result = tmp;
            }
            
            
            success(result);
            
        }else{
            
            
            NSError *error = [NSError errorWithDomain:@"" code:1
                                             userInfo:responseObject];
            
            failure(error);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        failure(error);
    }];
    

    
}





@end
