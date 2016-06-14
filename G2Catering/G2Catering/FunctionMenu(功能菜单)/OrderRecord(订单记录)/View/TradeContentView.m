//
//  TradeContentView.m
//  G2Catering
//
//  Created by iOS  on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "TradeContentView.h"
#import "JiLuCaiViewCell.h"
@interface TradeContentView()<UITableViewDataSource,UITableViewDelegate>
@end
@implementation TradeContentView

-(void)awakeFromNib{
    
    [super awakeFromNib];
    [self initSubViews];
}

- (void)initSubViews{
    self.tableView.dataSource =self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"JiLuCaiViewCell" bundle:nil] forCellReuseIdentifier:@"JiLuCaiViewCell"];
    [self setRoundAngleWithView:self.cheDanBtn withCornerRadius:5 withColor:[UIColor clearColor]];
    [self setRoundAngleWithView:self.jieZhangBtn withCornerRadius:5 withColor:[UIColor clearColor]];
//    self.cheDanBtn setTitleColor:[] forState:<#(UIControlState)#>
}

//设置圆角
- (void)setRoundAngleWithView:(UIView *)changeView withCornerRadius:(double)cornerRadius withColor:(UIColor *)color{
    
    changeView.layer.masksToBounds = YES;
    changeView.layer.cornerRadius = cornerRadius;
    changeView.layer.borderColor = color.CGColor;
    changeView.layer.borderWidth = 1;
    
}


#pragma mark - tableView的数据源和代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  9;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JiLuCaiViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JiLuCaiViewCell"];
    cell.xuhao.text = [NSString stringWithFormat:@"%02ld",indexPath.row+1];
    return cell;
  
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
    
    
    
}


@end
