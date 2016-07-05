//
//  EstimateView.m
//  G2Catering
//
//  Created by NDlan on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "EstimateView.h"
#import "FoodCollectionViewCell.h"

@interface EstimateView()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation EstimateView

- (void)awakeFromNib{

    
    [self setupCollectionView];
    [self setupEstimateSettingView];
    self.bottonBackView.layer.cornerRadius  = 5;
    self.bottonBackView.layer.masksToBounds = YES;
    
    self.middleBackView.layer.cornerRadius  = 5;
    self.middleBackView.layer.masksToBounds = YES;
    
    self.collectionBackView.layer.cornerRadius  = 5;
    self.collectionBackView.layer.masksToBounds = YES;
    
    self.bottonBackView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.bottonBackView.layer.borderWidth = 1;
    self.collectionBackView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.collectionBackView.layer.borderWidth = 1;
    self.middleBackView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.middleBackView.layer.borderWidth = 1;
    
    
    for (int i = 0; i<self.foodTypeLabel.count; i++) {
        
        UILabel *label = self.foodTypeLabel[i];
        label.tag = 1000 + i ;
        
        if (i == 0) {
            
            label.textColor = [UIColor whiteColor];
        }else{
            
             label.textColor = [UIColor blackColor];
        }
    }
    
    
    for (int j = 0; j<self.foodTypeBtn.count; j++) {
         UIButton *button = self.foodTypeBtn[j];
        if (j == 0) {
            
            button.selected = YES;
            [button setBackgroundColor:[UIColor colorWithRed:41/255.0f green:65/255.0f blue:89/255.0f alpha:1]];
        }else{
            
            button.selected = NO;
            [button setBackgroundColor:[UIColor whiteColor]];
        }
  
        button.tag = 100 + j ;
        button.layer.borderWidth = 1;
        button.layer.borderColor = [UIColor lightGrayColor].CGColor;
        button.titleEdgeInsets  = UIEdgeInsetsMake(-25, 10, 0, 0);
        button.layer.cornerRadius  = 10;
        button.layer.masksToBounds = YES;
        [button addTarget:self action:@selector(didClickChooseFoodTypeBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }

}


- (void)didClickChooseFoodTypeBtn:(UIButton *)sender{

    sender.selected = YES;
    
    for (UIButton *btn in self.foodTypeBtn) {
        
        if (btn.tag != sender.tag) {
            
            for (UILabel *label in self.foodTypeLabel) {
                
                if (label.tag - 1000 == btn.tag - 100) {
                    label.textColor = [UIColor blackColor];
                }
                
            }
            
            btn.selected = NO;
            [btn setBackgroundColor:[UIColor whiteColor]];
        }
    }
    
    if (sender.selected) {
        
        for (UILabel *label in self.foodTypeLabel) {
            
            if (label.tag - 1000 == sender.tag - 100) {
                label.textColor = [UIColor whiteColor];
            }
        }

        [sender setBackgroundColor:[UIColor colorWithRed:41/255.0f green:65/255.0f blue:89/255.0f alpha:1]];
    }else{
        
        for (UILabel *label in self.foodTypeLabel) {
            
            if (label.tag - 1000 == sender.tag - 100) {
                label.textColor = [UIColor blackColor];
            }
            
        }
        
        [sender setBackgroundColor:[UIColor whiteColor]];
    }

}

static NSString *reuseID = @"foodCell";
- (void)setupCollectionView{
    

    self.foodCollectionView.delegate   = self;
    self.foodCollectionView.dataSource = self;
    
    self.foodCollectionView.showsVerticalScrollIndicator = NO;
    self.foodCollectionView.showsHorizontalScrollIndicator = NO;
    self.foodCollectionView.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.foodCollectionView.collectionViewLayout;

    flowLayout.minimumLineSpacing = 1;
    flowLayout.minimumInteritemSpacing = 1;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(135, 180);
    
    [self.foodCollectionView registerNib:[UINib nibWithNibName:@"FoodCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseID];
    
}

#pragma mark - collectionView代理


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    FoodCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.estimateSettingView.hidden = NO;

}


#pragma mark - 沽清设置界面


- (void)setupEstimateSettingView{
    
    self.estimateSettingView = [[NSBundle mainBundle] loadNibNamed:@"EstimateSettingView" owner:nil options:nil].firstObject;
    [self.estimateSettingView.sureBtn addTarget:self action:@selector(didClickSureBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.estimateSettingView.cancelBtn addTarget:self action:@selector(didClickCancelBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.estimateSettingView.pointBtn addTarget:self action:@selector(didClickPointBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.estimateSettingView.closeBtn addTarget:self action:@selector(didClickCloseEstimateSettingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.estimateSettingView.deleteBtn addTarget:self action:@selector(didClickDeleteBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    for (int i =0; i<self.estimateSettingView.keybordNumberBtn.count; i++) {
        
        UIButton *btn = self.estimateSettingView.keybordNumberBtn[i];
        btn.tag = i;
        [btn addTarget:self action:@selector(inputNum:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [KWindow addSubview:self.estimateSettingView];
    self.estimateSettingView.hidden = YES;
    
}

- (void)inputNum:(UIButton *)sender{
    
    
    if (self.estimateSettingView.numTextField.text.length > 0) {
        
         self.estimateSettingView.numTextField.text = [NSString stringWithFormat:@"%@%zd", self.estimateSettingView.numTextField.text,sender.tag];
    }else{
        
         self.estimateSettingView.numTextField.text = [NSString stringWithFormat:@"%zd",sender.tag];
    }
   
    
}
- (void)didClickCloseEstimateSettingView:(UIButton *)sender {
    
    NSLog(@"%s",__func__);
    
    self.estimateSettingView.hidden = YES;
}

- (void)didClickPointBtn:(UIButton *)sender {
        NSLog(@"%s",__func__);
}

- (void)didClickDeleteBtn:(UIButton *)sender {
    
    if (self.estimateSettingView.numTextField.text.length > 0) {
        
        self.estimateSettingView.numTextField.text = [self.estimateSettingView.numTextField.text substringToIndex:self.estimateSettingView.numTextField.text.length - 1];
    }
        NSLog(@"%s",__func__);
}

- (void)didClickSureBtn:(UIButton *)sender {
        NSLog(@"%s",__func__);
     self.estimateSettingView.hidden = YES;
}

- (void)didClickCancelBtn:(UIButton *)sender {
      NSLog(@"%s",__func__);
     self.estimateSettingView.hidden = YES;
}






@end
