//
//  GoodsDataManager.m
//  G2Catering
//
//  Created by wd on 16/7/13.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "GoodsDataManager.h"
#import "GoodsTypeSuccess.h"
#import "GoodsCheckSuccess.h"

@implementation GoodsDataManager


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

@end
