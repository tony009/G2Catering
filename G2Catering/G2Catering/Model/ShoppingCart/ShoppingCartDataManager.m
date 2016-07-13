//
//  ShoppingCartDataManager.m
//  G2Catering
//
//  Created by wd on 16/7/13.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "ShoppingCartDataManager.h"

@implementation ShoppingCartDataManager

#pragma mark- 购物车


+(void)getShoppingCartByCustomerId:(NSString *)customerId
                           success:(success)success
                           failure:(failure)failure{
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/sm/shopping/cart/item/addProdutToCart"];
    
    
}


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
