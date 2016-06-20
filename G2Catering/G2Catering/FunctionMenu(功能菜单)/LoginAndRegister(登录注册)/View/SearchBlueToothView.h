//
//  SearchBlueToothView.h
//  G2Catering
//
//  Created by NDlan on 16/6/20.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchBlueToothView : UIView
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UIButton *scanBtn;

@property (weak, nonatomic) IBOutlet UITableView *deviceTableView;

@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIView *searchViewBackView;

@end
