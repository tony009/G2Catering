//
//  TradeViewController.m
//  G2Catering
//
//  Created by iOS  on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "TradeViewController.h"
#import "TradeContentView.h"
#import "MJExtension.h"
#import "JiaoYiJiLuCell.h"
#import "TypeTableViewCell.h"
@interface TradeViewController ()<OriginalContentViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    BOOL isHidden;
    NSMutableArray *_groupArray;
     NSMutableArray *_subArray;
    NSMutableArray *_imageArray;
    NSMutableArray *_selectedImage;
}
@property (nonatomic, strong) TradeContentView *originalVc;

@property (nonatomic, strong) UIButton *coverView;
@end

@implementation TradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpOriginalView];
   
    [self.historyTable registerNib:[UINib nibWithNibName:@"JiaoYiJiLuCell" bundle:nil ] forCellReuseIdentifier:@"History"];
    self.historyTable.dataSource = self;
    self.historyTable.delegate = self;
    self.historyTable.tag = 202;
    self.typeTable.dataSource =self;
    self.typeTable.delegate = self;
    self.typeTable.tag = 201;
   [self.typeTable registerNib:[UINib nibWithNibName:@"TypeTableViewCell" bundle:nil ] forCellReuseIdentifier:@"TypeTableViewCell"];
    isHidden = YES;
    
    _groupArray= [NSMutableArray arrayWithArray:@[@"全部",@"堂食",@"外卖",@"外带",@"异常"]];
    _subArray = [NSMutableArray arrayWithArray:@[@"已下单",@"已结账",@"派送中",@"已撤单"]];
    //默认状态下
    _imageArray = [NSMutableArray arrayWithArray:@[@"交易记录－全部-点击",@"交易记录－堂食",@"交易记录－外卖",@"交易记录－外带",@"交易记录－异常"]];
     _selectedImage = [NSMutableArray arrayWithArray:@[@"交易记录－全部",@"交易记录－堂食-点击",@"交易记录－外卖-点击",@"交易记录－外带-点击",@"交易记录－异常-点击"]];
    [self.imgView setImage:[UIImage imageNamed:@"BG"]];
}


- (void)setUpOriginalView{
    
    UIButton *coverView = [[UIButton alloc] initWithFrame:self.view.bounds];
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.1;
    [coverView addTarget:self action:@selector(coverViewChick) forControlEvents:UIControlEventTouchUpInside];
    coverView.hidden = YES;
    coverView.frame = CGRectMake(0, 0, KScreenWidth - koriginalWidth, CGRectGetHeight(self.view.frame));
    _coverView = coverView;
    [self.view addSubview:coverView];
    
    
  
    
    
}
- (void)showOriginalContentView{
    
    TradeContentView *originalV = [[[NSBundle mainBundle]loadNibNamed:@"TradeContentView" owner:nil options:nil]lastObject ];
    originalV.frame = CGRectMake(KScreenWidth - koriginalWidth, 0, koriginalWidth, KScreenHeight);
    self.originalVc = originalV;
//    self.coverView.hidden = YES;
    originalV.delegate = self;
    [self.view addSubview:originalV];
}
//
//
- (void)hideOriginalContentView{
    
    [self.originalVc removeFromSuperview];
}
//
- (void)coverViewChick{
    self.coverView.hidden = YES;

    [self hideOriginalContentView];
    isHidden = YES;
}


#pragma mark - tableView的数据源和代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView  == _typeTable) {
        return _groupArray.count;
    }else    return 1;
    
    
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 200, 40)];
    [button setTitle:_groupArray[section] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(groupAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:_imageArray[section]] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:_selectedImage[section]] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor colorWithRed:143/255.0 green:159/255.0 blue:175/255.0 alpha:1] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    button.backgroundColor = [UIColor clearColor] ;
    return button;
    
    
}
- (void)groupAction:(UIButton *)btn{
    btn.selected = !btn.selected;
     NSLog(@"sgfhjk");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView  == _typeTable) {
       
        if(section == 0){
            
            return _subArray.count;
            
        }else
            return  0;
    }else if (tableView == _historyTable){
        
        return 10;
    }
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (tableView == _typeTable) {
         return  50;
    }
    else return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _typeTable) {
         return  75;
    }
    else  return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView == _typeTable) {
        TypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TypeTableViewCell" forIndexPath:indexPath];
        if (indexPath.section == 0) {
            
            [cell.titleBtn setTitle:_subArray[indexPath.row] forState:UIControlStateNormal];
            
          
        }
//
//        static NSString *ID = @"MenuCell";
//        
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//        if (cell == nil) {
//            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
//        }
//        cell.textLabel.textColor = [UIColor whiteColor];
//        cell.backgroundColor = [UIColor clearColor];
//        cell.textLabel.textAlignment = NSTextAlignmentCenter;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        switch (indexPath.row) {
//            case 0:
//                cell.textLabel.text = @"全部";
//                
//                break;
//            case 1:
//                cell.textLabel.text = @"已下单";
//                break;
//            case 2:
//                cell.textLabel.text = @"已结账";
//                break;
//
//            case 3:
//                cell.textLabel.text = @"派送中";
//                break;
//             
//            case 4:
//                cell.textLabel.text = @"已撤单";
//                break;
//            case 5:
//                cell.textLabel.text = @"堂食";
//                break;
//            case 6:
//                cell.textLabel.text = @"外卖";
//                break;
//                
//            case 7:
//                cell.textLabel.text = @"外带";
//                break;
//            case 8:
//                cell.textLabel.text = @"异常";
//                break;
//            default:
//                break;
        
//        }
        return cell;
        
    }else if (tableView == _historyTable){
        
        static NSString *ID = @"History";
        
        JiaoYiJiLuCell *cell1 = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell1 == nil) {
            NSArray *nibArr = [[NSBundle mainBundle] loadNibNamed:@"JiaoYiJiLuCell" owner:nil options:nil];
            cell1 = [nibArr lastObject];
        }
        if (indexPath.row % 2) {
            cell1.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
        }
        
        return cell1;
    }
    
    return nil;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _typeTable ) {
        
        
    }else if(tableView == _historyTable ){

            if (isHidden) {
        
                [self showOriginalContentView];
        //        JiaoYiPG *jiaoyiPg = self.jiluArr[indexPath.row];
        //        self.originalVc.jiaoyiPG = jiaoyiPg;
                self.coverView.hidden = NO;
                isHidden = NO;
            }else{
        
                [self hideOriginalContentView];
                self.coverView.hidden = YES;
                isHidden = YES;
              
            }
        
    }
    
   


    
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
