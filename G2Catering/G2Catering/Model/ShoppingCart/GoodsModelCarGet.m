//
//  GoodsModelCarGet.m
//  G2Catering
//
//  Created by lcc on 16/7/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "GoodsModelCarGet.h"

@implementation GoodsModelCarGet
- (instancetype)init{

    if ((self = [super init])!=nil) {
        
    }
    return self;
}



-(instancetype)initWithUserId:(NSString *)userId
{
    if (self = [super init]) {
        _customerId = userId;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    
    
    return self;
}
@end

