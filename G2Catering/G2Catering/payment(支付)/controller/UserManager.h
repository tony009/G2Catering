//
//  UserManager.h
//  iBeacon
//
//  Created by wd on 16/5/4.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CmEmployee.h"
#import "Base3cIbeaconInfo.h"
@interface UserManager : NSObject

@property (nonatomic,copy,readonly) CmEmployee *user;

@property (nonatomic,copy,readonly) Base3cIbeaconInfo *iBeaconInfo;

+(instancetype)sharedInstance;

-(BOOL)hasLogined;

-(void)registerUser:(CmEmployee *)user;
-(void)unregister;

-(void)setIBeaconInfo:(Base3cIbeaconInfo *)iBeaconInfo;

@end
