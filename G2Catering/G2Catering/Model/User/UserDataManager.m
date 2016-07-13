//
//  UserDataManager.m
//  iBeacon
//
//  Created by wd on 16/4/25.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "UserDataManager.h"
#import "CmEmployee.h"
#import "LoginSuccessModel.h"
#import "GoodsTypeSuccess.h"
#import "GoodsCheckSuccess.h"


@implementation UserDataManager

//登录
+(void)logIn:(LoginModel *)model
     success:(success)success
    failure:(failure)failure{
    
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/bm/users/appLogin"];
    
    [HttpTool postWithForm:url parameters:[model mj_keyValues] modelClass:[LoginSuccessModel class] keyPath:@"message" success:^(id response) {

        NSLog(@"__response_%@",response);
        success(response);
        
    } failure:^(NSError *error) {
        
        failure(error);
        
    }];

    
}

//获取会员列表
+(void)getVIPUserList:(UserModel *)usermodel
              success:(success)success
              failure:(failure)failure{
    
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/bm/users/getUserList"];
    
    
    [HttpTool postWithForm:url parameters:[usermodel mj_keyValues] modelClass:[UserModel class] keyPath:@"message" success:^(id response) {
        
        success(response);
        
    } failure:^(NSError *error) {
        
        failure(error);
        
    }];
    
    
}

+(void)addVIPUser:(UserModel *)usermodel
          success:(success)success
          failure:(failure)failure{
    
    
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/bm/users/addUser"];
    
    
    [HttpTool POST:url parameters:[usermodel mj_keyValues] success:^(id response) {
        
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

+(void)modifyVIPUser:(UserModel *)usermodel
             success:(success)success
             failure:(failure)failure{
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/bm/users/updateUser"];
    
    [HttpTool POST:url parameters:[usermodel mj_keyValues] success:^(id response) {
        
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

+(void)deleteVIPUser:(UserModel *)usermodel
             success:(success)success
             failure:(failure)failure{
    
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/bm/users/updateUser"];
    
    [HttpTool POST:url parameters:[usermodel mj_keyValues] success:^(id response) {
        
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


+(void)modifyPassword:(UserModel *)usermodel
              success:(success)success
              failure:(failure)failure{
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/bm/users/updateUser"];
    
    
    [HttpTool POST:url parameters:[usermodel mj_keyValues] success:^(id response) {
        
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
    
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"ibeacon-service-module/business/cw/imageUpload/postformdata"];
    
    [session POST:url parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSData *imageData = UIImageJPEGRepresentation(photo, 0.5);
        
        [formData appendPartWithFileData:imageData name:@"file" fileName:@"avatar.png" mimeType:@"image/jpg"];
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        

        NSString *picPath =  responseObject[@"message"];
        
        
        NSDictionary *dic = @{
                              @"defaultId":UserId,
                              @"jobPic":picPath
                              
                              };
        
        
        NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"ibeacon-service-module/business/cm/employee/editSelective"];
        
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


#pragma mark- 主数据管理模块
//商品分类查询
+(void)typeGoodsCheck:(GoodsType *)goodsModel success:(success)success failure:(failure)failure
{
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/dm/category/getList"];
    
    [HttpTool postWithForm:url parameters:[goodsModel mj_keyValues] modelClass:[GoodsTypeSuccess class] keyPath:@"message" success:^(id response) {
        
        success(response);
        
    } failure:^(NSError *error) {
        
        failure(error);
        
    }];

}

//查询商品
+(void)goodsCheck:(GoodsCheck *)goodsModel success:(success)success failure:(failure)failure
{
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/dm/goods/getList"];
    
    [HttpTool postWithForm:url parameters:[goodsModel mj_keyValues] modelClass:[GoodsCheckSuccess class] keyPath:@"message" success:^(id response) {
        
        success(response);
        
    } failure:^(NSError *error) {
        
        failure(error);
        
    }];
    
}

//修改商品
+(void)modifyGoods:(ChanggeGoods *)goodsModel success:(success)success failure:(failure)failure
{
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/dm/goods/editOne"];
    
    [HttpTool postWithForm:url parameters:[goodsModel mj_keyValues] modelClass:nil keyPath:@"message" success:^(id response) {
        
        success(response);
        
    } failure:^(NSError *error) {
        
        failure(error);
        
    }];
    
}

#pragma mark- 购物车
//添加商品到购物车
+(void)addGoodToStore:(GoodsModel *)goodsModel success:(success)success failure:(failure)failure
{
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/sm/shopping/cart/item/addProdutToCart"];
    
    [HttpTool postWithForm:url parameters:[goodsModel mj_keyValues] modelClass:nil keyPath:@"message" success:^(id response) {
        
        success(response);
        
    } failure:^(NSError *error) {
        
        failure(error);
        
    }];
    
   
}

//更改购物车商品数量
+(void)changgeGoods:(ChangeGoodsNO *)goodsModel success:(success)success failure:(failure)failure
{
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/sm/shopping/cart/item/updateCartInfo"];
    
    [HttpTool postWithForm:url parameters:[goodsModel mj_keyValues] modelClass:nil keyPath:@"message" success:^(id response) {
        
        success(response);
        
    } failure:^(NSError *error) {
        
        failure(error);
        
    }];
}

//删除购物车中商品
+(void)deleteGoodFromStore:(DeleteStoreGoods *)goodsModel success:(success)success failure:(failure)failure
{
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/sm/shopping/cart/item/deleteCartItem"];
    

    [HttpTool postWithForm:url parameters:[goodsModel mj_keyValues] modelClass:nil keyPath:@"message" success:^(id response) {

        success(response);
        
    } failure:^(NSError *error) {

        failure(error);
        
        
    }];
}

@end
