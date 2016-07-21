//
//  OrderModel.h
//  G2Catering
//
//  Created by wd on 16/7/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject

@property (nonatomic,copy) NSString *sorting;
@property (nonatomic,copy) NSString *offset;
@property (nonatomic,copy) NSString *limit;
@property (nonatomic,copy) NSString *allPrivilege;
@property (nonatomic,copy) NSString *attribute16;
@property (nonatomic,copy) NSString *attribute15;
@property (nonatomic,copy) NSString *attribute11;
@property (nonatomic,copy) NSString *attribute1;
@property (nonatomic,copy) NSString *attribute5;
@property (nonatomic,copy) NSString *payType;  //支付类型
@property (nonatomic,copy) NSString *attribute10;
@property (nonatomic,copy) NSString *attribute9;
@property (nonatomic,copy) NSString *attribute14;
@property (nonatomic,copy) NSString *attribute20;
@property (nonatomic,copy) NSString *attribute7;
@property (nonatomic,copy) NSString *attribute6;
@property (nonatomic,copy) NSString *orgId;
@property (nonatomic,copy) NSString *remark;
@property (nonatomic,copy) NSString *updateTime;
@property (nonatomic,copy) NSString *amountPaid; //实收金额
@property (nonatomic,copy) NSString *customerName; //
@property (nonatomic,copy) NSString *status;  //状态
@property (nonatomic,copy) NSString *attribute4;
@property (nonatomic,copy) NSString *targetClient;
@property (nonatomic,copy) NSString *attribute8;
@property (nonatomic,copy) NSString *createTime; //开单时间
@property (nonatomic,copy) NSString *updateBy;
@property (nonatomic,copy) NSString *attribute18;
@property (nonatomic,copy) NSString *createBy;
@property (nonatomic,copy) NSString *attribute3;
@property (nonatomic,copy) NSString *attribute2;
@property (nonatomic,copy) NSString *cartId;
@property (nonatomic,copy) NSString *codelessSum;
@property (nonatomic,copy) NSString *orgName;
@property (nonatomic,copy) NSString *customerId;
@property (nonatomic,copy) NSString *allDiscount;
@property (nonatomic,copy) NSString *orderType;
@property (nonatomic,copy) NSString *omOrderPkgList;
@property (nonatomic,copy) NSString *defaultId;
@property (nonatomic,copy) NSString *bname;
@property (nonatomic,copy) NSString *bamount;// 应收金额
@property (nonatomic,copy) NSString *bno; //单号


@end
