//
//  longPressView.h
//  G2Catering
//
//  Created by tencrwin on 16/6/21.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LongPressViewDelegate <NSObject>

-(void)btnDelegateMethod:(UIButton *)btn;

@end

@interface LongPressView : UIView
@property (weak, nonatomic) IBOutlet UIView *changeView;
@property (weak, nonatomic) IBOutlet UIButton *printBtn;
@property (weak, nonatomic) IBOutlet UIButton *caculationBtn;
@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;
@property (weak, nonatomic) IBOutlet UIButton *doublebtn;
@property (weak, nonatomic) IBOutlet UIView *showView;

@property(nonatomic,weak)id<LongPressViewDelegate> delegate;

- (void)setPoint:(CGPoint)point;

@end
