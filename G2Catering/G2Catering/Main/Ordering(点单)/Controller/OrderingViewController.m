//
//  OrderingViewController.m
//  G2Catering
//
//  Created by wd on 16/6/12.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "OrderingViewController.h"
#import "MainBottomView.h"

static NSString *collectionViewCellIdentifer = @"OrderingCollectionViewReuseCell";
static NSString *tableViewCellIdentifer = @"OrderingTableViewReuseCell";


@interface OrderingViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *orderListTableView;
@property (weak, nonatomic) IBOutlet UICollectionView *orderCollectionView;

@end

@implementation OrderingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    [self p_initViews];
}

-(void)p_initViews{
 
    
    MainBottomView *view  =  [[[NSBundle mainBundle] loadNibNamed:@"MainBottomView" owner:self options:nil]lastObject];
    
    view.backgroundColor = [UIColor redColor];
    
    view.frame = CGRectMake(0, 700, 1024, 68);
    
    [self.view addSubview:view];
    
    UINib *nib = [UINib nibWithNibName:@"OrderingCollectionViewCell" bundle:nil];
    
    [self.orderCollectionView registerNib:nib forCellWithReuseIdentifier:collectionViewCellIdentifer];
    
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

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 11;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewCellIdentifer forIndexPath:indexPath];
    
    return cell;
}


#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderingCollectionViewCell"];
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}

@end
