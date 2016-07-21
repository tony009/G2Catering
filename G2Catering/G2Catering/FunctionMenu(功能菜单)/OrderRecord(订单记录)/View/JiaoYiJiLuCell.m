//
//  JiaoYiJiLuCell.m
//  G2TestDemo
//
//  Created by lcc on 15/8/17.
//  Copyright (c) 2015年 ws. All rights reserved.
//

#import "JiaoYiJiLuCell.h"


@interface JiaoYiJiLuCell ()

@property (weak, nonatomic) IBOutlet UILabel *danhao; //单号
@property (weak, nonatomic) IBOutlet UILabel *cantai; //餐台
@property (weak, nonatomic) IBOutlet UILabel *kaidanren; //开单人

@property (weak, nonatomic) IBOutlet UILabel *kaidanshijian; //开单时间
@property (weak, nonatomic) IBOutlet UILabel *jiezhangshijian;//结账时间
@property (weak, nonatomic) IBOutlet UILabel *yingshoujine; //应收金额
@property (weak, nonatomic) IBOutlet UILabel *shihoujine; //实收金额
@property (weak, nonatomic) IBOutlet UILabel *zhuangtai; //状态
@property (weak, nonatomic) IBOutlet UILabel *typeLabel; //支付方式


@end

@implementation JiaoYiJiLuCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(OrderModel *)model{
    
    _model = model;
    
    self.danhao.text = model.bno;
    self.kaidanren.text = model.customerName;
    self.kaidanshijian.text = model.createTime;
    self.yingshoujine.text = model.bamount;
    self.shihoujine.text = model.amountPaid;
    
}


@end
