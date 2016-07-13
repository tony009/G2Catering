//
//  GoodsCheck.h
//  G2Catering
//
//  Created by lcc on 16/7/12.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsCheck : NSObject

@property (nonatomic,copy) NSString *orgId;  //当前商铺ID


-(instancetype)initWithOrgId:(NSString *)orgId;

@end
