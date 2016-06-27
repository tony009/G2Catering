//
//  SegmentedView.h
//  G2Catering
//
//  Created by wd on 16/6/27.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SegmentedViewDelegate <NSObject>

-(void)segmentedViewValueChanged:(NSInteger)index;

@end


@interface SegmentedView : UIView

@property (nonatomic,strong)NSString *leftButtonStr;
@property (nonatomic,strong)NSString *rightButtonStr;

@property (nonatomic) int selectedIndex;

@property (weak,nonatomic)id<SegmentedViewDelegate>delegate;

@end
