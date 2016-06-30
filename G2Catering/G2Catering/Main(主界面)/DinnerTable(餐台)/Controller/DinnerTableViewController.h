//
//  DinnerTableViewController.h
//  G2Catering
//
//  Created by wd on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DeskTableState) {
    DeskTableStateDefault = 0,
    DeskTableStateRevert = 1,
    DeskTableStatePress = 2,
    DeskTableStateEnd = 3,
    DeskTableStateCombin = 4
};

@interface DinnerTableViewController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *rightCollection;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UIView *waiMaiView;
@property (weak, nonatomic) IBOutlet UIView *waiMaiWholeView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
