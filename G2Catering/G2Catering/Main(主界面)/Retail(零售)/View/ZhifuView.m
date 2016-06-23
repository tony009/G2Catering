//
//  ZhifuView.m
//  G2Catering
//
//  Created by iOS  on 16/6/17.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "ZhifuView.h"
#import "TypeCollectionViewCell.h"
#import "fuKuanView.h"
@interface  ZhifuView()<UICollectionViewDataSource,UICollectionViewDelegate>{
    
    NSMutableArray *_typeArray;
    NSMutableArray *_stypeArray;
    NSMutableArray *_ntypeArray;
    UIButton *_selectedBtn;

}
@end
@implementation ZhifuView

- (void)awakeFromNib{
    _typeArray = [NSMutableArray arrayWithArray:@[@"百度钱包3",@"微信支付3",@"支付宝3",@"qq3",@"pay3",@"vip3",@"银联3",@"组13"]];
     _stypeArray = [NSMutableArray arrayWithArray:@[@"百度钱包2",@"微信支付2",@"支付宝2",@"qq2",@"pay2",@"vip2",@"银联2",@"组13"]];
    _ntypeArray = [NSMutableArray arrayWithArray:@[@"百度钱包1",@"微信支付1",@"支付宝1",@"qq1",@"pay1",@"vip1",@"银联1",@"组13"]];
    [self.typeCollection registerNib:[UINib nibWithNibName:@"TypeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"TypeCollectionViewCell"];
    self.typeCollection.dataSource =self;
    self.typeCollection.delegate =self;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.verifyView.layer.cornerRadius = 5;
    self.verifyView.layer.borderWidth = 1;
    self.verifyView.layer.borderColor = [UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1].CGColor;
    [self setRoundAngleWithView:self.button1 withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
    
    [self setRoundAngleWithView:self.button2 withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
    [self setRoundAngleWithView:self.button3 withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
    [self setRoundAngleWithView:self.button4 withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
    [self setRoundAngleWithView:self.yuView withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
}


//设置圆角
- (void)setRoundAngleWithView:(UIView *)changeView withCornerRadius:(double)cornerRadius withColor:(UIColor *)color{
    
    changeView.layer.masksToBounds = YES;
    changeView.layer.cornerRadius = cornerRadius;
    changeView.layer.borderColor = color.CGColor;
    changeView.layer.borderWidth = 1;
    
}


-(void)setIsYu:(BOOL)isYu{
    
    _isYu = isYu;
    if(_isYu){
        
        self.yuFuView.hidden = NO;

            self.allView.transform= CGAffineTransformMakeTranslation(0, 80);

    }
    
}
-(void)setPrice:(float)price{
    
    _price = price;
    _moneyLabel.text = [NSString stringWithFormat:@"%.2f",_price];
    [_button1 setTitle:[NSString stringWithFormat:@"￥%.2f",_price] forState:UIControlStateNormal];
    if ([_moneyLabel.text integerValue] %10<5) {
        
        long count = [_moneyLabel.text integerValue]/10;
        float price = count *10+5;
        float price2 = (count +1)*10;
        
        [_button2 setTitle:[NSString stringWithFormat:@"￥%.2f",price] forState:UIControlStateNormal];
        [_button3 setTitle:[NSString stringWithFormat:@"￥%.2f",price2] forState:UIControlStateNormal];
    }else{
        
        long count = [_moneyLabel.text integerValue]/10;
        float price = (count +1)*10;
        float price2 = (count +2)*10;
        
        [_button2 setTitle:[NSString stringWithFormat:@"￥%.2f",price] forState:UIControlStateNormal];
        [_button3 setTitle:[NSString stringWithFormat:@"￥%.2f",price2] forState:UIControlStateNormal];
    }
    

}






- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _typeArray.count;
    
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TypeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TypeCollectionViewCell" forIndexPath:indexPath];
    [cell.typeBtn setImage:[UIImage imageNamed:_typeArray[indexPath.row]] forState:UIControlStateNormal];
     [cell.typeBtn setImage:[UIImage imageNamed:_ntypeArray[indexPath.row]] forState:UIControlStateDisabled];
    [cell.typeBtn setImage:[UIImage imageNamed:_stypeArray[indexPath.row]] forState:UIControlStateSelected];
    cell.typeBtn.tag = 200+indexPath.row;
    return cell;
    
    
}

- (IBAction)yesAction:(UIButton *)sender {
    if (_selectedBtn.tag == 205) {
        
        //vip
        fuKuanView *fuView = [[[NSBundle mainBundle]loadNibNamed:@"fuKuanView" owner:self options:nil]lastObject];
        fuView.statusString = @"vip";
        [self addSubview:fuView];
        
    }
}


- (IBAction)cancelAction:(UIButton *)sender {
    
    [self removeFromSuperview];
}


- (IBAction)cashClick:(UIButton *)sender {
    fuKuanView *fuView = [[[NSBundle mainBundle]loadNibNamed:@"fuKuanView" owner:self options:nil]lastObject];
    fuView.statusString = sender.currentTitle;
    fuView.frame = self.bounds;
    
    [self addSubview:fuView];
    
    
}



- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    _selectedBtn.selected = NO;
    TypeCollectionViewCell *cell = (TypeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    _selectedBtn = cell.typeBtn;
    cell.typeBtn.selected = !cell.typeBtn.selected;
    
//    fuKuanView *fuView = [[[NSBundle mainBundle]loadNibNamed:@"fuKuanView" owner:self options:nil]lastObject];
//    fuView.statusString = @"card";
//    fuView.frame = self.bounds;
//
//    [self addSubview:fuView];
}

@end
