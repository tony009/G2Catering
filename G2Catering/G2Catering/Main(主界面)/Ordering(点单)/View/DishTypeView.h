//
//  DishTypeView.h
//  G2Catering
//
//  Created by wd on 16/6/17.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DishTypeView;
@protocol DishTypeViewDelegate <NSObject>

- (void)DishTypeView:(DishTypeView *)dishTypeView didSelectItemAtIndex:(NSInteger)index;

@end

@interface DishTypeView : UIView

@property (nonatomic,strong) NSArray<NSString *> *strArray;

@property (nonatomic,weak)id<DishTypeViewDelegate>delegate;

-(void)setSelectIndex:(NSInteger)index;

@end
