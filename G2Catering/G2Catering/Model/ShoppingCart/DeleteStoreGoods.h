//
//  DeleteStoreGoods.h
//  G2Catering
//
//  Created by lcc on 16/7/11.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeleteStoreGoods : NSObject

@property (nonatomic,copy) NSString *defaultId;  //当前购物车中商品明细的id

@property (nonatomic,copy) NSString *status;     //当前状态6 为删除

-(instancetype)initWithGoodId:(NSString *)defaultId
                        state:(NSString *)state;

@end
