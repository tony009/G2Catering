//
//  RegisterModel.h
//  RuiMu
//
//  Created by 吴狄 on 16/3/18.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegisterModel : NSObject


@property (nonatomic,copy) NSString *loginUsername; //用户名

@property (nonatomic,copy) NSString *mobile; //电话

@property (nonatomic,copy) NSString *authorizationCode; //验证码

@property (nonatomic,copy) NSString *loginPassword; //用户口令

-(instancetype)initWithUsername:(NSString *)username
                         Mobile:(NSString *)mobile
                     verifycode:(NSString *)code
                       password:(NSString *)password ;

@end
