//
//  RegisterModel.m
//  RuiMu
//
//  Created by 吴狄 on 16/3/18.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "RegisterModel.h"

@implementation RegisterModel

- (instancetype)init{
    
    
    if ((self = [super init])!=nil) {
        //
    }
    return self;
}

- (id)copyWithZone:(NSZone *)zone{
    
    
    return self;
}

-(instancetype)initWithUsername:(NSString *)username
                         Mobile:(NSString *)mobile
                     verifycode:(NSString *)code
                       password:(NSString *)password ;
{
    
    if (self = [super init]) {
        _mobile = mobile;
        _loginUsername = username;
        _authorizationCode = code;
        _loginPassword = password;
    }
    
    
    return self;
}

-(NSString *)description

{
    return [NSString stringWithFormat:@" mobile   %@ verifycode   %@ password %@",
            self.mobile ,
            self.authorizationCode,
            self.loginPassword
            ];
}


@end
