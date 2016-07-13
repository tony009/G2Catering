//
//  UserModel.h
//  G2Catering
//
//  Created by wd on 16/7/11.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property(nonatomic,copy)NSString  *defaultId;
@property(nonatomic,copy)NSString    *userId;
@property(nonatomic,copy)NSString    *orgId;
@property(nonatomic,copy)NSString    *empNum; //
@property(nonatomic,copy)NSString    *loginUsername; //登录账号
@property(nonatomic,copy)NSString    *loginPassword; //登录密码
@property(nonatomic,copy)NSString    *name;     //姓名
@property(nonatomic,copy)NSString    *mobile;   //手机号
@property(nonatomic,copy)NSString    *gender;   //性别
@property(nonatomic,copy)NSString    *jobPic;
@property(nonatomic,copy)NSString    *address;
@property(nonatomic,copy)NSString    *residenceAdr;
@property(nonatomic,copy)NSString    *adrProvince;
@property(nonatomic,copy)NSString    *adrCity;
@property(nonatomic,copy)NSString    *resProvince;
@property(nonatomic,copy)NSString    *resCity;
@property(nonatomic,copy)NSString    *jobStatus;  //状态（0：在职，1：不在职，2：会员）
@property(nonatomic,copy)NSString    *emerContact;
@property(nonatomic,copy)NSString    *emerConTel;
@property(nonatomic,copy)NSString    *salt;
@property(nonatomic,copy)NSString    *plainPassword;
@property(nonatomic,copy)NSString    *sysdataType;
@property(nonatomic,copy)NSString    *createTime;
@property(nonatomic,copy)NSString    *createBy;
@property(nonatomic,copy)NSString    *updateTime;
@property(nonatomic,copy)NSString    *updateBy;
@property(nonatomic,copy)NSString    *authorizationCode;
@property(nonatomic,copy)NSString    *authorizationMake;
@property(nonatomic,copy)NSString    *brithdayDay;
@property(nonatomic,copy)NSString    *edu;
@property(nonatomic,copy)NSString    *email;

@property(nonatomic) NSArray *groupIds;


-(instancetype)initWithDefaultId:(NSString  *)defaultId
                   loginPassword:(NSString *)loginPassword;



@end
