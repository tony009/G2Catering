//
//  FoodCollectionViewCell.h
//  G2Catering
//
//  Created by NDlan on 16/6/15.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *foodPicture;
@property (weak, nonatomic) IBOutlet UILabel *foodName;

@end
