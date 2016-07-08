//
//  UtilsMacros.h
//  G2Catering
//
//  Created by wd on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

//获取keyWindow
#define KWindow    [UIApplication sharedApplication].keyWindow

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)



//获取系统时间戳
#define getCurentTime [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]]

#endif /* UtilsMacros_h */
