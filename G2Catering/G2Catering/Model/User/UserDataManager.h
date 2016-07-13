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
#import "UserModel.h"

#import "GoodsModel.h"
#import "ChangeGoodsNO.h"
#import "DeleteStoreGoods.h"

#import "GoodsType.h"
#import "GoodsCheck.h"
#import "ChanggeGoods.h"
@interface UserDataManager : DataManager

//LoginModel *model = [[LoginModel alloc]initWithLoginUsername:@"admin" loginPassword:@"admin1"];
//登录接口
+(void)logIn:(LoginModel *)model
     success:(success)success
    failure:(failure)failure;


//修改密码
+(void)modifyPassword:(UserModel *)usermodel
              success:(success)success
              failure:(failure)failure;

//获取会员列表
+(void)getVIPUserList:(UserModel *)usermodel
              success:(success)success
              failure:(failure)failure;


//添加会员
+(void)addVIPUser:(UserModel *)usermodel
          success:(success)success
          failure:(failure)failure;

//修改会员
+(void)modifyVIPUser:(UserModel *)usermodel
             success:(success)success
             failure:(failure)failure;


//删除会员
+(void)deleteVIPUser:(UserModel *)usermodel
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
