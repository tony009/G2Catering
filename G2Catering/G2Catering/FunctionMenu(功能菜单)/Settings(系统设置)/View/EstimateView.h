//
//  EstimateView.h
//  G2Catering
//
//  Created by NDlan on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EstimateSettingView.h"


@interface EstimateView : UIView
@property (weak, nonatomic) IBOutlet UIView *bottonBackView;
@property (weak, nonatomic) IBOutlet UIView *middleBackView;
@property (weak, nonatomic) IBOutlet UIView *collectionBackView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *foodTypeBtn;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *foodTypeLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *foodCollectionView;

@property (nonatomic, strong) EstimateSettingView *estimateSettingView;
@end
