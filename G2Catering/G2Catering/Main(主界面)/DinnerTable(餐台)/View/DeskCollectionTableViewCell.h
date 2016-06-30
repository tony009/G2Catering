//
//  DeskCollectionTableViewCell.h
//  G2Catering
//
//  Created by lcc on 16/6/27.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeskCollectionTableViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *baiLabel;
@property (weak, nonatomic) IBOutlet UILabel *shiLabel;
@property (weak, nonatomic) IBOutlet UILabel *geLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@end
