//
//  JiaoYiJiLuViewController.m
//  G2TestDemo
//
//  Created by lcc on 15/8/17.
//  Copyright (c) 2015年 ws. All rights reserved.
//

#import "JiaoYiJiLuViewController.h"
//#import "ZhiFuViewController.h"
//#import "SaveOrderViewController.h"
//#import "HttpTool.h"
//#import "MJExtension.h"
//#import "JiaoYiPG.h"
#import "JiaoYiJiLuCell.h"
#import "TradeContentView.h"
////#import "MJRefresh.h"
//#import "OriginalContentView.h"
//#import "MBProgressHUD.h"
//#import "ZhiFuChuanDiPG.h"
//#import "FSCalendar.h"
//#import "NSDate+FSExtension.h"




@interface JiaoYiJiLuViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
    BOOL isHidden;
}

@property (weak, nonatomic) IBOutlet UIButton *riliNoOne;
@property (weak, nonatomic) IBOutlet UIButton *riliNoTwo;
@property (weak, nonatomic) IBOutlet UITextField *riliOne;
@property (weak, nonatomic) IBOutlet UIView *bigView;
//
@property (weak, nonatomic) IBOutlet UITextField *riliTwo;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITableView *jiluTableView;
//
@property (weak, nonatomic) IBOutlet UIView *contentView;


@property (nonatomic, strong) TradeContentView *originalVc;

@property (nonatomic, strong) UIButton *coverView;





@end

@implementation JiaoYiJiLuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.tag = 1;
    
    self.jiluTableView.delegate = self;
    self.jiluTableView.dataSource = self;
    self.jiluTableView.tableFooterView = [[UIView alloc] init];
    self.jiluTableView.tag = 2;
    self.jiluTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    
//    self.jintian.layer.cornerRadius = 15;
//    self.jintian.layer.masksToBounds = YES;
//    
//    self.jinqitian.layer.cornerRadius = 15;
//    self.jinqitian.layer.masksToBounds = YES;
    
//    [self jintian:nil];
    
    [self setUpOriginalView];
//周双注释 原因: 数据重复
//    [self requestMore];
//    self.jiluTableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(requestMore)];
    
//    self.maskScreen = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 624, self.view.height)];
//    self.maskScreen.backgroundColor = [UIColor blackColor];
//    self.maskScreen.alpha = 0.4;
//    self.maskScreen.hidden = YES;
//    [self.view addSubview:self.maskScreen];


}
//- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
//    
//    
//  
//}


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
    
    TradeContentView *originalV = [[TradeContentView alloc] init];
    originalV.frame = CGRectMake(KScreenWidth - koriginalWidth, 0, koriginalWidth, KScreenHeight);
    self.originalVc = originalV;
    self.coverView.hidden = YES;
//    originalV.delegate = self;
    [self.view addSubview:originalV];
}
- (void)hideOriginalContentView{
    
    [self.originalVc removeFromSuperview];
}

- (void)coverViewChick{
    self.coverView.hidden = YES;

    [self hideOriginalContentView];
    isHidden = YES;

    
}

#pragma mark - tableView的数据源和代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 1) {
        return 7;
    }else if (tableView.tag == 2){
        
        return 10;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (tableView.tag == 1) {
        static NSString *ID = @"MenuCell";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        
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
                //王洪昌  扯淡没有做 2015 11 25
            case 3:
                cell.textLabel.text = @"撤单";
                break;
//            case 4:
//                cell.textLabel.text = @"已并台";
//                break;
            case 4:
                cell.textLabel.text = @"派送中";
                break;
            case 5:
                cell.textLabel.text = @"外卖单";
                break;
            //zlh 增加已清台模块
            case 6:
                cell.textLabel.text = @"已清台";
                break;
                //end
//            case 7:
//                cell.textLabel.text = @"外带";
//                break;
                
            default:
                break;
        }
        return cell;

    }else if (tableView.tag == 2){
        
        static NSString *ID = @"MenuCell";
        
        JiaoYiJiLuCell *cell1 = [tableView dequeueReusableCellWithIdentifier:ID];
        if (cell1 == nil) {
            NSArray *nibArr = [[NSBundle mainBundle] loadNibNamed:@"JiaoYiJiLuCell" owner:nil options:nil];
            cell1 = [nibArr lastObject];
        }
//        if (indexPath.row % 2) {
//            cell1.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
//        }
//        JiaoYiPG *jiaoyipg = self.jiluArr[indexPath.row];
//        cell1.pg = jiaoyipg;
        
        return cell1;
    }
    
    return nil;
}

//-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//    
//    //按照作者最后的意思还要加上下面这一段，才能做到底部线控制位置，所以这里按stackflow上的做法添加上吧。
//    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
//        [cell setPreservesSuperviewLayoutMargins:NO];
//        
//        
//    }
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
//    
//    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
//    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    
    
//    if (tableView.tag == 1) {
//        if (indexPath.row == 0) {
//            //全部
//            NSString *urlStr = [NSString stringWithFormat:@"%@&billStatus=",self.RiQiUrlStr];
//            
//            NSLog(@"%@",urlStr);
//            cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
//            
//            cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:78/255.0 green:152/255.0 blue:226/255.0 alpha:1 ];
//            cell.textLabel.highlightedTextColor=[UIColor whiteColor];
//
//            self.statusUrlStr = urlStr;
//            [self requestJiLuWithUrl:urlStr];
//        }else if (indexPath.row == 1){
//            /**
//             *  已下单的url
//             */
//            NSString *urlStr = [NSString stringWithFormat:@"%@&billStatus=2",self.RiQiUrlStr];
//            
//            NSLog(@"%@",urlStr);
//            self.statusUrlStr = urlStr;
//            cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
//            cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:78/255.0 green:152/255.0 blue:226/255.0 alpha:1 ];
//            cell.textLabel.highlightedTextColor=[UIColor whiteColor];
//
//            [self requestJiLuWithUrl:urlStr];
//        }else if (indexPath.row == 2){
//            /**
//             * 已结账url
//             */
//            NSString *urlStr = [NSString stringWithFormat:@"%@&billStatus=3",self.RiQiUrlStr];
//            NSLog(@"%@",urlStr);
//            
//            self.statusUrlStr = urlStr;
//            [self requestJiLuWithUrl:urlStr];
//            cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
//            cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:78/255.0 green:152/255.0 blue:226/255.0 alpha:1 ];
//            cell.textLabel.highlightedTextColor=[UIColor whiteColor];
//            
//            [self requestJiLuWithUrl:urlStr];
//
//        }else if (indexPath.row == 3){
//            
////            /**
////             *  外卖单
////             */
////            NSString *urlStr = [NSString stringWithFormat:@"%@&billType=2",self.RiQiUrlStr];
////            self.statusUrlStr = urlStr;
////            [self requestJiLuWithUrl:urlStr];
////            cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
////            cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:78/255.0 green:152/255.0 blue:226/255.0 alpha:1 ];
////            cell.textLabel.highlightedTextColor=[UIColor whiteColor];
//            
//
//            //撤单没做  WHC 2015 11 25
//            /**
//             *  撤单url
//             */
//            NSString *urlStr = [NSString stringWithFormat:@"%@&billStatus=8",self.RiQiUrlStr];
//            self.statusUrlStr = urlStr;
//            [self requestJiLuWithUrl:urlStr];
//            cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
//            cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:78/255.0 green:152/255.0 blue:226/255.0 alpha:1 ];
//            cell.textLabel.highlightedTextColor=[UIColor whiteColor];
//        }
//
////        }else if (indexPath.row == 4){
//            /**
//             *  已并台
//             */
////            NSString *urlStr = [NSString stringWithFormat:@"%@&billStatus=10",self.RiQiUrlStr];
////            self.statusUrlStr = urlStr;
////            [self requestJiLuWithUrl:urlStr];
////            cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
////            cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:78/255.0 green:152/255.0 blue:226/255.0 alpha:1 ];
////            cell.textLabel.highlightedTextColor=[UIColor whiteColor];
//
//    // }
//    else if (indexPath.row == 4){
//        // 派送未做
//            /**
//             *  派送中
//             */
//            NSString *urlStr = [NSString stringWithFormat:@"%@&billStatus=11",self.RiQiUrlStr];
//            self.statusUrlStr = urlStr;
//            [self requestJiLuWithUrl:urlStr];
//            cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
//            cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:78/255.0 green:152/255.0 blue:226/255.0 alpha:1 ];
//            cell.textLabel.highlightedTextColor=[UIColor whiteColor];
//
//    }else if (indexPath.row == 5){
//        /**
//         *  外卖单     
//         */
//        NSString *urlStr = [NSString stringWithFormat:@"%@&billType=2",self.RiQiUrlStr];
//        self.statusUrlStr = urlStr;
//        [self requestJiLuWithUrl:urlStr];
//        cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
//        cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:78/255.0 green:152/255.0 blue:226/255.0 alpha:1 ];
//        cell.textLabel.highlightedTextColor=[UIColor whiteColor];
//        
//    }else if (indexPath.row == 6){
//        // zlh  增加已清台模块
//        /**
//         *  已清台
//         */
// #warning  提醒修改
//        NSString *urlStr = [NSString stringWithFormat:@"%@&billStatus=12",self.RiQiUrlStr];
//        self.statusUrlStr = urlStr;
//        [self requestJiLuWithUrl:urlStr];
//        cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
//        cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:78/255.0 green:152/255.0 blue:226/255.0 alpha:1 ];
//        cell.textLabel.highlightedTextColor=[UIColor whiteColor];
//        
//    }
//        }
//        else if (indexPath.row == 7){
//            /**
//             *  外带
//             */
//            NSString *urlStr = [NSString stringWithFormat:@"%@&billType=4",self.RiQiUrlStr];
//            self.statusUrlStr = urlStr;
//            [self requestJiLuWithUrl:urlStr];
//            cell.selectedBackgroundView = [[UIView alloc]initWithFrame:cell.frame];
//            cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:78/255.0 green:152/255.0 blue:226/255.0 alpha:1 ];
//            cell.textLabel.highlightedTextColor=[UIColor whiteColor];
//
//        }
//
    if (tableView.tag == 1) {
        
         NSLog(@"13e3");
    }
    
    else if (tableView.tag == 2)
    {
        
        if (isHidden) {

            [self showOriginalContentView];
//            JiaoYiPG *jiaoyiPg = self.jiluArr[indexPath.row];
//            self.originalVc.jiaoyiPG = jiaoyiPg;
            self.coverView.hidden = NO;
            isHidden = NO;

        }else{
//            self.originalVc.hidden = YES;
            [self hideOriginalContentView];
            self.coverView.hidden = YES;
            isHidden = YES;
      }
    }
}




#pragma mark - OriginalContentView的代理方法

#pragma mark - 弹出等待窗口


@end
