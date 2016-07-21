//
//  ShowGoodsView.h
//  G2Catering
//
//  Created by lcc on 16/7/13.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShopGoodsDetailModel.h"

@protocol ShowGoodsViewViewDelegate <NSObject>

-(void)btnDelegateName:(ShopGoodsDetailModel *)goodCheck number:(int)number type:(NSInteger)type;

@end
@interface ShowGoodsView : UIView

@property(nonatomic,weak)id<ShowGoodsViewViewDelegate> delegate;

@property (nonatomic,copy)NSString *deskName;

@property (weak, nonatomic) IBOutlet UIButton *typeSelectBtn;
@property (weak, nonatomic) IBOutlet UIButton *typeSelectBtn1;
@property (weak, nonatomic) IBOutlet UIButton *typeSelectBtn2;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (nonatomic,strong)ShopGoodsDetailModel *goodSuccess;


@end