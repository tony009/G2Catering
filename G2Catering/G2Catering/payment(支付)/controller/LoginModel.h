//
//  LoginModel.h
//  RuiMu
//
//  Created by 吴狄 on 16/3/18.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject<NSCoding>
//@property (nonatomic, strong) NSString *sorting;
//@property (nonatomic, strong) NSString *offset;
//@property (nonatomic, strong) NSString *limit;
//@property (nonatomic, strong) NSString *sysdataType;
//@property (nonatomic, strong) NSString *salt;
//@property (nonatomic, strong) NSString *mobile;
//@property (nonatomic, strong) NSString *name;
//@property (nonatomic, strong) NSString *authorizationCode;
//@property (nonatomic, strong) NSString *updateTime;
//@property (nonatomic, strong) NSString *adrCity;
//@property (nonatomic, strong) NSString *empNum;
//@property (nonatomic, strong) NSString *email;
//@property (nonatomic, strong) NSString *gender;
//@property (nonatomic, strong) NSString *emerContact;
//@property (nonatomic, strong) NSString *residenceAdr;
//@property (nonatomic, strong) NSString *adrProvince;
//@property (nonatomic, strong) NSString *plainPassword;
//@property (nonatomic, strong) NSString *authorizationMake;
//@property (nonatomic, strong) NSString *createBy;
//@property (nonatomic, strong) NSString *jobPic;
//@property (nonatomic, strong) NSString *resProvince;
//@property (nonatomic, strong) NSString *jobStatus;
//@property (nonatomic, strong) NSString *address;
//@property (nonatomic, strong) NSString *orgId;
//@property (nonatomic, strong) NSString *updateBy;
//@property (nonatomic, strong) NSString *loginPassword;
//@property (nonatomic, strong) NSString *edu;
//@property (nonatomic, strong) NSString *createTime;
@property (nonatomic, strong) NSString *loginUsername;
//@property (nonatomic, strong) NSString *emerConTel;
//@property (nonatomic, strong) NSString *resCity;
//@property (nonatomic, strong) NSString *salesmanId;
//@property (nonatomic, strong) NSString *brithdayDay;
//@property (nonatomic, strong) NSString *roleType;
@property (nonatomic, copy) NSString *defaultId;


- (instancetype)initWithJSONDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)convertToJSONDictionary;


@end
