//
//  MainRightView.h
//  G2Catering
//
//  Created by wd on 16/6/13.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainRightView;
@protocol MainRightViewDelegate <NSObject>

@optional
- (void)MainRightViewMenuDidChick:(MainRightView  *)orderContent withIndex:(NSInteger )index;

@end
@interface MainRightView : UIView

@property (weak, nonatomic) IBOutlet UIButton *orderingButton;
@property (nonatomic, weak) id<MainRightViewDelegate> delegate;
@end
