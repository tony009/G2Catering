//
//  ZhifuView.m
//  G2Catering
//
//  Created by iOS  on 16/6/17.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "ZhifuView.h"
#import "TypeCollectionViewCell.h"
@interface  ZhifuView()<UICollectionViewDataSource,UICollectionViewDelegate>{
    
    NSMutableArray *_typeArray;
}
@end
@implementation ZhifuView

- (void)awakeFromNib{
    _typeArray = [NSMutableArray arrayWithArray:@[@"百度钱包",@"微信",@"组8",@"组9",@"组10",@"组14",@"组12",@"组13"]];
    [self.typeCollection registerNib:[UINib nibWithNibName:@"TypeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"TypeCollectionViewCell"];
    self.typeCollection.dataSource =self;
    self.typeCollection.delegate =self;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.verifyView.layer.cornerRadius = 5;

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
    return cell;
    
    
}

@end
