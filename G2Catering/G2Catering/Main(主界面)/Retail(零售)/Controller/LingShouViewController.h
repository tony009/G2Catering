//
//  LingShouViewController.h
//  G2Catering
//
//  Created by iOS  on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LingShouViewController : UIViewController
//存取字符串显示的字符串
@property(retain,nonatomic) NSMutableString *resultStr;
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIButton *jieZhangBtn;

@property (weak, nonatomic) IBOutlet UIButton *xiaDanBtn;
@property (weak, nonatomic) IBOutlet UITableView *consumeTable;

@property (weak, nonatomic) IBOutlet UILabel *numLabel;

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;


@end
