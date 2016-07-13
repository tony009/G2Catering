//
//  ShopModel.h
//  G2Catering
//
//  Created by lcc on 16/7/11.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject

@property (nonatomic,copy) NSString *goodsId;  //商品ID

@property (nonatomic,copy) NSString *userId;   //用户ID


-(instancetype)initWithGoodId:(NSString *)goodsId userId:(NSString *)userId;

@end
