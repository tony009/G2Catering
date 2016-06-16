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
#import "FSCalendar.h"
#import "NSDate+FSExtension.h"
#import "CheDanView.h"
@interface TradeViewController ()<TradeContentViewDelegate,UITableViewDataSource,UITableViewDelegate,FSCalendarDataSource,FSCalendarDelegate,CheDanViewDelegate>{
    
    BOOL isHidden;
    NSMutableArray *_groupArray;
     NSMutableArray *_subArray;
    NSMutableArray *_imageArray;
    NSMutableArray *_selectedImage;
    UIButton *_selectedBtn;
    UIButton *_dateBtn;
    FSCalendar *_calendar;
    BOOL _isALL;
}
@property (nonatomic, strong) TradeContentView *originalVc;

@property (nonatomic, strong) UIButton *coverView;
@end

@implementation TradeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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



- (IBAction)selecteDate:(UIButton *)sender {
    
    
    _wholeView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _wholeView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    //刘明修改 添加View覆盖整个视图
    //[self.navigationController.view addSubview:_wholeView];
    
    //end
    
    [self.view addSubview:_wholeView];
    
    _calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 0, 350, 210)];
    _calendar.backgroundColor = [UIColor whiteColor];
    _calendar.dataSource = self;
    _calendar.delegate = self;
    NSInteger year = 2016;
    NSInteger month = 05;
    NSInteger day = 06;

        //获取当前时间
        NSDate *now = [NSDate date];
        NSCalendar *calendar1 = [NSCalendar currentCalendar];
        NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
        NSDateComponents *dateComponent = [calendar1 components:unitFlags fromDate:now];
        year = [dateComponent year];
        month = [dateComponent month];
        day = [dateComponent day];

    
    _calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
    _calendar.layer.cornerRadius = 5;
    [_calendar selectDate:[NSDate fs_dateWithYear:year month:month day:day]];
    [_wholeView addSubview:_calendar];
    _calendar.center = CGPointMake(_wholeView.center.x, _wholeView.center.y);
    _dateBtn =sender;
    
}


#pragma mark FSCalender的代理

- (void)calendar:(FSCalendar *)calendar didSelectDate:(NSDate *)date
{
    
    NSLog(@"dayChangedToDate %@(GMT)",date);
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //tiangai
    NSLocale *locale =[[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
    dateFormatter.locale = locale;
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    //     [dateFormatter setDateFormat:@"YYYY.MM.dd"];
    //end
    NSString *dateString = [dateFormatter stringFromDate:date];
    
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    dateFormatter1.locale = locale;
    [dateFormatter1 setDateFormat:@"yyyyMMdd"];
    [_dateBtn setTitle:dateString forState:UIControlStateNormal];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [_calendar removeFromSuperview];
        [_wholeView removeFromSuperview];
        
        
    });
    
 
    
}

- (void)selectDate:(NSDate *)date
{
    NSLog(@"select date :%@",date);
}
- (BOOL)calendar:(FSCalendar *)calendar shouldSelectDate:(NSDate *)date
{
    NSLog(@"select shouldSelectDate date :%@",date);
    return YES;
    
}

- (UIColor *)calendar:(FSCalendar *)calendar appearance:(FSCalendarAppearance *)appearance titleDefaultColorForDate:(NSDate *)date
{
    NSLog(@"titleDefaultColorForDate :%@ ",date);
    return [UIColor redColor];
}

- (void)calendarCurrentPageDidChange:(FSCalendar *)calendar
{
    NSLog(@"did change to page %@",[calendar.currentPage fs_stringWithFormat:@"MMMM yyyy"]);
}



- (void)showOriginalContentView{
    
        [UIView animateWithDuration:0.25 animations:^{
            
            self.view.transform = CGAffineTransformMakeTranslation(-338, 0);
            TradeContentView *originalV = [[[NSBundle mainBundle]loadNibNamed:@"TradeContentView" owner:nil options:nil]lastObject ];
            originalV.frame = CGRectMake(KScreenWidth - koriginalWidth, 0, koriginalWidth, KScreenHeight);
            self.originalVc = originalV;

            originalV.delegate = self;
            [KWindow addSubview:originalV];
            
        } completion:^(BOOL finished) {
            
            
            
        }];
        

    

   
}

- (void)hideOriginalContentView{
    [UIView animateWithDuration:0.25 animations:^{
        self.view.transform = CGAffineTransformIdentity;
        [self.originalVc removeFromSuperview];
    }];
    
    
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
    button.tag = 210 + section;
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    button.backgroundColor = [UIColor clearColor] ;
    return button;
    
    
}
- (void)groupAction:(UIButton *)btn{
    if (btn.tag == 210) {
        
        _isALL = !_isALL;
        [self.typeTable reloadData];
    }
    if (_selectBtn != btn) {
        
        _selectBtn.selected = NO;
        btn.selected = !btn.selected;
        _selectBtn = btn;
    }
  

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView  == _typeTable) {
       
        if(section == 0 && _isALL){
            
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
             [cell.titleBtn addTarget:self action:@selector(groupAction:) forControlEvents:UIControlEventTouchUpInside];
          
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

                isHidden = NO;
            }else{
        
                [self hideOriginalContentView];
//                self.coverView.hidden = YES;
                isHidden = YES;
              
            }
        
    }

    
}

#pragma mark  注释CheDanViewDelegate
- (void)CheDanViewDidCancel:(CheDanView  *)orderContent{
    
    [orderContent removeFromSuperview];
    [self hideOriginalContentView];
    
}
- (void)CheDanViewDidYes:(CheDanView  *)orderContent{
    
    [orderContent removeFromSuperview];
    [self hideOriginalContentView];
}

#pragma mark  注释OriginalContentViewDelegate

- (void)TradeContentViewDidChickCheDan:(TradeContentView  *)orderContent{
    CheDanView *cheView = [[[NSBundle mainBundle]loadNibNamed:@"CheDanView" owner:nil options:nil]lastObject];
    cheView.delegate= self;
    [KWindow addSubview:cheView];
    
//    [self hideOriginalContentView];
    
    
}
- (void)TradeContentViewDidChickJieZhang:(TradeContentView  *)orderContent WithBillID:(NSString *)billID tableID:(NSString *)tableID count:(NSString *)count{
    
     [self hideOriginalContentView];
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
