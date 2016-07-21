//
//  OrderDataManager.m
//  G2Catering
//
//  Created by wd on 16/7/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "OrderDataManager.h"
#import "OrderModel.h"
@implementation OrderDataManager


+(void)createOrderByCartId:(NSString *)cartId
                   success:(success)success
                   failure:(failure)failure{
    
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/om/order/createOrder"];
    
    
    NSDictionary *dic = @{
                          @"cartId":cartId
                          };
    
    
    [HttpTool postWithForm:url parameters:dic modelClass:nil keyPath:@"message" success:^(id response) {
        
        success(response);
        
    } failure:^(NSError *error) {
        
        failure(error);
        
    }];
    
}


+(void)getOrderListByShopId:(NSString *)shopId
                     status:(NSString *)status
                    success:(success)success
                    failure:(failure)failure{
    
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/om/order/getOrderList"];
    
    NSDictionary *dic = @{
                          @"orgId":shopId,
                          @"status":status
                          
                          };
    
    [HttpTool postWithForm:url parameters:dic modelClass:[OrderModel class] keyPath:@"message" success:^(id response) {
        
        success(response);
        
    } failure:^(NSError *error) {
        
        failure(error);
        
    }];

    
}



+(void)getOrderDetailByDefaultId:(NSString *)defaultId
                         success:(success)success
                         failure:(failure)failure{
    
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/om/order/getOrder"];
    
    NSDictionary *dic = @{
                          @"defaultId":defaultId
                          
                          };
    
    [HttpTool postWithForm:url parameters:dic modelClass:nil keyPath:@"message" success:^(id response) {
        
        success(response);
        
    } failure:^(NSError *error) {
        
        failure(error);
        
    }];
    
}



+(void)cancelOrderByDefaultId:(NSString *)defaultId
                      success:(success)success
                      failure:(failure)failure{
    
    
    NSString *url = [NSString stringWithFormat:@"%@/%@",BaseUrl,@"g2-service-module/business/om/order/cancelOrder"];
    
    NSDictionary *dic = @{
                          @"defaultId":defaultId
                          
                          };
    
    [HttpTool postWithForm:url parameters:dic modelClass:nil keyPath:@"message" success:^(id response) {
        
        success(response);
        
    } failure:^(NSError *error) {
        
        failure(error);
        
    }];
    
    
    
}
@end
