//
//  LoginModel.h
//  RuiMu
//
//  Created by 吴狄 on 16/3/18.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject

@property (nonatomic,copy) NSString *loginUsername;  //用户名

@property (nonatomic,copy) NSString *loginPassword; //密码

@property (nonatomic,copy) NSString *mobile; //手机号



-(instancetype)initWithLoginUsername:(NSString *)loginUsername
                     loginPassword:(NSString *)loginPassword;


-(instancetype)initWithMobile:(NSString *)mobile
                       password:(NSString *)password;


@end
