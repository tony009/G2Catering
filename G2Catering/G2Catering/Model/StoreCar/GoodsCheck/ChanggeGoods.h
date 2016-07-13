//
//  ChanggeGoods.h
//  G2Catering
//
//  Created by lcc on 16/7/12.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChanggeGoods : NSObject

@property (nonatomic,copy) NSString *defaultId;    //商品ID

@property (nonatomic,copy) NSString *goodsPrice;   //商品价格


-(instancetype)initWithGoodPrice:(NSString *)goodsPrice defaultId:(NSString *)defaultId;

@end
