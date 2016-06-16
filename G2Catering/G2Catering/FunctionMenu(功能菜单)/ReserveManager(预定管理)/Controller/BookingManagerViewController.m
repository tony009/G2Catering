//
//  BookingManagerViewController.m
//  G2Catering
//
//  Created by NDlan on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "BookingManagerViewController.h"
#import "BookManagerTableViewCell.h"
@interface BookingManagerViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, assign) NSInteger editState;

@property (nonatomic, strong) NSMutableArray *bookDataArray;
@end

@implementation BookingManagerViewController
static NSString *reuserID = @"bookCell";
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.searchBackView.layer.borderColor   = [UIColor colorWithRed:42/255.0f green:66/255.0f blue:90/255.0f alpha:1].CGColor;
    self.searchBackView.layer.borderWidth   = 1;
    self.searchBackView.layer.cornerRadius  = 2;
    self.searchBackView.layer.masksToBounds = YES;
    
    self.bookTableView.delegate   = self;
    self.bookTableView.dataSource = self;
    [self.bookTableView registerNib:[UINib nibWithNibName:@"BookManagerTableViewCell" bundle:nil] forCellReuseIdentifier:reuserID];

    
    self.bookDataArray = @[@1,@2,@3,@4,@5,@6].mutableCopy;
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

    UITableViewRowAction *cancelBook = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"取消预订" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];

        [self.bookDataArray removeObject: self.bookDataArray[indexPath.row]];
        
        [tableView reloadData];
        
    }];

    cancelBook.backgroundColor = [UIColor colorWithRed:194/255.0f green:199/255.0f blue:203/255.0f alpha:1];
    UITableViewRowAction *order = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"   点餐   " handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        NSLog(@"去点餐");
    }];

    order.backgroundColor = [UIColor colorWithRed:42/255.0f green:66/255.0f blue:90/255.0f alpha:1];
    return @[order,cancelBook];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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
