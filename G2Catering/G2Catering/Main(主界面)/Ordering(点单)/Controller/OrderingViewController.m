//
//  OrderingViewController.m
//  G2Catering
//
//  Created by wd on 16/6/12.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "OrderingViewController.h"
#import "OrderingCollectionViewCell.h"
#import "OrderingTableViewCell.h"

#import "DishTypeView.h"

#import "OpenTableAndTakeOutView.h"
#import "ZhifuView.h"
static NSString *collectionViewCellIdentifer = @"OrderingCollectionViewReuseCell";
static NSString *tableViewCellIdentifer = @"OrderingTableViewReuseCell";


@interface OrderingViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>


@property (weak, nonatomic) IBOutlet UIButton *placeOrderButton;
@property (weak, nonatomic) IBOutlet UIButton *jiezhangButton;


@property (weak, nonatomic) IBOutlet UIView *buttonView; //

@property (weak, nonatomic) IBOutlet UITableView *orderListTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *orderCollectionView;


@property (weak, nonatomic) IBOutlet UIView *orderListView;



@property (weak, nonatomic) IBOutlet UIView *replacedView;

@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet DishTypeView *dishTypeView;

@property (strong,nonatomic) OpenTableAndTakeOutView *openTableAndTakeOutView;

@end

@implementation OrderingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self p_initViews];
}

-(void)p_initViews{

    UINib *nib = [UINib nibWithNibName:@"OrderingCollectionViewCell" bundle:nil];
    
    [self.orderCollectionView registerNib:nib forCellWithReuseIdentifier:collectionViewCellIdentifer];
    
    UINib *nib2 = [UINib nibWithNibName:@"OrderingTableViewCell" bundle:nil];
    
    [self.orderListTableView registerNib:nib2 forCellReuseIdentifier:tableViewCellIdentifer];
    
    
    self.firstView.layer.borderWidth = 1;
    self.secondView.layer.borderWidth = 1;
    self.orderCollectionView.layer.borderWidth =1;
    self.orderListView.layer.borderWidth = 1;
    
    self.firstView.layer.borderColor = [UIColor grayColor].CGColor;
    self.secondView.layer.borderColor = [UIColor grayColor].CGColor;
    self.orderCollectionView.layer.borderColor = [UIColor grayColor].CGColor;
    self.orderListView.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.firstView.layer.cornerRadius = 10;
    self.secondView.layer.cornerRadius = 10;
    self.orderCollectionView.layer.cornerRadius = 10;
    self.orderListView.layer.cornerRadius = 10;
    
    //
    self.orderCollectionView.showsVerticalScrollIndicator = NO;
    self.orderCollectionView.showsHorizontalScrollIndicator = NO;
    self.orderCollectionView.backgroundColor = [UIColor whiteColor];
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.orderCollectionView.collectionViewLayout;
    
    flowLayout.minimumLineSpacing = 1;
    flowLayout.minimumInteritemSpacing = 1;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.itemSize = CGSizeMake(155, 180);
    
    //
    
    [self.placeOrderButton setCornerRadius:0 withBorderWidth:1.0 withBorderColor:RGB(0xc2, 0xc7, 0xcc)];
    [self.jiezhangButton setCornerRadius:0 withBorderWidth:1.0 withBorderColor:RGB(0xc2, 0xc7, 0xcc)];
    
    self.dishTypeView.strArray = @[@"全部",@"热菜",@"甜菜",@"主食",@"凉菜",@"酒水",@"特价"];
    
    

}


- (IBAction)orderFuncAction:(UIButton *)sender {
    
    self.buttonView.hidden = !self.buttonView.hidden;
    
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
}


- (IBAction)jieZhang:(UIButton *)sender {
    
    ZhifuView *view = [[[NSBundle mainBundle]loadNibNamed:@"ZhifuView" owner:self options:nil]lastObject];
    
    NSString *subString = _moneyLabel.text ;
    view.price = [subString doubleValue];
    
    view.isYu = YES;
    view.frame = CGRectMake(0,0, 696, 720);
    [self.replacedView addSubview:view];
}


- (IBAction)placeOrderAction:(UIButton *)sender {
    
    
//    self.openTableAndTakeOutView = [[[NSBundle mainBundle]loadNibNamed:@"OpenTableAndTakeOutView" owner:nil options:nil] firstObject];
    
    self.openTableAndTakeOutView = [[OpenTableAndTakeOutView alloc]initWithFrame:self.replacedView.frame];

    
    [self.view addSubview:self.openTableAndTakeOutView];
    
    
    
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
#pragma mark --UICollectionViewDataSource


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 30;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    OrderingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifer forIndexPath:indexPath];

    return cell;
}


#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OrderingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifer];
    cell.dishPrice.text = @"￥100";
    cell.dishName.text = @"五彩三丝";
    
    return cell;
}

@end
