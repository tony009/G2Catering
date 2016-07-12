//
//  UserDataManager.h
//  iBeacon
//
//  Created by wd on 16/4/25.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"
#import "CmEmployee.h"
#import "LoginModel.h"
#import "RegisterModel.h"

#import "GoodsModel.h"
#import "ChangeGoodsNO.h"
#import "DeleteStoreGoods.h"

#import "GoodsType.h"
#import "GoodsCheck.h"
#import "ChanggeGoods.h"
@interface UserDataManager : DataManager


//登录接口
+(void)logIn:(LoginModel *)model
     success:(success)success
    failure:(failure)failure;


//注册
+(void)registerInfo:(RegisterModel *)model
            success:(success)success
           failure:(failure)failure;

//    CmEmployee *e = [[CmEmployee alloc]initWithDefaultId:@"40288102522e592801522ec5d15d0002" oldPassword:@"123" newPassword:@"123456"];
//修改密码
+(void)modifyPassword:(CmEmployee *)employee
              success:(success)success
              failure:(failure)failure;


//忘记密码
+(void)forgetPasswrod:(CmEmployee *)employee
              success:(success)success
              failure:(failure)failure;


//修改用户信息
+(void)modifyUserInfo:(CmEmployee *)employee
              success:(success)success
              failure:(failure)failure;

//上传用户图片
+(void)uploadUser:(NSString *)UserId
            photo:(UIImage *)photo
          success:(success)success
          failure:(failure)failure;

//商品分类查询
+(void)typeGoodsCheck:(GoodsType *)goodsModel
              success:(success)success
              failure:(failure)failure;

//商品查询
+(void)goodsCheck:(GoodsCheck *)goodsModel
              success:(success)success
              failure:(failure)failure;

//修改商品
+(void)changgeGoods:(ChangeGoodsNO *)goodsModel
          success:(success)success
          failure:(failure)failure;

//添加商品到购物车
+(void)addGoodToStore:(GoodsModel *)goodsModel
              success:(success)success
              failure:(failure)failure;

//更改购物车商品数量
+(void)modifyGoods:(ChanggeGoods *)goodsModel
              success:(success)success
              failure:(failure)failure;

    //更改购物车商品数量
+(void)deleteGoodFromStore:(DeleteStoreGoods *)goodsModel
              success:(success)success
              failure:(failure)failure;

//+(void)checkTypeGoods:()
@end
