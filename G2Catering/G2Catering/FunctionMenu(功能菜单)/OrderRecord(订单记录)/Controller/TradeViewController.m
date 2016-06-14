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
@interface TradeViewController ()<OriginalContentViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    
    BOOL isHidden;
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
    isHidden = YES;
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView  == _typeTable) {
        return 9;
    }else if (tableView == _historyTable){
        
        return 10;
    }
    return 0;
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
        static NSString *ID = @"MenuCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"全部";
                break;
            case 1:
                cell.textLabel.text = @"已下单";
                break;
            case 2:
                cell.textLabel.text = @"已结账";
                break;

            case 3:
                cell.textLabel.text = @"派送中";
                break;
             
            case 4:
                cell.textLabel.text = @"已撤单";
                break;
            case 5:
                cell.textLabel.text = @"堂食";
                break;
            case 6:
                cell.textLabel.text = @"外卖";
                break;
                
            case 7:
                cell.textLabel.text = @"外带";
                break;
            case 8:
                cell.textLabel.text = @"异常";
                break;
            default:
                break;
            
        }
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
