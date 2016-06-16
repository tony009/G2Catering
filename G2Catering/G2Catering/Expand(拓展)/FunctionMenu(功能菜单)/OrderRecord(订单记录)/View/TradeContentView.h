//
//  TradeContentView.h
//  G2Catering
//
//  Created by iOS  on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TradeContentView;
@protocol TradeContentViewDelegate <NSObject>

@optional
- (void)TradeContentViewDidChickCheDan:(TradeContentView  *)orderContent;
- (void)TradeContentViewDidChickJieZhang:(TradeContentView  *)orderContent WithBillID:(NSString *)billID tableID:(NSString *)tableID count:(NSString *)count;
@end

@interface TradeContentView : UIView
@property (nonatomic, weak) id<TradeContentViewDelegate> delegate;

@property (weak, nonatomic) IBOutlet UILabel *tabNum;

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel;

@property (weak, nonatomic) IBOutlet UILabel *dishNumLabel;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *cheDanBtn;
@property (weak, nonatomic) IBOutlet UIButton *jieZhangBtn;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
