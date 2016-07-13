//
//  DeleteStoreGoods.m
//  G2Catering
//
//  Created by lcc on 16/7/11.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "DeleteStoreGoods.h"

@implementation DeleteStoreGoods
- (instancetype)init{
    
    
    if ((self = [super init])!=nil) {
            //
    }
    return self;
}


-(instancetype)initWithGoodId:(NSString *)goodsId
                        state:(NSString *)state
{
    if (self = [super init]) {
        _defaultId = goodsId;
        _status = state;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    
    
    return self;
}
@end
