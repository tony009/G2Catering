//
//  DinnerTableViewController.m
//  G2Catering
//
//  Created by wd on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//
#import "PanView.h"
#import "ShowMenuView.h"
#import "DinnerTableViewController.h"
#import "DeskCollectionViewCell.h"
#import "RightCollectionViewCell.h"
#import "LongPressView.h"
#import "WaiMaiTableViewCell.h"
#import "LockScreenView.h"
@interface DinnerTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,ShowMenuViewViewDelegate>
{
    NSArray *_array;
    ShowMenuView *_longView;
    NSArray *zhuoArray;
    DeskTableState deskState;
    NSMutableArray *arr2;
    NSInteger fromIndex;
    NSInteger endIndex;
    BOOL gestureSelectRight;
}

@end

@implementation DinnerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self _initCollectionView];
    _array = @[@"全部",@"小桌",@"中桌",@"大桌",@"H5",@"外卖",@"哈哈"];
    zhuoArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16"
                  ,@"17",@"18",@"19",@"20"];
    NSArray *arr = @[@"1",@"1",@"1",@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0"];
    arr2 = [NSMutableArray arrayWithArray:arr];
    
    
    
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

//    LockScreenView *lockView = [[LockScreenView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
//    [KWindow addSubview:lockView];
}

- (void)_initCollectionView
{
    deskState = DeskTableStateDefault;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.tag = 1001;
    
    
    
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longGesture.minimumPressDuration = 5.0;
    [self.collectionView addGestureRecognizer:longGesture];
    
    self.rightCollection.delegate = self;
    self.rightCollection.dataSource = self;
    self.rightCollection.backgroundColor = [UIColor clearColor];
    self.rightCollection.tag = 1002;
    
    //注册单元格
    
    [self.collectionView registerNib:[UINib nibWithNibName: @"DeskCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DeskCollectionViewCellww"];
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
    
        DeskCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DeskCollectionViewCellww" forIndexPath:indexPath];
        UIPanGestureRecognizer *panRight = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(p_swipeRight:)];
        [cell addGestureRecognizer:panRight];
         cell.addressLabel.text = @"";
        
//        if (indexPath.row == 1) {
//            
//            cell.imgView.image = [UIImage imageNamed:@"空台背景"];
//            if (deskState == DeskTableStateRevert) {
//               cell.imgView.image = [UIImage imageNamed:@"7584682.jpg"];
//            }
//            cell.baiLabel.text = @"";
//            cell.shiLabel.text = @"";
//            cell.geLabel.text = @"";
//            cell.addressLabel.text = @"阳光兴源";
//           
//        }else if (indexPath.row == 2) {
//            
//            cell.imgView.image = [UIImage imageNamed:@"10分钟背景"];
//            if (deskState == DeskTableStateRevert) {
//                cell.imgView.image = [UIImage imageNamed:@"7584682.jpg"];
//            }
//            cell.baiLabel.text = @"";
//            cell.shiLabel.text = @"1";
//            cell.geLabel.text = @"0";
//        }else if (indexPath.row == 3) {
//            
//            cell.imgView.image = [UIImage imageNamed:@"60分钟背景"];
//            if (deskState == DeskTableStateRevert) {
//                cell.imgView.image = [UIImage imageNamed:@"7584682.jpg"];
//            }
//            cell.baiLabel.text = @"";
//            cell.shiLabel.text = @"6";
//            cell.geLabel.text = @"0";
//            cell.nameLabel.textColor = [UIColor blueColor];;
//        }else if (indexPath.row == 4) {
//            
//            cell.imgView.image = [UIImage imageNamed:@"预定背景"];
//            if (deskState == DeskTableStateRevert) {
//                cell.imgView.image = [UIImage imageNamed:@"7584682.jpg"];
//            }
//            cell.baiLabel.text = @"";
//            cell.shiLabel.text = @"";
//            cell.geLabel.text = @"";
//        }else{
//            if (deskState == DeskTableStateCombin) {
//                cell.imgView.image = [UIImage imageNamed:@"7584682.jpg"];
//            }
//        }
//        
//        cell.priceLabel.text = @"12元";
//        cell.nameLabel.text = zhuoArray[indexPath.row];
        
        if ([arr2[indexPath.row] isEqualToString:@"0"]) {
            cell.imgView.image = [UIImage imageNamed:@"空台背景"];
            if (deskState == DeskTableStateCombin) {
                cell.imgView.image = [UIImage imageNamed:@"7584682.jpg"];
              }
        }else{
            cell.imgView.image = [UIImage imageNamed:@"60分钟背景"];
            if (deskState == DeskTableStateRevert) {
                cell.imgView.image = [UIImage imageNamed:@"7584682.jpg"];
            }
        }
        cell.priceLabel.text = @"12元";
        cell.nameLabel.text = zhuoArray[indexPath.row];
        
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
        
        fromIndex = indexPath.row;
        endIndex = 0;
        _longView = [[ShowMenuView alloc] initWithFrame:self.view.bounds];
        _longView.delegate = self;
        [_longView setPoint:point cllFrame:cell.frame];
        _longView.backgroundColor = RGB(71, 71, 71);
        _longView.alpha = 0.7;

        [self.view.window addSubview:_longView];
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
        
      DeskCollectionViewCell *cell = (DeskCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        if (deskState == DeskTableStateRevert) {
            if ([cell.imgView.image isEqual:[UIImage imageNamed:@"7584682.jpg"]]) {
                [[[UIAlertView alloc] initWithTitle:@"提示" message:@" 已经有人了" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
            }else{
                endIndex = indexPath.row;
                [arr2 replaceObjectAtIndex:endIndex withObject:@"1"];
                [arr2 replaceObjectAtIndex:fromIndex withObject:@"0"];
                [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"换到第%@桌",zhuoArray[indexPath.row]] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
                deskState = DeskTableStateDefault;
                [self.collectionView reloadData];
            }
        }
        if (deskState == DeskTableStateCombin) {
            if ([cell.imgView.image isEqual:[UIImage imageNamed:@"7584682.jpg"]]) {
                [[[UIAlertView alloc] initWithTitle:@"提示" message:@"该位置没有人合并不了" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
                return;
            }else{
                if (fromIndex ==indexPath.row) {
                    
                    [[[UIAlertView alloc] initWithTitle:@"提示" message:@"不能和自己并桌" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
                    return;
                }
                [arr2 replaceObjectAtIndex:fromIndex withObject:@"0"];
                [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"第%@桌和第%@桌并桌了",zhuoArray[fromIndex],zhuoArray[indexPath.row]] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
                deskState = DeskTableStateDefault;
                [self.collectionView reloadData];
            }
        }
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
#pragma mark- Delegate方法
-(void)btnDelegateMethod:(UIButton *)btn
{
    switch (btn.tag-99) {
        case 1:
            NSLog(@"第一个按钮");
            deskState = DeskTableStateRevert;
            
            break;
        case 2:
            NSLog(@"第二个按钮");
            break;
        case 3:
            NSLog(@"第三个按钮");
            break;
        case 4:
            deskState = DeskTableStateCombin;
            
            NSLog(@"第四个按钮");
            break;
        default:
            break;
    }
    [_longView removeFromSuperview];
    [self changgeDeskTable];
}

-(void)changgeDeskTable
{
    [self.collectionView reloadData];
}

-(void)p_swipeRight:(UIPanGestureRecognizer *)gesture{
    
    
    PanView *vi = [[PanView alloc] init];
    
    
    if (gesture.state != UIGestureRecognizerStateEnded && gesture.state != UIGestureRecognizerStateFailed){
        CGPoint point = [gesture locationInView:self.collectionView];
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
        
        DeskCollectionViewCell *cell = (DeskCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
            //通过使用 locationInView 这个方法,来获取到手势的坐标
        
        if (![self.view.subviews containsObject:vi]) {
            [self.view addSubview:vi];
            NSLog(@"121212");
        }
        vi.frame = cell.frame;
//        NSLog(@"__vi__%@",vi);
        UIView *vi2 = gesture.view;
//        vi.backgroundColor = [UIColor redColor];
        CGPoint location = [gesture locationInView:gesture.view.superview];
        vi.center = location;
    }
    
    
//    if (gesture.state == UIGestureRecognizerStateBegan) {
//        CGPoint point = [gesture locationInView:self.collectionView];
//        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
//        
//        DeskCollectionViewCell *cell = (DeskCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
//        if (![cell.imgView.image isEqual:[UIImage imageNamed:@"空台背景"]]) {
//            
//        }
//        
//        fromIndex = indexPath.row;
//        endIndex = 0;
//        _longView = [[ShowMenuView alloc] initWithFrame:self.view.bounds];
//        _longView.delegate = self;
//        [_longView setPoint:point cllFrame:cell.frame];
//        _longView.backgroundColor = RGB(71, 71, 71);
//        _longView.alpha = 0.7;
//        
//        [self.view.window addSubview:_longView];
//    }
}

//- (void) handlePanGestures:(UIPanGestureRecognizer*)paramSender{
//    
//}
#pragma mark- 点击方法
- (IBAction)searchBtnAction:(id)sender {
    
    self.searchTextField.hidden = !self.searchTextField.hidden;
}


- (UIView*)duplicate:(UIView*)view
{
    NSData * tempArchive = [NSKeyedArchiver archivedDataWithRootObject:view];
    return [NSKeyedUnarchiver unarchiveObjectWithData:tempArchive];
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
