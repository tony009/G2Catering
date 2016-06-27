//
//  SegmentedView.m
//  G2Catering
//
//  Created by wd on 16/6/27.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "SegmentedView.h"



@interface SegmentedView ()

@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;

@end
@implementation SegmentedView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return  self;
}

-(void)setUp{

    [[NSBundle mainBundle]loadNibNamed:@"SegmentedView" owner:self options:nil];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    id top = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    id bottom = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    id left = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    id right = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    [self addSubview:self.view];
    
    [NSLayoutConstraint activateConstraints:@[top,bottom,left,right]];
    
    
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 1;
    
}


- (IBAction)leftButtonAction:(UIButton *)sender {
    
    
    [self.leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.leftButton.backgroundColor = RGB(0x2a, 0x42, 0x5a);
    
    [self.rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.rightButton.backgroundColor = [UIColor whiteColor];
    
    if ([self.delegate respondsToSelector:@selector(segmentedViewValueChanged:)]) {
     
        [self.delegate segmentedViewValueChanged:0];
    }
    
}

- (IBAction)rightButtonAction:(UIButton *)sender{
    
    [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.rightButton.backgroundColor = RGB(0x2a, 0x42, 0x5a);
    
    [self.leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.leftButton.backgroundColor = [UIColor whiteColor];
    
    
    if ([self.delegate respondsToSelector:@selector(segmentedViewValueChanged:)]) {
        [self.delegate segmentedViewValueChanged:1];
    }
    
}


-(void)setLeftButtonStr:(NSString *)leftButtonStr{
    
    [self.leftButton setTitle:leftButtonStr forState:UIControlStateNormal];
    
}

-(void)setRightButtonStr:(NSString *)rightButtonStr{
    
    [self.rightButton setTitle:rightButtonStr forState:UIControlStateNormal];
}

@end
