//
//  OrderDataManager.h
//  G2Catering
//
//  Created by wd on 16/7/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "DataManager.h"

@interface OrderDataManager : DataManager

//创建订单
+(void)createOrderByCartId:(NSString *)cartId
                   success:(success)success
                   failure:(failure)failure;

//获取订单列表
+(void)getOrderListByShopId:(NSString *)shopId
                     status:(NSString *)status
                    success:(success)success
                    failure:(failure)failure;


//获取订单详情
+(void)getOrderDetailByDefaultId:(NSString *)defaultId
                         success:(success)success
                         failure:(failure)failure;

//取消订单
+(void)cancelOrderByDefaultId:(NSString *)defaultId
                      success:(success)success
                      failure:(failure)failure;
@end
