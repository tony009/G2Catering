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
