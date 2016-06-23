//
//  DeskCollectionViewCell.h
//  G2Catering
//
//  Created by tencrwin on 16/6/17.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeskCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *baiLabel;
@property (weak, nonatomic) IBOutlet UILabel *shiLabel;
@property (weak, nonatomic) IBOutlet UILabel *geLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;

@end
