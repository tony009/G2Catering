//
//  LockScreenView.m
//  G2Catering
//
//  Created by NDlan on 16/6/24.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "LockScreenView.h"

@implementation LockScreenView

- (instancetype)initWithFrame:(CGRect)frame{
    
    
    if (self == [super initWithFrame:frame]) {
        
        [self setupUI];
        
        self.backgroundColor = [UIColor blackColor];
        self.alpha = 0.65;
        
    }
    return self;
}

- (void)setupUI{
    
//    UIImageView *imageViewCloud = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"统计表云彩"]];
//    
//    [self addSubview:imageViewCloud];
//    
//    NSArray *constraintH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|--imageViewCloud--|" options:nil metrics:nil views:@{@"imageViewCloud":imageViewCloud}];
//    
    
    
}

@end
