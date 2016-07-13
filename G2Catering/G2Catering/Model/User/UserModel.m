//
//  UserModel.m
//  G2Catering
//
//  Created by wd on 16/7/11.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel


-(instancetype)initWithDefaultId:(NSString  *)defaultId
                   loginPassword:(NSString *)loginPassword{
    
    self = [super init];
    if (self) {
        _defaultId  = defaultId;
        _loginPassword = loginPassword;
    }
    return self;
    
}


@end
