//
//  ShowMenuView.h
//  G2Catering
//
//  Created by lcc on 16/6/29.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ShowMenuViewViewDelegate <NSObject>

-(void)btnDelegateMethod:(UIButton *)btn deskName:(NSString *)deskName;

@end
@interface ShowMenuView : UIView
@property(nonatomic,weak)id<ShowMenuViewViewDelegate> delegate;

@property (nonatomic,copy)NSString *deskName;

-(void)setPoint:(CGPoint)point cllFrame:(CGRect)cllFrame;
@end
