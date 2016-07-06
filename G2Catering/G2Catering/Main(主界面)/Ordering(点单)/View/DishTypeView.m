//
//  DishTypeView.m
//  G2Catering
//
//  Created by wd on 16/6/17.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "DishTypeView.h"
#import "DishTypeViewCollectionViewCell.h"


@interface DishTypeView ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) UICollectionView *collectionView;






@end

@implementation DishTypeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)initWithFrame:(CGRect)frame{
    self =  [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}


-(void)setUp{
    
    //self.backgroundColor = [UIColor lightGrayColor];
    self.backgroundColor = [UIColor clearColor];
    UICollectionViewFlowLayout *layout= [[UICollectionViewFlowLayout alloc]init];
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    flowLayout.minimumLineSpacing = 7;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(63, 95);
 
    [self.collectionView registerClass:[DishTypeViewCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self addSubview:self.collectionView];
    
    
    self.strArray = [NSArray array];
}


#pragma mark -- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.strArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identify = @"cell";
    
    DishTypeViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    
    [cell.btn setTitle:self.strArray[indexPath.row] forState:UIControlStateNormal];
    
    return cell;
}


#pragma mark -- UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DishTypeViewCollectionViewCell *cell = (DishTypeViewCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
//    CGRect frame = cell.frame;
//    frame.size.height = 100;
//    frame.size.width = 80;
//    cell.frame = frame;
    
    cell.backgroundColor = RGB(0x2a, 0x42, 0x5a);
    [cell.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
    
    
    if ([self.delegate respondsToSelector:@selector(DishTypeView:didSelectItemAtIndex:)]) {
        
        [self.delegate DishTypeView:self didSelectItemAtIndex:indexPath.row];
        
    }
    
}


- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    DishTypeViewCollectionViewCell *cell = (DishTypeViewCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    [cell.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

@end
