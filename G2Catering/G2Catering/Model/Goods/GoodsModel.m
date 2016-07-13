//
//  ShopModel.m
//  G2Catering
//
//  Created by lcc on 16/7/11.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "GoodsModel.h"

@implementation GoodsModel
- (instancetype)init{
    
    
    if ((self = [super init])!=nil) {
            //
    }
    return self;
}


-(instancetype)initWithGoodId:(NSString *)goodsId userId:(NSString *)userId
{
    if (self = [super init]) {
        _goodsId = goodsId;
        _userId = userId;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    
    
    return self;
}

@end
