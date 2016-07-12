//
//  ChanggeGoods.m
//  G2Catering
//
//  Created by lcc on 16/7/12.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "ChanggeGoods.h"

@implementation ChanggeGoods
- (instancetype)init{
    
    
    if ((self = [super init])!=nil) {
            //
    }
    return self;
}


-(instancetype)initWithGoodPrice:(NSString *)goodsPrice defaultId:(NSString *)defaultId
{
    if (self = [super init]) {
        _goodsPrice = goodsPrice;
        _defaultId = defaultId;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    
    
    return self;
}
@end
