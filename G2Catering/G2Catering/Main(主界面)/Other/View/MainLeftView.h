//
//  MainLeftView.h
//  G2Catering
//
//  Created by wd on 16/6/13.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainLeftView;
@protocol MainLeftViewDelegate <NSObject>

@optional
- (void)MainLeftViewMenuDidChick:(MainLeftView  *)orderContent withIndex:(NSInteger )index;

@end
@interface MainLeftView : UIView
@property (nonatomic, weak) id<MainLeftViewDelegate> delegate;
@end
