//
//  BookingManagerViewController.m
//  G2Catering
//
//  Created by NDlan on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "BookingManagerViewController.h"
#import "BookManagerTableViewCell.h"
#import "CancelBookView.h"
#import "AddBookView.h"
#import "TableCollectionViewCell.h"
#import "LM_datePickerView.h"
@interface BookingManagerViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, assign) NSInteger editState;

@property (nonatomic, strong) NSMutableArray *bookDataArray;

@property (nonatomic, strong) CancelBookView *cancelView;
@property (nonatomic, strong) AddBookView *addBookView;

@property (nonatomic, strong) NSString *leftViewStatus;

@property (nonatomic, strong) LM_datePickerView *datePickerView;
@end

@implementation BookingManagerViewController
static NSString *reuserID = @"bookCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backView.layer.cornerRadius  = 5;
    self.backView.layer.masksToBounds = YES;
    self.backView.layer.borderColor   = [UIColor lightGrayColor].CGColor;
    self.backView.layer.borderWidth   = 1;
    
    self.searchBackView.layer.borderColor   = [UIColor colorWithRed:42/255.0f green:66/255.0f blue:90/255.0f alpha:1].CGColor;
    self.searchBackView.layer.borderWidth   = 1;
    self.searchBackView.layer.cornerRadius  = 2;
    self.searchBackView.layer.masksToBounds = YES;
    
    self.bookTableView.delegate   = self;
    self.bookTableView.dataSource = self;
    [self.bookTableView registerNib:[UINib nibWithNibName:@"BookManagerTableViewCell" bundle:nil] forCellReuseIdentifier:reuserID];
    
    [self.addBtn addTarget:self action:@selector(didClickAddBtn) forControlEvents:UIControlEventTouchUpInside];
    self.bookDataArray = @[@1,@2,@3,@4,@5,@6].mutableCopy;
    
    [self setupCancelView];
    
    [self setupTableChooseView];
    
    [self setupLeftBookStatusView];
    
}

#pragma mark - tableView代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.bookDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    BookManagerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserID forIndexPath:indexPath];
    
    if (indexPath.row % 2 == 1) {
        cell.backgroundColor = [UIColor colorWithRed:248/255.0f green:251/255.0f blue:255/255.0f alpha:1];
    }else{
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}


- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *cancelBook = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"取消预定" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        NSLog(@"取消订单");
        
        self.cancelView.hidden = NO;
        
    }];
    
    cancelBook.backgroundColor = [UIColor colorWithRed:194/255.0f green:199/255.0f blue:203/255.0f alpha:1];
    UITableViewRowAction *order = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"   点餐   " handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        NSLog(@"去点餐");
    }];
    
    order.backgroundColor = [UIColor colorWithRed:42/255.0f green:66/255.0f blue:90/255.0f alpha:1];
    return @[order,cancelBook];
}

- (void)didClickAddBtn{
    
    
    [self setupAddBookView];
}


#pragma mark - setupDatePickerView

- (void)setupDatePickerView{
    
    self.addBookView.datePickerViewBackView.hidden = YES;
    self.addBookView.datePickerViewBackView.layer.cornerRadius  = 5;
    self.addBookView.datePickerViewBackView.layer.masksToBounds = YES;
    self.addBookView.datePickerViewBackView.layer.borderColor   = [UIColor lightGrayColor].CGColor;
    self.addBookView.datePickerViewBackView.layer.borderWidth   = 1;
    
    self.datePickerView = [[NSBundle mainBundle] loadNibNamed:@"LM_datePickerView" owner:nil options:nil].firstObject;
    [self.addBookView.datePickerViewBackView  addSubview:self.datePickerView];
    
    
    [self.datePickerView.sureBtn addTarget:self action:@selector(changeBookTime) forControlEvents:UIControlEventTouchUpInside];
    [self.datePickerView.cancelBtn addTarget:self action:@selector(cancelChangeBookTime) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)changeBookTime{
    
    [self.addBookView.bookTime setTitle:self.datePickerView.currentTime.text forState:UIControlStateNormal];
    self.addBookView.datePickerViewBackView.hidden = YES;
}

- (void)cancelChangeBookTime{
    self.addBookView.datePickerViewBackView.hidden = YES;
    
}
#pragma mark - setupAddBookView

- (void)setupAddBookView{
    
    self.addBookView = [[NSBundle mainBundle] loadNibNamed:@"AddBookView" owner:nil options:nil].firstObject;
    [self.addBookView.sureBtn addTarget:self action:@selector(didClickAddBookViewSureBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.addBookView.cancelBtn addTarget:self action:@selector(didClickAddBookViewCancelBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.addBookView.gentlemenBtn addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.addBookView.ladiesBtn addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.addBookView.hourBtn addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.addBookView.dayBtn addTarget:self action:@selector(chooseBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.addBookView.chooseTableBtn addTarget:self action:@selector(chooseTableNumBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.addBookView.bookTime addTarget:self action:@selector(didClickBookTime) forControlEvents:UIControlEventTouchUpInside];

    
    [self chooseBtn:self.addBookView.gentlemenBtn];
    [self chooseBtn:self.addBookView.hourBtn];
    
    
    [self.rightBackView addSubview:self.addBookView];
    self.addBookView.hidden = YES;
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.backView.transform = CGAffineTransformMakeTranslation(-347, 0);
        
        [self.view layoutIfNeeded];
        
    } completion:^(BOOL finished) {
        
        self.addBookView.hidden = NO;
        
    }];
    
    [self setupDatePickerView];
    
}
- (void)didClickAddBookViewSureBtn{
    
    
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.backView.transform = CGAffineTransformIdentity;

        
    } completion:^(BOOL finished) {
        
        self.addBookView.hidden = YES;
        
    }];
}

- (void)didClickAddBookViewCancelBtn{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.backView.transform = CGAffineTransformIdentity;
        
        
    } completion:^(BOOL finished) {
        
        self.addBookView.hidden = YES;
        
    }];
}


- (void)chooseBtn:(UIButton *)sender{
    
    sender.selected = YES;
    [sender setBackgroundColor:[UIColor colorWithRed:42/255.0f green:66/255.0f blue:90/255.0f alpha:1]];
    if (sender == self.addBookView.gentlemenBtn) {
        
        [self changeBtnStatus:self.addBookView.ladiesBtn];
        
    }else if (sender == self.addBookView.ladiesBtn){
        
        [self changeBtnStatus:self.addBookView.gentlemenBtn];
        
    }else if (sender == self.addBookView.hourBtn){
        
        [self changeBtnStatus:self.addBookView.dayBtn];
        
    }else if (sender == self.addBookView.dayBtn){
        
        [self changeBtnStatus:self.addBookView.hourBtn];
    }
    
}

- (void)changeBtnStatus:(UIButton *)sender{
    
    sender.selected = NO;
    [sender setBackgroundColor:[UIColor whiteColor]];
}


- (void)chooseTableNumBtn:(UIButton *)sender{
    
    
    self.tableChooseView.hidden = NO;
}

- (void)didClickBookTime{
    
  self.addBookView.datePickerViewBackView.hidden = NO;
    
    
}



#pragma mark - setupTableChooseView
static NSString *reuseID = @"tableItem";
- (void)setupTableChooseView{
    self.tableChooseView.hidden = YES;
    
    self.tableChooseView.layer.cornerRadius  = 5;
    self.tableChooseView.layer.masksToBounds = YES;
    self.tableChooseView.layer.borderColor   = [UIColor lightGrayColor].CGColor;
    self.tableChooseView.layer.borderWidth   = 1;
    
    for (int i = 0; i<self.tableTypeBtn.count; i++) {
        
        UIButton *btn = self.tableTypeBtn[i];
        btn.layer.cornerRadius  = 34;
        btn.layer.masksToBounds = YES;
        btn.layer.borderColor   = [UIColor lightGrayColor].CGColor;
        btn.layer.borderWidth   = 1;
        btn.tag = 10 + i;
        [btn addTarget:self action:@selector(didClickTableTypeBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    self.tableCollectionView.delegate   = self;
    self.tableCollectionView.dataSource = self;
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.tableCollectionView.collectionViewLayout;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(80, 72);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.tableCollectionView.showsVerticalScrollIndicator = NO;
    self.tableCollectionView.showsHorizontalScrollIndicator = NO;
    self.tableCollectionView.backgroundColor = [UIColor whiteColor];
    [self.tableCollectionView registerNib:[UINib nibWithNibName:@"TableCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseID];
    
//    self.tableChooseView.hidden = YES;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TableCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseID forIndexPath:indexPath];
    cell.selected = NO;

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
//    TableCollectionViewCell *cell = (TableCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    self.tableChooseView.hidden = YES;
    
    for (TableCollectionViewCell *cell in self.tableCollectionView.subviews) {
        
        NSIndexPath *indexPathCell = [collectionView indexPathForCell:cell];
        
        if (indexPathCell == indexPath) {
            
            [self.addBookView.chooseTableBtn setTitle:[NSString stringWithFormat:@"%@号桌台",cell.tableNum.text] forState:UIControlStateNormal];
            cell.selected = YES;
            cell.labelBackView.backgroundColor = [UIColor colorWithRed:42/255.0f green:66/255.0f blue:90/255.0f alpha:1];
            cell.tableNum.textColor = [UIColor whiteColor];
        }else{
            cell.selected = NO;
            cell.labelBackView.backgroundColor = [UIColor colorWithRed:194/255.0f green:199/255.0f blue:203/255.0f alpha:1];
            cell.tableNum.textColor = [UIColor blackColor];
            
        }

    }
    

    
}



- (void)didClickTableTypeBtn:(UIButton *)sender{
    
    for (UIButton *btn in self.tableTypeBtn) {
        
        if (btn == sender) {
            
            [btn setBackgroundColor:[UIColor colorWithRed:42/255.0f green:66/255.0f blue:90/255.0f alpha:1]];
            btn.selected = YES;
        }else{
            
            [btn setBackgroundColor:[UIColor whiteColor]];
            btn.selected = NO;
        }
    }
}

#pragma mark - setupLeftBookStatusView
- (void)setupLeftBookStatusView{
    
    self.bookTypeBackView.hidden = YES;
    self.leftViewStatus = @"close";
    [self.showAndCloseLeftBtn addTarget:self action:@selector(closeLeftBookStatusView) forControlEvents:UIControlEventTouchUpInside];
    
    for (int i = 0; i<self.bookStatusBtn.count; i++) {
        
        UIButton *btn = self.bookStatusBtn[i];
        btn.tag = 10000 + i;
        [btn addTarget:self action:@selector(didClickLeftMeunBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.selected = NO;
        
        if (i == 0) {
            
            [self didClickLeftMeunBtn:btn];
        }
    }
    
}


- (void)didClickLeftMeunBtn:(UIButton *)sender{
    
    for (UIButton *btn in self.bookStatusBtn) {
        
        if (btn == sender) {
            
            btn.selected = YES;
        }else{
            
            btn.selected = NO;
        }
    }
    
}



- (void)closeLeftBookStatusView{
    
    if ([self.leftViewStatus isEqualToString:@"close"]) {
        
        [UIView animateWithDuration:0.25 animations:^{
            self.backView.transform = CGAffineTransformMakeTranslation(230, 0);
            self.showAndCloseLeftBtn.selected = YES;
            self.leftViewStatus = @"open";
        } completion:^(BOOL finished) {
            self.bookTypeBackView.hidden = NO;
        }];

    }else{
        
        [UIView animateWithDuration:0.25 animations:^{
            self.bookTypeBackView.hidden = YES;
            self.showAndCloseLeftBtn.selected = NO;
            self.backView.transform = CGAffineTransformIdentity;
            self.leftViewStatus = @"close";
        }];
    }
    

    
}



#pragma mark - cancelView
- (void)setupCancelView{
    
    self.cancelView = [[NSBundle mainBundle] loadNibNamed:@"CancelBookView" owner:nil options:nil].firstObject;
    [self.cancelView.sureBtn addTarget:self action:@selector(didClickSureBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.cancelView.cancelBtn addTarget:self action:@selector(didClickCancelBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.cancelView];
    self.cancelView.hidden = YES;
    
}
- (void)didClickSureBtn{
    
    self.cancelView.hidden = YES;
}

- (void)didClickCancelBtn{
    
    self.cancelView.hidden = YES;
}

#pragma mark- lazy
- (NSMutableArray *)bookDataArray{
    
    if (!_bookDataArray) {
        
        _bookDataArray = [NSMutableArray arrayWithCapacity:10];
    }
    
    return _bookDataArray;
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
