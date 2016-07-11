//
//  UserManager.m
//  iBeacon
//
//  Created by wd on 16/5/4.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "UserManager.h"

@interface UserManager ()

@end

static NSString *KUSER = @"user";
static NSString *KIBEACON = @"kibeacon";

@implementation UserManager

+(instancetype)sharedInstance{
    
    static UserManager *instance;
    static dispatch_once_t oncePredicate;
    
    if (instance ==nil) {
        dispatch_once(&oncePredicate, ^{

            instance=[[super alloc]init];
            

            if (!instance.user) {
                
                NSData *archivedData = [[NSUserDefaults standardUserDefaults]objectForKey:KUSER];
                
                if (archivedData) {
                    CmEmployee *user =  [NSKeyedUnarchiver unarchiveObjectWithData:archivedData];
                    
                    [instance registerUser:user];
                }
                
    
            }
            
        });
    }
    
    return instance;
    
}

-(BOOL)hasLogined{
    
    if (_user) {
        return true;
    }else{
        return  false;
    }
    
}


-(void)setIBeaconInfo:(Base3cIbeaconInfo *)iBeaconInfo{
    
    if (_iBeaconInfo != iBeaconInfo) {
        _iBeaconInfo = iBeaconInfo;
        
        
        NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:_iBeaconInfo];
        
        [[NSUserDefaults standardUserDefaults] setObject:archivedData forKey:KIBEACON];
    }
    
    
}

-(void)registerUser:(CmEmployee *)user{
    
    
        _user = user;
        
        NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:_user];
        
        [[NSUserDefaults standardUserDefaults] setObject:archivedData forKey:KUSER];
       
    
    
}


-(void)unregister{
    
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:KUSER];
    _user = nil;
}
@end
