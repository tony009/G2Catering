//
//  ChangeGoodsNO.h
//  G2Catering
//
//  Created by lcc on 16/7/11.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChangeGoodsNO : NSObject

@property (nonatomic,copy) NSString *defaultId;  //当前购物车中商品明细的id

@property (nonatomic,copy) NSString *quantity;   //数量

@property (nonatomic,copy) NSString *state;      //未付款状态为0

-(instancetype)initWithGoodId:(NSString *)goodsId quantity:(NSString *)quantity
                  state:(NSString *)state;

@end
