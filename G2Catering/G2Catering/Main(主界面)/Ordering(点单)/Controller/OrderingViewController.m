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
#import "ShowGoodsView.h"
#import "DishTypeView.h"

#import "OpenTableAndTakeOutView.h"
#import "ZhifuView.h"
#import "ShowGoodsView.h"
#import "GoodsDataManager.h"
#import "GoodsType.h"
#import "GoodsTypeSuccess.h"
#import "GoodsCheckSuccess.h"
#import "ShoppingCartDataManager.h"
#import "ChangeGoodsNO.h"

#import "OrderDataManager.h"

static NSString *collectionViewCellIdentifer = @"OrderingCollectionViewReuseCell";
static NSString *tableViewCellIdentifer = @"OrderingTableViewReuseCell";


@interface OrderingViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,DishTypeViewDelegate>

@property (nonatomic,strong)NSArray*typeArray;

@property (nonatomic,strong)NSArray *allArray;                  // (全部)
@property (nonatomic,strong)NSArray *dataArray;                 // (界面全部显示)
@property (nonatomic,strong)NSMutableDictionary *resutlDict;    //（根据右侧热菜等选择）


@property (nonatomic,strong)NSMutableArray *allCaiArray;        // 添加的全部菜品
@property(nonatomic,strong)NSMutableArray *caiArray;            // 左侧菜品

@property (nonatomic,strong)ShowGoodsView *showGoodsView;

@property (weak, nonatomic) IBOutlet UIButton *placeOrderButton;
@property (weak, nonatomic) IBOutlet UIButton *checkButton;


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
    
    
    [self.firstView setCornerRadius:10 withBorderWidth:1 withBorderColor:RGB(0xc2, 0xc7, 0xcc)];
    [self.secondView setCornerRadius:10 withBorderWidth:1 withBorderColor:RGB(0xc2, 0xc7, 0xcc)];
    [self.orderCollectionView setCornerRadius:10 withBorderWidth:1 withBorderColor:RGB(0xc2, 0xc7, 0xcc)];
    [self.orderListView setCornerRadius:10 withBorderWidth:1 withBorderColor:RGB(0xc2, 0xc7, 0xcc)];
    
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
    [self.checkButton setCornerRadius:0 withBorderWidth:1.0 withBorderColor:RGB(0xc2, 0xc7, 0xcc)];
    
    GoodsType *goodsType = [[GoodsType alloc] initWithGoodContent:@""];
    [GoodsDataManager typeGoodsCheck:goodsType success:^(id response) {
        
        [self performSelectorOnMainThread:@selector(method:) withObject:response waitUntilDone:nil];
        
    } failure:^(NSError *error) {
        
    }];
    
//  categoryId 分类的
//  defaultId  商品id
    GoodsCheck *goodsModel = [[GoodsCheck alloc] initWithOrgId:@"1"];
    [GoodsDataManager goodsCheck:goodsModel success:^(id response) {
        
        self.allArray = response;
        self.dataArray = response;
        NSMutableDictionary *mutDic = [self transFormArrayToDictionary:response];
        self.resutlDict = mutDic;
        [self.orderCollectionView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
    self.allCaiArray = [NSMutableArray array];
}

-(void)method:(NSArray*)arree
{
    GoodsTypeSuccess *succ = [[GoodsTypeSuccess alloc] init];
    succ.categoryName = @"全部";
    NSMutableArray *mu = [NSMutableArray arrayWithObject:succ];
    [mu addObjectsFromArray:arree];
    self.typeArray = mu;
    self.dishTypeView.strArray = mu;
    self.dishTypeView.delegate = self;
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
    
    
    
    self.openTableAndTakeOutView = [[OpenTableAndTakeOutView alloc]initWithFrame:self.replacedView.frame];

    
    [self.view addSubview:self.openTableAndTakeOutView];
    
//    [self showHUDWithMessage:@"正在创建订单"];
//    
//    [OrderDataManager createOrderByCartId:@"4ed801703f6311e62ab838f5eb062502" success:^(id response) {
//        
//        
//        [self hideHUD];
//        
//        
//    } failure:^(NSError *error) {
//        
//    }];
    
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
    
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    OrderingCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifer forIndexPath:indexPath];
    GoodsCheckSuccess *goodsCheck = self.dataArray[indexPath.row];
    cell.dishName.text = goodsCheck.goodsDesc;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    GoodsCheckSuccess *succe = self.dataArray[indexPath.row];
    GoodsModel *goodsModel = [[GoodsModel alloc] initWithGoodId:succe.defaultId userId:@"15bfe9b03cfd11e66bd265bf3021409c"];
    [ShoppingCartDataManager addGoodToStore:goodsModel success:^(id response) {
        [self.allCaiArray addObject:succe];
        self.caiArray = [self transFormCaiArray:self.allCaiArray];
        [self.orderListTableView reloadData];
    } failure:^(NSError *error) {
    }];
    
}

#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.caiArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OrderingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellIdentifer];
    GoodsCheckSuccess *succMode = self.caiArray[indexPath.row][0];
    cell.dishPrice.text = succMode.goodsPrice;
    cell.dishName.text =succMode.goodsName;
    cell.dishNumberLabel.text = [NSString stringWithFormat:@"%zi",[self.caiArray[indexPath.row] count]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _showGoodsView=[[[NSBundle mainBundle]loadNibNamed:@"ShowGoodsView" owner:self options:nil]lastObject];
    _showGoodsView.goodSuccess = self.caiArray[indexPath.row][0];
    _showGoodsView.numberLabel.text = [NSString stringWithFormat:@"%zi",[self.caiArray[indexPath.row] count]];
    _showGoodsView.delegate = self;
    _showGoodsView.backgroundColor = [UIColor clearColor];
    [KWindow addSubview:_showGoodsView];
}

#pragma mark- 弹出视图DelegateMethod
-(void)btnDelegateName:(GoodsCheckSuccess *)goodCheck number:(int)number type:(int)type
{
    NSLog(@"%@",goodCheck.categoryId);
    NSLog(@"%@",goodCheck.defaultId);
    ChangeGoodsNO *changge = [[ChangeGoodsNO alloc] initWithGoodId:goodCheck.defaultId quantity:[NSString stringWithFormat:@"%d",number] state:@"0"];
    [ShoppingCartDataManager changgeGoods:changge success:^(id response) {
        NSLog(@"————%@",response);
//        [self removeSameObject:goodCheck];
//        for (int i = 0; i<number; i++) {
//            [self.allCaiArray addObject:changge];
//        }
//        self.caiArray = [self transFormCaiArray:self.allCaiArray];
//        [self.orderListTableView reloadData];
    } failure:^(NSError *error) {
//        [[UIAlertView alloc] initWithTitle:@"提示" message:@"" delegate:<#(nullable id)#> cancelButtonTitle:<#(nullable NSString *)#> otherButtonTitles:<#(nullable NSString *), ...#>, nil]
    }];
    [_showGoodsView removeFromSuperview];
}

#pragma mark- 右侧滑动菜单代理方法
- (void)DishTypeView:(DishTypeView *)dishTypeView didSelectItemAtIndex:(GoodsTypeSuccess *)index
{
    if ([index.categoryName isEqualToString:@"全部"]) {
        self.dataArray = self.allArray;
    }else{
        self.dataArray = self.resutlDict[index.defaultId];
    }
    [self.orderCollectionView reloadData];
   
}


#pragma mark- ToolMethod
-(NSMutableDictionary *)transFormArrayToDictionary:(NSMutableArray *)dataArray
{
    NSMutableArray *dateMutablearray =  [@[] mutableCopy];
    NSMutableArray *array = [NSMutableArray arrayWithArray:dataArray];
    
    for (int i = 0; i < array.count; i ++) {
        
        NSString *string = [(GoodsCheckSuccess *)array[i] categoryId];
        
        NSMutableArray *tempArray = [@[] mutableCopy];
        
        [tempArray addObject:array[i]];
        
        for (int j = i+1; j < array.count; j ++) {
            
            NSString *jstring = [(GoodsCheckSuccess *)array[j] categoryId];
            
            if([string isEqualToString:jstring]){
                
                [tempArray addObject:array[j]];
                [array removeObjectAtIndex:j];
                j = j-1;
            }
        }
        
        [dateMutablearray addObject:tempArray];
        
    }
    
    NSLog(@"dateMutable:%@",dateMutablearray);
    

    NSMutableDictionary *muta = [NSMutableDictionary dictionary];
    for (int i = 0; i<dateMutablearray.count; i++) {
        NSString *categoryId = [dateMutablearray[i][0] categoryId];
        [muta setValue:dateMutablearray[i] forKey:categoryId];
    }
    return muta;
}

-(NSMutableArray *)transFormCaiArray:(NSMutableArray *)dataArray
{
    NSMutableArray *dateMutablearray =  [@[] mutableCopy];
    NSMutableArray *array = [NSMutableArray arrayWithArray:dataArray];
    
    for (int i = 0; i < array.count; i ++) {
        
        NSString *string = [(GoodsCheckSuccess *)array[i] defaultId];
        
        NSMutableArray *tempArray = [@[] mutableCopy];
        
        [tempArray addObject:array[i]];
        
        for (int j = i+1; j < array.count; j ++) {
            
            NSString *jstring = [(GoodsCheckSuccess *)array[j] defaultId];
            
            if([string isEqualToString:jstring]){
                
                [tempArray addObject:array[j]];
                [array removeObjectAtIndex:j];
                j = j-1;
            }
        }
        
        [dateMutablearray addObject:tempArray];
        
    }
    return dateMutablearray;
}

-(void)removeSameObject:(GoodsCheckSuccess*)succ
{
    for (GoodsCheckSuccess *su2 in self.allCaiArray) {
        if (su2 == succ) {
            [self.allCaiArray removeObject:su2];
        }
    }
}

@end
