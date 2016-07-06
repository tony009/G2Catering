//
//  DinnerTableViewController.h
//  G2Catering
//
//  Created by wd on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

// 四中状态 默认，拼桌等
typedef NS_ENUM(NSInteger, DeskTableState) {
    DeskTableStateDefault = 0,
    DeskTableStateRevert = 1,
    DeskTableStatePress = 2,
    DeskTableStateEnd = 3,
    DeskTableStateCombin = 4
};

typedef NS_ENUM(NSInteger,DeskState) {
    DeskStateAll =0,
    DeskStateSmall = 1,
    DeskStateMiddle = 2,
    DeskStateBig = 3,
    DeskStateOther = 4
};

@interface DinnerTableViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *rightCollection;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UIView *waiMaiView;
@property (weak, nonatomic) IBOutlet UIView *waiMaiWholeView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;

@end
