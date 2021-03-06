//
//  DinnerTableViewController.m
//  G2Catering
//
//  Created by wd on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//
#import <Masonry/Masonry.h>
#import "PanView.h"
#import "ShowMenuView.h"
#import "DinnerTableViewController.h"
#import "DeskCollectionViewCell.h"
#import "RightCollectionViewCell.h"
#import "LongPressView.h"
#import "WaiMaiTableViewCell.h"
#import "LockScreenView.h"
#import "OrderPerson.h"
#import "DishTypeView.h"
@interface DinnerTableViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,ShowMenuViewViewDelegate,DishTypeViewDelegate,UIAlertViewDelegate>
{
    NSArray *_array;
    
    ShowMenuView *_longView;       //长按展示四个按钮
    DeskTableState deskState;      //四个状态：拼桌，并单，计算，打印
    NSMutableArray *arr2;          //所有桌位中，消费和未消费的状态
    NSInteger fromIndex;           //拼桌，并卓等的起始桌子
    NSInteger endIndex;            //拼桌，并卓等的结束桌子

    PanView *panView;              //拼桌  隐藏view
    CGPoint middlePoint2;          //查看 手势的位置
    NSMutableArray *dataTableArray;//存储所有桌子的数组名字 （1，1-1，2-1，3等）
    NSArray *resultAAray;          //记住所有桌子的所有状态（未分桌的，和分卓的都有）
    
//  换桌
    NSString *biginHuan;           //桌子的名字
    NSString *endHuan;             //结束后桌子的名字
//  并桌
    NSString *beginBing;           //桌子开始的名字
    NSString *endBing;             //桌子结束的名字
    
    DeskState deskTypeState;       //选择大桌，小桌，中桌，大桌，外卖等
    
//  存储外卖的相关信息
    NSMutableArray *orderDataArray;  //  外卖数组
    

    UIAlertView *bingAlert;          //  并桌Alert
    UIAlertView *huanAlert;          //  换桌Alert
    
}

@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UIView *threeView;
@property (weak, nonatomic) IBOutlet DishTypeView *dishTypeView;

@end

@implementation DinnerTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self _initCollectionView];
    
    self.firstView.layer.borderWidth = 1;
    self.secondView.layer.borderWidth = 1;
    self.threeView.layer.borderWidth = 1;
    self.searchBtn.layer.borderWidth = 1;
    
    self.firstView.layer.borderColor = [UIColor grayColor].CGColor;
    self.secondView.layer.borderColor = [UIColor grayColor].CGColor;
    self.threeView.layer.borderColor = [UIColor grayColor].CGColor;
    self.searchBtn.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.firstView.layer.cornerRadius = 10;
    self.secondView.layer.cornerRadius = 10;
    self.threeView.layer.cornerRadius = 10;
    self.searchBtn.layer.cornerRadius = 5;
    

//    searchBtn
    
    _array = @[@"全部",@"小桌",@"中桌",@"大桌",@"外卖"];
    
//  显示桌子，1 有桌子，0为 还没桌子
    NSArray *pinArray = @[@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0"];
    NSMutableArray *mutablePinArray = [NSMutableArray arrayWithArray:pinArray];
    resultAAray = @[[mutablePinArray mutableCopy],[mutablePinArray mutableCopy],[mutablePinArray mutableCopy],
                    [mutablePinArray mutableCopy],[mutablePinArray mutableCopy],
                    [mutablePinArray mutableCopy],[mutablePinArray mutableCopy],[mutablePinArray mutableCopy],
                    [mutablePinArray mutableCopy],[mutablePinArray mutableCopy]];
    [self caculationNumbers:resultAAray];
    
    
//  这里是所有消费的，1为有人消费，0 为没人消费
    NSArray *arr = @[@"1",@"1",@"1",@"1",@"1",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0",@"0"];
    arr2 = [NSMutableArray arrayWithArray:arr];
    
    
//  外卖相关
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@[@"lichen",@"11元",@"地址"],@[@"a",@"b",@"c"], nil];
    OrderPerson *order = [[OrderPerson alloc] initWithdict:dic];
    orderDataArray = [NSMutableArray arrayWithObjects:order,order,order,order,order, nil];
    
    
    self.waiMaiView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.waiMaiView.layer.borderWidth = 1;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 313;
    [_tableView registerNib:[UINib nibWithNibName:@"WaiMaiTableViewCell" bundle:nil] forCellReuseIdentifier:@"WaiMaiTableViewCell"];

//    LockScreenView *lockView = [[LockScreenView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
//    [KWindow addSubview:lockView];
    self.dishTypeView.strArray = _array;
    self.dishTypeView.delegate = self;
//    [self.dishTypeView setSelectIndex:0];
    

}

- (void)_initCollectionView
{
    deskState = DeskTableStateDefault;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    self.collectionView.layer.cornerRadius = 10;
    self.collectionView.layer.masksToBounds = YES;
    self.collectionView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.collectionView.layer.borderWidth = 1;
    self.collectionView.tag = 1001;
    
    
    
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    longGesture.minimumPressDuration = 1.0;
    [self.collectionView addGestureRecognizer:longGesture];
    
    self.rightCollection.delegate = self;
    self.rightCollection.dataSource = self;
    self.rightCollection.backgroundColor = [UIColor clearColor];
    self.rightCollection.tag = 1002;
    
    //注册单元格
    
    [self.collectionView registerNib:[UINib nibWithNibName: @"DeskCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DeskCollectionViewCellwaimai"];
    
    [self.collectionView registerNib:[UINib nibWithNibName: @"DeskCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"DeskCollectionViewCellww"];
    
     [self.rightCollection registerNib:[UINib nibWithNibName: @"RightCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"RightCollectionViewCell"];
   }



#pragma mark- UICollection Delegate 相关方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
        if (deskTypeState != DeskStateOther) {
            return dataTableArray.count;
        }else{
            return orderDataArray.count;
        }
    
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
//    DeskCollectionViewCellwaimai
    if (collectionView.tag == 1001) {
     if (deskTypeState != DeskStateOther) {
        DeskCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DeskCollectionViewCellww" forIndexPath:indexPath];
       
            UIPanGestureRecognizer *panRight = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(p_swipeRight:)];
            [cell addGestureRecognizer:panRight];
            cell.addressLabel.text = @"";
            
            if ([arr2[indexPath.row] isEqualToString:@"0"]) {
                cell.imgView.image = [UIImage imageNamed:@"空台背景"];
                 [cell removeGestureRecognizer:panRight];
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
         
         DeskCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DeskCollectionViewCellwaimai" forIndexPath:indexPath];

         cell.addressLabel.text = @"南庭新苑北区";
         cell.imgView.image = [UIImage imageNamed:@"60分钟背景"];
         cell.priceLabel.text = [orderDataArray[indexPath.row] orderMoney];
         cell.nameLabel.text = [orderDataArray[indexPath.row] orderName];
         
         return cell;
     }
        
        
        
    }else{

        RightCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RightCollectionViewCell" forIndexPath:indexPath];
        cell.nameLabel.text = _array[indexPath.row];

        return cell;

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
    
    return 15;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 25;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(26, 17,0, 17);
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
                
                bingAlert = [[UIAlertView alloc] initWithTitle:@"确定换桌" message:[NSString stringWithFormat:@"确定将%@换到第%@桌?\n(操作后不可撤销)",biginHuan,cell.nameLabel.text] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil] ;
                [bingAlert show];
                
           
                
//                [self revertNewArray:biginHuan endIndexz:endHuan];
//                [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"换到第%@桌",cell.nameLabel.text] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
//                deskState = DeskTableStateDefault;
//                [self.collectionView reloadData];
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
                
                endBing = cell.nameLabel.text;
                huanAlert = [[UIAlertView alloc] initWithTitle:@"确定并桌" message:[NSString stringWithFormat:@"确定将%@桌并到%@桌?\n(操作后订单合并且不可以撤销)",beginBing,endBing] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil] ;
                [huanAlert show];
                
                
//                [arr2 replaceObjectAtIndex:fromIndex withObject:@"0"];
//                [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:@"第%@桌和第%@桌并桌了",beginBing,endBing] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
//                deskState = DeskTableStateDefault;
//                [self.collectionView reloadData];
            }
        }
    }else{
        
//        RightCollectionViewCell *cell = (RightCollectionViewCell *)[self.rightCollection cellForItemAtIndexPath:indexPath];
//        
//        cell.backImgView.backgroundColor = RGB(0x2a, 0x42, 0x5a);
        
        
        
    }
}

#pragma mark- TableView delegate 方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 13;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WaiMaiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WaiMaiTableViewCell" forIndexPath:indexPath];
    cell.numLabel.text = @"002";
    return cell;
    
}

#pragma mark- AlertDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if ([alertView isEqual:bingAlert]&&buttonIndex==1) {
        [self revertNewArray:biginHuan endIndexz:endHuan];
        deskState = DeskTableStateDefault;
        [self.collectionView reloadData];
    }
    if ([alertView isEqual:huanAlert]&&buttonIndex==1) {
        [arr2 replaceObjectAtIndex:fromIndex withObject:@"0"];
        deskState = DeskTableStateDefault;
        [self.collectionView reloadData];
    }
    
}

#pragma mark-  Method
#pragma mark-  长按方法
- (void)longPressAction:(UILongPressGestureRecognizer *)gesture{
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [gesture locationInView:self.collectionView];
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:point];
        
        DeskCollectionViewCell *cell = (DeskCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
        
        if ([arr2[indexPath.row] isEqualToString:@"0"]) {
            [[[UIAlertView alloc] initWithTitle:@"提示" message:@"该桌为空，不能进行任何操作" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
            return;
        }
        beginBing = cell.nameLabel.text;
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


#pragma mark- Delegate方法
-(void)btnDelegateMethod:(UIButton *)btn deskName:(NSString *)deskName
{
    if (deskTypeState == DeskStateAll) {
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
    }else{
        
        [UIView animateWithDuration:0.7 animations:^{
            self.view.frame = CGRectMake(-338, 0, 1362, 768);
        }];
        
        [_longView removeFromSuperview];
    }
}

#pragma mark- 右侧选择菜单
- (void)DishTypeView:(DishTypeView *)dishTypeView didSelectItemAtIndex:(NSInteger)index
{
    if (deskTypeState == DeskStateOther) {
        [UIView animateWithDuration:0.7 animations:^{
            self.view.frame = CGRectMake(0, 0, 1362, 768);
        }];
    }
    switch (index) {
        case 0:
            deskTypeState = DeskStateAll;
            break;
        case 1:
            deskTypeState = DeskStateSmall;
            break;
        case 2:
            deskTypeState = DeskStateMiddle;
            break;
        case 3:
            deskTypeState = DeskStateBig;
            break;
        case 4:
            deskTypeState = DeskStateOther;
            break;

    }
    
    [self.collectionView reloadData];
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
        panView = [[PanView alloc] initWithFrame:cll.frame withTitle:cll.nameLabel.text];
        panView.alpha = 0.5;
        panView.center = middlePoint;
        middlePoint2 = middlePoint;
        [self.view addSubview:panView];
        
        
//      临时餐桌不可以创建
        if ([self contarinString:dataTableArray[indexPath.row]]) {
            [panView removeFromSuperview];
            [[[UIAlertView alloc] initWithTitle:@"提示" message:@"临时餐桌无法创建拼桌" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
            return;
        }
//      创建10个餐桌之后，不可以创建
        if ([self createNewOrNot:cll.nameLabel.text].length>0) {
            [panView removeFromSuperview];
            [[[UIAlertView alloc] initWithTitle:@"提示" message:@"最多仅可以创建10台拼桌" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
            return;
        }
        
//      当前桌子为空，就不可以创建
        
        
        [self caculationNewArray:[cll.nameLabel.text intValue] view:panView];
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


#pragma mark- 拼桌是否已经拼了10个了
-(NSString *)createNewOrNot:(NSString *)ind
{
//  用户滑动了 非cell端
    if (!ind) {
        return @"滑动位置不对";
    }
    
//  判断是否有10个
    NSMutableArray *mutable = resultAAray[[ind intValue]-1];
    NSMutableArray *mut = [NSMutableArray array];
    for (int i = 0; i<[mutable count]; i++) {
        if ([mutable[i] isEqualToString:@"1"]) {
            [mut addObject:@"ss"];
        }
    }
    
    
    if (mut.count == 10) {
        return @"当前拼桌已满";
    }else{
        return @"";
    }
    
}

#pragma mark- 创建新桌（拼桌）
-(void)caculationNewArray:(int)changgeIndex view:(UIView* )shoView
{
//  判断如果有客人，
    NSMutableArray *resu = [NSMutableArray array];
    for (int i = 0; i<changgeIndex; i++) {
        NSMutableArray *mutable22 = resultAAray[i];
        for (int j = 0; j<[mutable22 count]; j++) {
            if ([mutable22[j] isEqualToString:@"1"]) {
                [resu addObject:@"ddd"];
            }
        }
    }
    
    if ([[arr2 objectAtIndex:resu.count] isEqualToString:@"0"]) {
        [[[UIAlertView alloc] initWithTitle:@"提示" message:@"该桌暂时没有客人，无法进行拼桌" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil] show];
        [shoView removeFromSuperview];
        return;
    }
    
    
    NSMutableArray *mutable = resultAAray[changgeIndex-1];
    for (int i = 0; i<[mutable count]; i++) {
        if ([mutable[i] isEqualToString:@"0"]) {
            NSLog(@"%d---%d",changgeIndex,i);
            [mutable replaceObjectAtIndex:i withObject:@"1"];
            [arr2 insertObject:@"1" atIndex:changgeIndex+i];
            break;
        }
    }

}
#pragma mark- 换桌
-(void)revertNewArray:(NSString*)fromIndexName endIndexz:(NSString*)endIndexName
{
//    resultAAray
//    如果当前桌是拼桌，
//    换到别的桌之后，
//    本桌子直接干掉
    if ([self contarinString:fromIndexName]) {
        int begin = [[fromIndexName componentsSeparatedByString:@"-"][0] intValue];
        int end = [[fromIndexName componentsSeparatedByString:@"-"][1] intValue];
        NSMutableArray *mutable = resultAAray[begin -1];
        [mutable replaceObjectAtIndex:end withObject:@"0"];
        [self caculationNumbers:resultAAray];
        if (fromIndex<endIndex) {
                [arr2 replaceObjectAtIndex:fromIndex withObject:@"0"];
                [arr2 replaceObjectAtIndex:endIndex-1 withObject:@"1"];
            
        }else{
            
        }
    }else{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSMutableArray *mutabl = [NSMutableArray array];
            for (int i =0; i<[fromIndexName intValue]; i++) {
                NSMutableArray *muarr = resultAAray[i];
                for (int j=0; j<[muarr count]; j++) {
                    if ([muarr[j] isEqualToString:@"1"]) {
                       [mutabl addObject:[NSString stringWithFormat:@"%d",i+1]];
                        if ([fromIndexName intValue]==1) {
                            break;
                        }
                    }
                }
            }

            
            NSMutableArray *mutablEnd = [NSMutableArray array];
            for (int i =0; i<[endIndexName intValue]-1; i++) {
                NSMutableArray *muarr = resultAAray[i];
                for (int j=0; j<[muarr count]; j++) {
                    if ([muarr[j] isEqualToString:@"1"]) {
                        [mutablEnd addObject:[NSString stringWithFormat:@"%d",i+1]];
                    }
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [arr2 replaceObjectAtIndex:[mutabl count]-1 withObject:@"0"];
                [arr2 replaceObjectAtIndex:[mutablEnd count] withObject:@"1"];
                [self.collectionView reloadData];
            });
        });
    }
    
}

#pragma mark- 结账后的桌
-(void)removeDesk:(NSString *)nameString
{
//    干掉拼桌后的桌子
    if ([self contarinString:nameString]) {
        
        int begin = [[nameString componentsSeparatedByString:@"-"][0] intValue];
        int end = [[nameString componentsSeparatedByString:@"-"][1] intValue];
        NSMutableArray *mutable = resultAAray[begin -1];
        [mutable replaceObjectAtIndex:end withObject:@"0"];
        
        [arr2 removeObjectAtIndex:begin-1+end];
        
        [self caculationNumbers:resultAAray];
    }else{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSMutableArray *mutabl = [NSMutableArray array];
            for (int i =0; i<[nameString intValue]-1; i++) {
                NSMutableArray *muarr = resultAAray[i];
                for (int j=0; j<[muarr count]; j++) {
                    if ([muarr[j] isEqualToString:@"1"]) {
                        [mutabl addObject:[NSString stringWithFormat:@"00"]];
                    }
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [arr2 replaceObjectAtIndex:[mutabl count] withObject:@"0"];
                [self.collectionView reloadData];
            });
        });
    }
    return;
}

#pragma mark- 并桌
-(void)bingZhuo
{
    if ([self contarinString:beginBing]) {
        int begin = [[beginBing componentsSeparatedByString:@"-"][0] intValue];
        int end = [[beginBing componentsSeparatedByString:@"-"][1] intValue];
        NSMutableArray *mutable = resultAAray[begin -1];
        [mutable replaceObjectAtIndex:end withObject:@"0"];
        
        [arr2 removeObjectAtIndex:begin-1+end];
        
        [self caculationNumbers:resultAAray];
    }else{
    
    }
    
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

#pragma mark- 拼桌
-(void)addQuanxianWithLabel:(UIView *)label {
    UILabel *xian = [UILabel new];
    xian.backgroundColor = [UIColor redColor];
    [label addSubview:xian];
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.top.equalTo(label.mas_top).offset(1);
        make.height.equalTo(@1);
    }];
}


@end
