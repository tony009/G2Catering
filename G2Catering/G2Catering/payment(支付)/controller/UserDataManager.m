//
//  UserDataManager.m
//  iBeacon
//
//  Created by wd on 16/4/25.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "UserDataManager.h"
#import "CmEmployee.h"

@implementation UserDataManager

//登录
+(void)logIn:(LoginModel *)model
     success:(success)success
    failure:(failure)failure{
    
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",iBeaconBaseUrl,@"ibeacon-service-module/business/cm/employee/selectOne"];
    
    [HttpTool postWithForm:url parameters:[model mj_keyValues] modelClass:[CmEmployee class] keyPath:@"message" success:^(id response) {
       
        
        
        
        success(response);
        
    } failure:^(NSError *error) {
        
        failure(error);
        
    }];

    
    
}

//注册
+(void)registerInfo:(RegisterModel *)model
            success:(success)success
           failure:(failure)failure{
    
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",iBeaconBaseUrl,@"ibeacon-service-module/business/cm/employee/addOne"];
    NSLog(@"%@",[model mj_keyValues]);
    [HttpTool postWithForm:url parameters:[model mj_keyValues] modelClass:nil keyPath:nil success:^(id response) {
        
        if ([response[@"status"] isEqualToString:@"OK"]) {
            
            success(response);
            
        }else{
            
            
            NSError *error = [NSError errorWithDomain:errorDomain code:HttpErrorCode_WrongReult
                               userInfo:response];
            
            failure(error);
            
        }
    
        
    } failure:^(NSError *error) {
        
        failure(error);
        
    }];
    
}


+(void)modifyPassword:(CmEmployee *)employee
              success:(success)success
              failure:(failure)failure{
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",iBeaconBaseUrl,@"ibeacon-service-module/business/cm/employee/editSelective"];
    
    
    [HttpTool POST:url parameters:[employee mj_keyValues] success:^(id response) {
        
        if ([response[@"status"] isEqualToString:@"OK"]) {
            
            success(response);
            
        }else{
            
            
            NSError *error = [NSError errorWithDomain:errorDomain code:HttpErrorCode_WrongReult
                                             userInfo:response];
            
            failure(error);
            
        }
        
    } failure:^(NSError *error) {
        
        
        failure(error);
        
    }];
    
    
}

+(void)forgetPasswrod:(CmEmployee *)employee
              success:(success)success
              failure:(failure)failure{
    
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",iBeaconBaseUrl,@"ibeacon-service-module/business/cm/employee/editSelective"];
    
    
    [HttpTool POST:url parameters:[employee mj_keyValues] success:^(id response) {
        
        if ([response[@"status"] isEqualToString:@"OK"]) {
            
            success(response);
            
        }else{
            
            
            NSError *error = [NSError errorWithDomain:errorDomain code:HttpErrorCode_WrongReult
                                             userInfo:response];
            
            failure(error);
            
        }
        
    } failure:^(NSError *error) {
        
        
        failure(error);
        
    }];
    
    
    
}

+(void)modifyUserInfo:(CmEmployee *)employee
              success:(success)success
             failure:(failure)failure{
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",iBeaconBaseUrl,@"ibeacon-service-module/business/cm/employee/editSelective"];
    
//    NSDictionary *dic = @{@"defaultId":@"40288102522e592801522ec5d15d0002",@"mobile":@"18410109053"};
    
    
    [HttpTool POST:url parameters:[employee mj_keyValues] success:^(id response) {
       
        success(response);
        
    } failure:^(NSError *error) {
        
        
        failure(error);
        
    }];
    
    
}

+(void)uploadPhoto:(UIImage *)photo
           success:(success)success
           failure:(failure)failure{
    
    
    
    
}


//
+(void)uploadUser:(NSString *)UserId
            photo:(UIImage *)photo
          success:(success)success
          failure:(failure)failure{
    
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",iBeaconBaseUrl,@"ibeacon-service-module/business/cw/imageUpload/postformdata"];
    
    [session POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSData *imageData = UIImageJPEGRepresentation(photo, 0.5);
        
        [formData appendPartWithFileData:imageData name:@"file" fileName:@"avatar.png" mimeType:@"image/jpg"];
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        

        NSString *picPath =  responseObject[@"message"];
        
        
        NSDictionary *dic = @{
                              @"defaultId":UserId,
                              @"jobPic":picPath
                              
                              };
        
        
        NSString *url = [NSString stringWithFormat:@"%@/%@",iBeaconBaseUrl,@"ibeacon-service-module/business/cm/employee/editSelective"];
        
        [HttpTool POST:url parameters:dic success:^(id response) {
            
            if ([response[@"status"] isEqualToString:@"OK"]) {
                
                NSMutableDictionary *re = [NSMutableDictionary dictionaryWithDictionary:response];
                [re setObject:picPath forKey:@"picPath"];
                success(re);
                
            }else{
                
                
                NSError *error = [NSError errorWithDomain:errorDomain code:HttpErrorCode_WrongReult
                                                 userInfo:response];
                
                failure(error);
                
            }
            
        } failure:^(NSError *error) {
            
            
            failure(error);
            
        }];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"error reason :%@",error.localizedDescription);
        
        failure(error);
    }];
    
    
    
    
}


@end
