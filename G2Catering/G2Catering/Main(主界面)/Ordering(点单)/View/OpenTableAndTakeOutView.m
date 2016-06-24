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

@property (strong, nonatomic) IBOutlet UIView *view;
@property (strong, nonatomic) IBOutlet UIView *contentView; //内容视图



@property (strong, nonatomic) IBOutlet UIView *placeOrderView;//开台视图

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;


@property (strong, nonatomic) IBOutletCollection(OpenTableButton) NSArray *peopleNoButtonCollection;
@property (strong,nonatomic)OpenTableButton *selectedPeopleNoButton;


@property (strong, nonatomic) IBOutletCollection(OpenTableButton) NSArray *tableNoButtonCollection;
@property (strong,nonatomic)OpenTableButton *selectedTableNoButton;

@property (strong,nonatomic) NSMutableArray *numArray;



@property (strong, nonatomic) IBOutlet UIView *takeOutView; //外卖视图

@end



@implementation OpenTableAndTakeOutView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
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
    return  self;
}

-(void)setUp{

    [[NSBundle mainBundle]loadNibNamed:@"OpenTableAndTakeOutView" owner:self options:nil];
    
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    id top = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    id bottom = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    id left = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    id right = [NSLayoutConstraint constraintWithItem:self.view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    [self addSubview:self.view];
    
    
    [NSLayoutConstraint activateConstraints:@[top,bottom,left,right]];
    
    
    
    
    
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
    
    
    
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
    
    
    self.numArray = [NSMutableArray array];
    
    for (int i =0; i< 10; i++) {
        [self.numArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    
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



- (IBAction)placeOrderAction:(UIButton *)sender {

    
    self.placeOrderView.frame = self.contentView.frame;
    
    [self addSubview:self.placeOrderView];

    
}

- (IBAction)takeOutAction:(UIButton *)sender
{
    self.takeOutView.frame = self.contentView.frame;
    
    [self addSubview:self.takeOutView];
    
    
}

- (IBAction)cancelAction:(UIButton *)sender {
    
    [self removeFromSuperview];
}

- (IBAction)confirmAction:(UIButton *)sender {
    
    
}



#pragma mark -- UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  [self.numArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
  OpenTableCollectionViewCell *cell =   [collectionView dequeueReusableCellWithReuseIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    
    [cell.button setTitle:self.numArray[indexPath.row] forState:UIControlStateNormal];
    
    
    return cell;
}

#pragma mark -- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    OpenTableCollectionViewCell *cell =(OpenTableCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
    [cell.button setSelected:YES];
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    OpenTableCollectionViewCell *cell =(OpenTableCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
    [cell.button setSelected:NO];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
