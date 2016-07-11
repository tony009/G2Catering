//
//  LoginModel.m
//  RuiMu
//
//  Created by 吴狄 on 16/3/18.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel


- (instancetype)init{
    
    
    if ((self = [super init])!=nil) {
        //
    }
    return self;
}


-(instancetype)initWithLoginUsername:(NSString *)loginUsername
                       loginPassword:(NSString *)loginPassword{
    if (self = [super init]) {
        _loginUsername = loginUsername;
        _loginPassword = loginPassword;
    }
    
    return self;
}


-(instancetype)initWithMobile:(NSString *)mobile
                     password:(NSString *)password{
    
    if (self = [super init]) {
        _mobile = mobile;
        _loginPassword = password;
    }
    
    return self;
    
}


- (id)copyWithZone:(NSZone *)zone{
    
    
    return self;
}

//-(NSString *)description
//
//{
////    return [NSString stringWithFormat:@" mobile   %@ verifycode   %@ password %@ reg_type %@",
////            self.mobile ,
////            self.verifycode,
////            self.password,
////            self.reg_type
////            ];
//}


@end
