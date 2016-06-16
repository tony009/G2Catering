//
//  MainLeftTableViewCell.h
//  G2Catering
//
//  Created by wd on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainLeftTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *pImageView;

@property (weak, nonatomic) IBOutlet UILabel *pLabel;

@property (strong,nonatomic)NSString *defaultImageName;
@property (strong,nonatomic)NSString *selectedImageName;


@end
