
    //
//  GoodsType.m
//  G2Catering
//
//  Created by lcc on 16/7/12.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "GoodsType.h"

@implementation GoodsType
- (instancetype)init{
    
    
    if ((self = [super init])!=nil) {
            //
    }
    return self;
}


-(instancetype)initWithGoodContent:(NSString *)goodsContent
{
    if (self = [super init]) {
        _goodsContent = goodsContent;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    
    
    return self;
}
@end
