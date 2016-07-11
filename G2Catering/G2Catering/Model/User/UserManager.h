//
//  UserManager.h
//  iBeacon
//
//  Created by wd on 16/5/4.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserManager : NSObject

@property (nonatomic,copy,readonly) CmEmployee *user;

+(instancetype)sharedInstance;

-(BOOL)hasLogined;

-(void)registerUser:(CmEmployee *)user;
-(void)unregister;


@end
