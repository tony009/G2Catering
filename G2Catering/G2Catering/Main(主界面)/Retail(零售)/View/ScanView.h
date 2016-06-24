//
//  ScanView.h
//  G2Catering
//
//  Created by iOS  on 16/6/24.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  ScanView;
@protocol  ScanViewControllerDelegate <NSObject>
-(void)scanViewControllerdidFinishScan :(ScanView *)vc result:(NSString*)str;
@end
@interface ScanView : UIView
@property (nonatomic, weak) id<ScanViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *lineImgView;

@end
