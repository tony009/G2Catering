//
//  ShoppingCartDataManager.h
//  G2Catering
//
//  Created by wd on 16/7/13.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "DataManager.h"

#import "GoodsModel.h"
#import "ChangeGoodsNO.h"
#import "DeleteStoreGoods.h"

#import "GoodsType.h"
#import "GoodsCheck.h"
#import "ChanggeGoods.h"
#import "GoodsModelCarGet.h"
@interface ShoppingCartDataManager : DataManager

//获取购物车列表
+(void)getShoppingCartByCustomerId:(NSString *)customerId
                           success:(success)success
                           failure:(failure)failure;


//添加商品到购物车
+(void)addGoodToStore:(GoodsModel *)goodsModel
              success:(success)success
              failure:(failure)failure;

//更改购物车商品数量
+(void)changgeGoods:(ChangeGoodsNO *)goodsModel
               success:(success)success
                failure:(failure)failure;

//删除购物车商品时调用
+(void)deleteGoodFromStore:(DeleteStoreGoods *)goodsModel
                   success:(success)success
                   failure:(failure)failure;

//购物车列表查询
+(void)getGoodFromStoreCar:(GoodsModelCarGet *)goodsModel
                   success:(success)success
                   failure:(failure)failure;
    // 请求购物车列表
+(void)postListWithForm:(NSString *)restPath
             parameters:(id)parameters
                keyPath:(NSString *)keyPath
                success:(success)success
                failure:(failure)failure;

@end
