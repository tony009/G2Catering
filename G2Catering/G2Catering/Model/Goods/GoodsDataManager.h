//
//  GoodsDataManager.h
//  G2Catering
//
//  Created by wd on 16/7/13.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"

#import "GoodsModel.h"
#import "ChangeGoodsNO.h"
#import "DeleteStoreGoods.h"
#import "GoodsType.h"
#import "GoodsCheck.h"
#import "ChanggeGoods.h"

@interface GoodsDataManager : DataManager


//商品分类查询
+(void)typeGoodsCheck:(GoodsType *)goodsModel
              success:(success)success
              failure:(failure)failure;

//商品查询
+(void)goodsCheck:(GoodsCheck *)goodsModel
          success:(success)success
          failure:(failure)failure;

//修改商品
+(void)changgeGoods:(ChangeGoodsNO *)goodsModel
            success:(success)success
            failure:(failure)failure;



@end
