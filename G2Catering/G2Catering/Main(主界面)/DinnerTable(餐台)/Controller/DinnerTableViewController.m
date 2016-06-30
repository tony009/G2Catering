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
    PanView *panView;
    CGPoint middlePoint2;
    NSMutableArray *dataTableArray;
    NSArray *resultAAray;
    
//  换桌
    NSString *biginHuan;
    NSString *endHuan;
}

@end

@implementation DinnerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self _initCollectionView];
    _array = @[@"全部",@"小桌",@"中桌",@"大桌",@"H5",@"外卖",@"哈哈"];
    
//  显示桌子，1 有桌子，0为 还没桌子
    NSArray *pinArray = @[@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0"];
    NSMutableArray *mutablePinArray = [NSMutableArray arrayWithArray:pinArray];
    resultAAray = @[[mutablePinArray mutableCopy],[mutablePinArray mutableCopy],[mutablePinArray mutableCopy],
                    [mutablePinArray mutableCopy],[mutablePinArray mutableCopy],
                    [mutablePinArray mutableCopy],[mutablePinArray mutableCopy],[mutablePinArray mutableCopy],
                    [mutablePinArray mutableCopy],[mutablePinArray mutableCopy]];
    [self caculationNumbers:resultAAray];
    
    zhuoArray = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16"
                  ,@"17",@"18",@"19",@"20"];
    
//    这里是所有消费的，1为有人消费，0 为没人消费
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
    longGesture.minimumPressDuration = 1.0;
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
        
        return dataTableArray.count;
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
        cell.nameLabel.text = dataTableArray[indexPath.row];
        if ([self contarinString:dataTableArray[indexPath.row]]) {
            [cell removeGestureRecognizer:panRight];
        }
        
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
        _longView.deskName = cell.nameLabel.text;
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
                endHuan = cell.nameLabel.text;
                endIndex = indexPath.row;
                

                [self revertNewArray:biginHuan endIndexz:endHuan];
                [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"换到第%@桌",cell.nameLabel.text] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
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
        
        RightCollectionViewCell *cell = (RightCollectionViewCell *)[self.rightCollection cellForItemAtIndexPath:indexPath];

        cell.backImgView.backgroundColor = RGB(0x2a, 0x42, 0x5a);

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
-(void)btnDelegateMethod:(UIButton *)btn deskName:(NSString *)deskName
{
    switch (btn.tag-99) {
        case 1:
            biginHuan = deskName;
            deskState = DeskTableStateRevert;
            break;
        case 2:
            NSLog(@"第二个按钮");
            
            break;
        case 3:
            [self removeDesk:deskName];
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
    
    CGPoint point = [gesture locationInView:self.collectionView];
    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
    DeskCollectionViewCell *cll = (DeskCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    CGPoint middlePoint = CGPointMake(69+cll.frame.origin.x+cll.frame.size.width/2, cll.frame.origin.y+66+cll.frame.size.height/2);
    if (gesture.state == UIGestureRecognizerStateBegan) {
        DeskCollectionViewCell *cll = (DeskCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        panView = [[PanView alloc] init];
        panView.frame = cll.frame;
        panView.center = middlePoint;
        middlePoint2 = middlePoint;
        [self.view addSubview:panView];
        [self caculationNewArray:[cll.nameLabel.text intValue]];
    }
    
    if (gesture.state ==UIGestureRecognizerStateChanged) {
        
        CGPoint location = [gesture locationInView:gesture.view.superview];
        CGFloat xMargin;
        if (location.x<middlePoint2.x) {
            xMargin = middlePoint2.x;
        }else{
            xMargin = location.x;
        }
        panView.center = CGPointMake(xMargin, middlePoint2.y);
    }
    if (gesture.state ==UIGestureRecognizerStateEnded) {
        [panView removeFromSuperview];
        [self caculationNumbers:resultAAray];
    }

}

#pragma mark- 点击方法
- (IBAction)searchBtnAction:(id)sender {
    
    self.searchTextField.hidden = !self.searchTextField.hidden;
}

#pragma mark- 计算相关拼桌
-(void)caculationNumbers:(NSArray *)dataArray
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSMutableArray *mutabl = [NSMutableArray array];
        for (int i =0; i<dataArray.count; i++) {
            NSMutableArray *muarr = dataArray[i];
            for (int j=0; j<[dataArray[i] count]; j++) {
                if ([muarr[j] isEqualToString:@"1"]) {
                    if (j==0) {
                        [mutabl addObject:[NSString stringWithFormat:@"%d",i+1]];
                    }else{
                        [mutabl addObject:[NSString stringWithFormat:@"%d-%d",i+1,j]];
                    }
                }
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            dataTableArray = mutabl;
            
            [self.collectionView reloadData];
        });
    });
}
#pragma mark- 创建新桌（拼桌）
-(void)caculationNewArray:(int)changgeIndex
{
    NSMutableArray *mutable = resultAAray[changgeIndex-1];
    for (int i = 0; i<[mutable count]; i++) {
        if ([mutable[i] isEqualToString:@"0"]) {
            [mutable replaceObjectAtIndex:i withObject:@"1"];
            [arr2 insertObject:@"0" atIndex:changgeIndex];
            break;
        }
    }
}
#pragma mark- 换桌
-(void)revertNewArray:(NSString*)fromIndexz endIndexz:(NSString*)endIndexz
{
//  如果含有杠杠  （干掉这个桌）
    if ([self contarinString:fromIndexz]) {
        int begin = [[fromIndexz componentsSeparatedByString:@"-"][0] intValue];
        int end = [[fromIndexz componentsSeparatedByString:@"-"][1] intValue];
        NSMutableArray *mutable = resultAAray[begin -1];
        [mutable replaceObjectAtIndex:end withObject:@"0"];
        [self caculationNumbers:resultAAray];
        if (fromIndex<endIndex) {
                [arr2 replaceObjectAtIndex:fromIndex withObject:@"0"];
                [arr2 replaceObjectAtIndex:endIndex-1 withObject:@"1"];
            
        }else{
            
        }
  }
}

#pragma mark- 结账后的桌
-(void)removeDesk:(NSString *)nameString
{
    if ([self contarinString:nameString]) {
        int begin = [[nameString componentsSeparatedByString:@"-"][0] intValue];
        int end = [[nameString componentsSeparatedByString:@"-"][1] intValue];
        NSMutableArray *mutable = resultAAray[begin -1];
        [mutable replaceObjectAtIndex:end withObject:@"0"];
        [self caculationNumbers:resultAAray];
    }
    return;
}

-(BOOL)contarinString:(NSString *)string
{
    //字条串是否包含有某字符串
    if ([string rangeOfString:@"-"].location == NSNotFound) {
        return NO;
    } else {
        return YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
