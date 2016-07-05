//
//  OrderPerson.m
//  G2Catering
//
//  Created by lcc on 16/7/5.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "OrderPerson.h"

@implementation OrderPerson

-(instancetype)initWithdict:(NSDictionary   *)dic
{
    self = [super init];
    if (self) {
        self.orderName = @"陈 陈";
        self.orderAddress = @"北区";
        self.orderMoney = @"145元";
    }
    return self;
}

@end
