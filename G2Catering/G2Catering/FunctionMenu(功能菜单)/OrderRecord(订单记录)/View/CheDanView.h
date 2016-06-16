//
//  CheDanView.h
//  G2Catering
//
//  Created by iOS  on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CheDanView;
@protocol CheDanViewDelegate <NSObject>

@optional
- (void)CheDanViewDidCancel:(CheDanView  *)orderContent;
- (void)CheDanViewDidYes:(CheDanView  *)orderContent;
@end
@interface CheDanView : UIView
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *yesBtn;
@property(nonatomic,assign)id <CheDanViewDelegate>delegate;

@end
