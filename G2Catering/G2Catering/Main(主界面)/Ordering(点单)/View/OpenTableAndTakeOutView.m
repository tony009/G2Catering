//
//  OpenTableAndTakeOutView.m
//  G2Catering
//
//  Created by wd on 16/6/20.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "OpenTableAndTakeOutView.h"
#import "OpenTableButton.h"
#import "OpenTableCollectionViewCell.h"

@interface OpenTableAndTakeOutView ()<UICollectionViewDataSource,UICollectionViewDelegate>{
    
    NSString *_peopleNo;
    NSString *_tableNo;
    NSString *_remarks;
    
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@property (strong, nonatomic) IBOutletCollection(OpenTableButton) NSArray *peopleNoButtonCollection;
@property (weak,nonatomic)OpenTableButton *selectedPeopleNoButton;


@property (strong, nonatomic) IBOutletCollection(OpenTableButton) NSArray *tableNoButtonCollection;
@property (weak,nonatomic)OpenTableButton *selectedTableNoButton;

@end



@implementation OpenTableAndTakeOutView

-(void)awakeFromNib{
    
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = YES;
    
    
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
    flowLayout.minimumLineSpacing =2;
    flowLayout.minimumInteritemSpacing = 2;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(72, 83);
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"OpenTableCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"reuseIdentifier"];

    [self.peopleNoButtonCollection enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        OpenTableButton *button = (OpenTableButton*)obj;
        [button addTarget:self action:@selector(peopleNoButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }];
    
    [self.tableNoButtonCollection enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        OpenTableButton *button = (OpenTableButton*)obj;
        [button addTarget:self action:@selector(tableNoButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }];
    
    
}



-(void)peopleNoButtonAction:(OpenTableButton *)button{
    
    if (self.selectedPeopleNoButton !=button) {
        [self.selectedPeopleNoButton setSelected:NO];
        [button setSelected:YES];
        self.selectedPeopleNoButton = button;
    }
    
}


-(void)tableNoButtonAction:(OpenTableButton *)button{
    
    if (self.selectedTableNoButton !=button) {
        [self.selectedTableNoButton setSelected:NO];
        [button setSelected:YES];
        self.selectedTableNoButton = button;
    }
    
    
}

#pragma mark -- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  9;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
  OpenTableCollectionViewCell *cell =   [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
