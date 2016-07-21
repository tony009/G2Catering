//
//  ShoppingCartDataManager.m
//  G2Catering
//
//  Created by wd on 16/7/13.
//  Copyright © 2016年 NDL. All rights reserved.
//
#import "ShopGoodsDetailModel.h"
#import "ShopCustomModel.h"
#import "ShoppingCartDataManager.h"
#import "GoodsModelCarGetSuccess.h"

@implementation ShoppingCartDataManager

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
//    NSLog(@"%@");
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

//获得购物车列表中商品
+(void)getGoodFromStoreCar:(GoodsModelCarGet *)goodsModel success:(success)success failure:(failure)failure
{
//    HttpTool postWithForm:url parameters:[goodsModel mj_keyValues] modelClass:nil keyPath:@"message" success:^(id response) {
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/sm/shopping/cart/getShoppingCart"];
    
    [HttpTool postWithForm:url parameters:[goodsModel mj_keyValues] modelClass:nil keyPath:nil success:^(id response) {
        NSDictionary *responseObject = response;
        if ([responseObject[@"status"] isEqualToString:@"OK"]) {
            ShopGoodsDetailModel *shopd = (ShopGoodsDetailModel*)[ShopCustomModel mj_objectWithKeyValues:responseObject[@"message"]];
            NSArray *arr = responseObject[@"message"][@"smShoppingCartPkgBean"][0][@"smShoppingCartItemBean"];
            NSArray *arr2 =  [ShopGoodsDetailModel mj_objectArrayWithKeyValuesArray:arr];
            NSArray *resultArray = @[shopd,arr2];

            success(resultArray);
        }
    } failure:^(NSError *error) {
        
    }];

}
@end
