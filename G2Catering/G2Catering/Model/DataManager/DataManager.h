//
//  DataManager.h
//  RuiMu
//
//  Created by 吴狄 on 16/3/22.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpTool.h"
#import "MJExtension.h"

//static NSString *iBeaconBaseUrl = @"http://192.168.1.15:8080/"; //测试
//
//static NSString *baseUrl = @"http://122.112.12.25:18081/";

static NSString *errorDomain= @"www.ndlan.g2.iBeacon";


@interface DataManager : NSObject

typedef void (^NDLHttpResponse)(id response,
                                NSError *ErrorMessage);


typedef NS_ENUM(NSInteger, HttpErrorCode) {
    
    HttpErrorCode_WrongReult = 1 //错误的返回结果
    
};


@end
