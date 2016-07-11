//
//  LoginModel.m
//  RuiMu
//
//  Created by 吴狄 on 16/3/18.
//  Copyright © 2016年 NDL. All rights reserved.
//
#import "YYModel.h"
#import "LoginModel.h"

@implementation LoginModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
//             @"sorting" : @"sorting",
//             @"offset" : @"offset",
//             @"limit" : @"limit",
//             @"sysdataType" : @"sysdataType",
//             @"salt" : @"salt",
//             @"mobile" : @"mobile",
//             @"name" : @"name",
//             @"authorizationCode" : @"authorizationCode",
//             @"updateTime" : @"updateTime",
//             @"adrCity" : @"adrCity",
//             @"empNum" : @"empNum",
//             @"email" : @"email",
//             @"gender" : @"gender",
//             @"emerContact" : @"emerContact",
//             @"residenceAdr" : @"residenceAdr",
//             @"adrProvince" : @"adrProvince",
//             @"plainPassword" : @"plainPassword",
//             @"authorizationMake" : @"authorizationMake",
//             @"createBy" : @"createBy",
//             @"jobPic" : @"jobPic",
//             @"resProvince" : @"resProvince",
//             @"jobStatus" : @"jobStatus",
//             @"address" : @"address",
//             @"orgId" : @"orgId",
//             @"updateBy" : @"updateBy",
//             @"loginPassword" : @"loginPassword",
//             @"edu" : @"edu",
//             @"createTime" : @"createTime",
             @"loginUsername" : @"loginUsername",
//             @"emerConTel" : @"emerConTel",
//             @"resCity" : @"resCity",
//             @"salesmanId" : @"salesmanId",
//             @"brithdayDay" : @"brithdayDay",
//             @"roleType" : @"roleType",
             @"defaultId" : @"defaultId",
             };
}
- (void)encodeWithCoder:(NSCoder *)aCoder { [self yy_modelEncodeWithCoder:aCoder]; }
- (id)initWithCoder:(NSCoder *)aDecoder { return [self yy_modelInitWithCoder:aDecoder]; }

@end
