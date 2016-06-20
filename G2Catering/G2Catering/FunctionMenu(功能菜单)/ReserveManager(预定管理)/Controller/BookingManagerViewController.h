//
//  BookingManagerViewController.h
//  G2Catering
//
//  Created by NDlan on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookingManagerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *searchBackView;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UITableView *bookTableView;
@property (weak, nonatomic) IBOutlet UIView *backView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *marginBetweenBackView;

@property (weak, nonatomic) IBOutlet UIView *rightBackView;

@property (weak, nonatomic) IBOutlet UIView *tableChooseView;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tableTypeBtn;
@property (weak, nonatomic) IBOutlet UICollectionView *tableCollectionView;


@property (weak, nonatomic) IBOutlet UIView *bookTypeBackView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *bookStatusBtn;
@property (weak, nonatomic) IBOutlet UIButton *showAndCloseLeftBtn;


@end
