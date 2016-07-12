//
//  GoodsType.h
//  G2Catering
//
//  Created by lcc on 16/7/12.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsType : NSObject

@property (nonatomic,copy) NSString *goodsContent;  //查询内容

-(instancetype)initWithGoodContent:(NSString *)goodsContent ;

@end
