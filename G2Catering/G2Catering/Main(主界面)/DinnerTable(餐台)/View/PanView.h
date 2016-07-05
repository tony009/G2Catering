//
//  PanView.h
//  G2Catering
//
//  Created by lcc on 16/6/29.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanView : UILabel

-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title;

@property (nonatomic,copy)NSString *nameString;

@end
