//
//  OrderingCollectionViewCell.h
//  G2Catering
//
//  Created by wd on 16/6/12.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderingCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *dishName; //菜名
@property (weak, nonatomic) IBOutlet UILabel *dishNumLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dishNumImageView;
@end
