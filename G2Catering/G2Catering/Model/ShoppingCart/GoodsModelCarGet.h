//
//  GoodsModelCarGet.h
//  G2Catering
//
//  Created by lcc on 16/7/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModelCarGet : NSObject

@property (nonatomic,copy) NSString *customerId;   //当前用户ID


-(instancetype)initWithUserId:(NSString *)userId;

@end

