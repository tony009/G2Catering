//
//  OrderPerson.h
//  G2Catering
//
//  Created by lcc on 16/7/5.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderPerson : NSObject

@property (nonatomic,copy)NSString *orderName;

@property (nonatomic,copy)NSString *orderAddress;

@property (nonatomic,copy)NSString *orderMoney;

-(instancetype)initWithdict:(NSDictionary   *)dic;

@end
