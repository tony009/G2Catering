//
//  DinnerTableViewController.m
//  G2Catering
//
//  Created by wd on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "DinnerTableViewController.h"
#import "DeskCollectionViewCell.h"
#import "RightCollectionViewCell.h"
#import "LongPressView.h"
#import "WaiMaiTableViewCell.h"
@interface DinnerTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_array;
    LongPressView *_longView;
}

@end

@implementation DinnerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self _initCollectionView];
    _array = @[@"全部",@"小桌",@"中桌",@"大桌",@"H5",@"外卖",@"哈哈"];
    self.searchTextField.layer.cornerRadius = 10;
    self.searchTextField.layer.masksToBounds = YES;
    self.searchTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.searchTextField.layer.borderWidth = 1;
    
    self.waiMaiView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.waiMaiView.layer.borderWidth = 1;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 313;
    [_tableView registerNib:[UINib nibWithNibName:@"WaiMaiTableViewCell" bundle:nil] forCellReuseIdentifier:@"WaiMaiTableViewCell"];

}

- (void)_initCollectionView
{
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.tag = 1001;
    
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longGesture.minimumPressDuration = 1.0;
    [self.collectionView addGestureRecognizer:longGesture];
    
    self.rightCollection.delegate = self;
    self.rightCollection.dataSource = self;
    self.rightCollection.backgroundColor = [UIColor clearColor];
    self.rightCollection.tag = 1002;
    
    //注册单元格
    
    [self.collectionView registerNib:[UINib nibWithNibName: @"DeskCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DeskCollectionViewCell"];
     [self.rightCollection registerNib:[UINib nibWithNibName: @"RightCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"RightCollectionViewCell"];
   }



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (collectionView.tag == 1001) {
    
        return 20;
    }else{
        
        return 7;
    }
    
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    if (collectionView.tag == 1001) {
    
        DeskCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DeskCollectionViewCell" forIndexPath:indexPath];
        
         cell.addressLabel.text = @"";
        if (indexPath.row == 1) {
            
            cell.imgView.image = [UIImage imageNamed:@"空台背景"];
            cell.baiLabel.text = @"";
            cell.shiLabel.text = @"";
            cell.geLabel.text = @"";
            cell.addressLabel.text = @"阳光兴源";
           
        }else if (indexPath.row == 2) {
            
            cell.imgView.image = [UIImage imageNamed:@"10分钟背景"];
            cell.baiLabel.text = @"";
            cell.shiLabel.text = @"1";
            cell.geLabel.text = @"0";
        }else if (indexPath.row == 3) {
            
            cell.imgView.image = [UIImage imageNamed:@"60分钟背景"];
            cell.baiLabel.text = @"";
            cell.shiLabel.text = @"6";
            cell.geLabel.text = @"0";
            cell.nameLabel.textColor = [UIColor blueColor];;
        }else if (indexPath.row == 4) {
            
            cell.imgView.image = [UIImage imageNamed:@"预定背景"];
            cell.baiLabel.text = @"";
            cell.shiLabel.text = @"";
            cell.geLabel.text = @"";
        }
        
        cell.priceLabel.text = @"12";
        cell.nameLabel.text = @"haha";
        
        
        return cell;
    }else{

        RightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RightCollectionViewCell" forIndexPath:indexPath];
        cell.nameLabel.text = _array[indexPath.row];

        return cell;

    }
    
}

- (void)longPressAction:(UILongPressGestureRecognizer *)gesture{
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [gesture locationInView:self.collectionView];
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
        
        DeskCollectionViewCell *cell = (DeskCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        
         _longView=[[[NSBundle mainBundle]loadNibNamed:@"LongPressView" owner:self options:nil]lastObject];
//         _longView.changeView.center = point;
        [_longView setPoint:point];
        [self.view addSubview:_longView];
        
       
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
     if (collectionView.tag == 1001) {

        return CGSizeMake(156,134);
         
     }else{
         
         return CGSizeMake(56,89);
     }
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0,0, 0);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView.tag == 1001 ) {
        
      
        self.view.frame = CGRectMake(-338, 0, 1362, 768);
       
    }else{
        
        RightCollectionViewCell *cell = (RightCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        
//        cell.backImgView.image = [UIImage imageNamed:@"点击菜品"];

    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 13;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WaiMaiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WaiMaiTableViewCell" forIndexPath:indexPath];
    cell.numLabel.text = @"002";
    return cell;

}
- (IBAction)searchBtnAction:(id)sender {
    
    self.searchTextField.hidden = !self.searchTextField.hidden;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
