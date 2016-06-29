    //
    //  DinnerTableViewController.m
    //  G2Catering
    //
    //  Created by wd on 16/6/14.
    //  Copyright © 2016年 NDL. All rights reserved.
    //

#import "DeskCollectionController.h"
#import "DeskCollectionTableViewCell.h"
#import "UpCollectionViewCell.h"
#import "LongPressView.h"
#import "WaiMaiTableViewCell.h"
#import "LockScreenView.h"
@interface DeskCollectionController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,LongPressViewDelegate>
{
    NSArray *_array;
    LongPressView *_longView;
}

@end

@implementation DeskCollectionController

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view from its nib.
    [self _initCollectionView];
    _array = @[@"全部",@"小",@"中",@"大",@"包",@"H5",@"外卖"];
    self.searchTextField.layer.cornerRadius = 10;
    self.searchTextField.layer.masksToBounds = YES;
    self.searchTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.searchTextField.layer.borderWidth = 1;
    
    
        //    self.waiMaiView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        //    self.waiMaiView.layer.borderWidth = 1;
        //
        //    self.tableView.delegate = self;
        //    self.tableView.dataSource = self;
        //    self.tableView.rowHeight = 313;
        //    [_tableView registerNib:[UINib nibWithNibName:@"WaiMaiTableViewCell" bundle:nil] forCellReuseIdentifier:@"WaiMaiTableViewCell"];
    
        //    LockScreenView *lockView = [[LockScreenView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
        //    [KWindow addSubview:lockView];
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
    
    [self.collectionView registerNib:[UINib nibWithNibName: @"DeskCollectionTableViewCell" bundle:nil] forCellWithReuseIdentifier:@"DeskCollectionTableViewCell"];
    [self.rightCollection registerNib:[UINib nibWithNibName: @"UpCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"UpCollectionViewCell"];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (collectionView.tag == 1001) {
        
        return 50;
    }else{
        
        return 7;
    }
    
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    if (collectionView.tag == 1001) {
        
        DeskCollectionTableViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DeskCollectionTableViewCell" forIndexPath:indexPath];
        
            //        cell.addressLabel.text = @"";
            //        if (indexPath.row == 1) {
            //
            //            cell.imgView.image = [UIImage imageNamed:@"空台背景"];
            //            cell.baiLabel.text = @"";
            //            cell.shiLabel.text = @"";
            //            cell.geLabel.text = @"";
            ////            cell.addressLabel.text = @"阳光兴源";
            //
            //        }else if (indexPath.row == 2) {
            //
            //            cell.imgView.image = [UIImage imageNamed:@"10分钟背景"];
            //            cell.baiLabel.text = @"";
            //            cell.shiLabel.text = @"1";
            //            cell.geLabel.text = @"0";
            //        }else if (indexPath.row == 3) {
            //
            //            cell.imgView.image = [UIImage imageNamed:@"60分钟背景"];
            //            cell.baiLabel.text = @"";
            //            cell.shiLabel.text = @"6";
            //            cell.geLabel.text = @"0";
            //            cell.nameLabel.textColor = [UIColor blueColor];;
            //        }else if (indexPath.row == 4) {
            //
            //            cell.imgView.image = [UIImage imageNamed:@"预定背景"];
            //            cell.baiLabel.text = @"";
            //            cell.shiLabel.text = @"";
            //            cell.geLabel.text = @"";
            //        }
        
        cell.priceLabel.text = @"1212元";
        cell.nameLabel.text = @"01";
        
        
        return cell;
    }else{
        
        UpCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UpCollectionViewCell" forIndexPath:indexPath];
        cell.nameLabel.text = _array[indexPath.row];
        
        return cell;
        
    }
    
}

- (void)longPressAction:(UILongPressGestureRecognizer *)gesture{
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [gesture locationInView:self.collectionView];
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
        
        DeskCollectionTableViewCell *cell = (DeskCollectionTableViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        
//        UIView *bgView = [[UIView alloc] init];
//        bgView.alpha = 0.75;
//        bgView.frame = self.view.frame;
//        [self.view addSubview:bgView];
        
        _longView=[[[NSBundle mainBundle]loadNibNamed:@"LongPressView" owner:self options:nil]lastObject];
        _longView.delegate = self;
        [_longView setPoint:point];
//        _longView.alpha = 0.75;
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
        
        
            //        self.view.frame = CGRectMake(-338, 0, 1362, 768);
        
    }else{
        
        UpCollectionViewCell *cell = (UpCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        
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
#pragma mark- Delegate方法
-(void)btnDelegateMethod:(UIButton *)btn
{
    switch (btn.tag) {
        case 1:
            NSLog(@"第一个按钮");
            break;
        case 2:
            NSLog(@"第二个按钮");
            break;
        case 3:
            NSLog(@"第三个按钮");
            break;
        case 4:
            NSLog(@"第四个按钮");
            break;
        default:
            break;
    }
    [_longView.superview removeFromSuperview];
}

#pragma mark- 点击方法
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
