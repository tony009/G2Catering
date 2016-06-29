//
//  ShowMenuView.h
//  G2Catering
//
//  Created by lcc on 16/6/29.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ShowMenuViewViewDelegate <NSObject>

-(void)btnDelegateMethod:(UIButton *)btn;

@end
@interface ShowMenuView : UIView
@property(nonatomic,weak)id<ShowMenuViewViewDelegate> delegate;

-(void)setPoint:(CGPoint)point cllFrame:(CGRect)cllFrame;
@end
