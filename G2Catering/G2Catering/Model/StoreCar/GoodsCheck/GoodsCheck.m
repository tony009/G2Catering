//
//  GoodsCheck.m
//  G2Catering
//
//  Created by lcc on 16/7/12.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "GoodsCheck.h"

@implementation GoodsCheck
- (instancetype)init{
    
    
    if ((self = [super init])!=nil) {
            //
    }
    return self;
}


-(instancetype)initWithOrgId:(NSString *)orgId
{
    if (self = [super init]) {
        _orgId = orgId;
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    
    
    return self;
}
@end
