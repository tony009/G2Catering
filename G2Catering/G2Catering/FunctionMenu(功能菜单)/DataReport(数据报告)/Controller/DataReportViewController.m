//
//  DataReportViewController.m
//  G2Catering
//
//  Created by NDlan on 16/6/27.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "DataReportViewController.h"
#import "FSCalendar.h"
#import "NSDate+FSExtension.h"
@interface DataReportViewController ()<FSCalendarDelegate,FSCalendarDataSource>

@property (nonatomic, strong) FSCalendar *calendar;
@property (nonatomic, strong) UIView *dateBackView;
@property (nonatomic, strong) UIButton *currentDateBtn;

@end

@implementation DataReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setupTopView];
    
    [self setupDatePickerView];

}

#pragma mark - setupTopView
- (void)setupTopView {
    
    self.startDataBtn.layer.masksToBounds = YES;
    self.startDataBtn.layer.cornerRadius  = 5;
    self.startDataBtn.layer.borderColor = [UIColor grayColor].CGColor;
    self.startDataBtn.layer.borderWidth = 1;
    
    self.endDataBtn.layer.masksToBounds = YES;
    self.endDataBtn.layer.cornerRadius  = 5;
    self.endDataBtn.layer.borderColor = [UIColor grayColor].CGColor;
    self.endDataBtn.layer.borderWidth = 1;
    
    self.bigBackView.layer.masksToBounds = YES;
    self.bigBackView.layer.cornerRadius  = 5;
    
    self.todayBtn.layer.masksToBounds = YES;
    self.todayBtn.layer.cornerRadius  = 5;    
    self.weekBtn.layer.masksToBounds = YES;
    self.weekBtn.layer.cornerRadius  = 5;
    self.monthBtn.layer.masksToBounds = YES;
    self.monthBtn.layer.cornerRadius  = 5;

    
    [self.todayBtn addTarget:self action:@selector(didClickTodayBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.weekBtn addTarget:self action:@selector(didClickWeekBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.monthBtn addTarget:self action:@selector(didClickMonthBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.startDataBtn addTarget:self action:@selector(didClickStartDataBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.endDataBtn addTarget:self action:@selector(didClickEndDataBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self didClickTodayBtn:self.todayBtn];
}

- (void)didClickTodayBtn:(UIButton *)sender{
    
    sender.selected = YES;
    sender.backgroundColor = [UIColor colorWithRed:42/255.0f green:66/255.0f blue:90/255.0f alpha:1];
    self.weekBtn.selected = NO;
    self.weekBtn.backgroundColor = [UIColor whiteColor];
    self.monthBtn.selected = NO;
    self.monthBtn.backgroundColor = [UIColor whiteColor];
}

- (void)didClickWeekBtn:(UIButton *)sender{
    
    sender.selected = YES;
    sender.backgroundColor = [UIColor colorWithRed:42/255.0f green:66/255.0f blue:90/255.0f alpha:1];
    self.todayBtn.selected = NO;
    self.todayBtn.backgroundColor = [UIColor whiteColor];
    self.monthBtn.selected = NO;
    self.monthBtn.backgroundColor = [UIColor whiteColor];
}

- (void)didClickMonthBtn:(UIButton *)sender{
    
    sender.selected = YES;
    sender.backgroundColor = [UIColor colorWithRed:42/255.0f green:66/255.0f blue:90/255.0f alpha:1];
    self.weekBtn.selected = NO;
    self.weekBtn.backgroundColor = [UIColor whiteColor];
    self.todayBtn.selected = NO;
    self.todayBtn.backgroundColor = [UIColor whiteColor];
}



#pragma mark- setupDatePickerView

- (void)setupDatePickerView{
    

    self.dateBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    self.dateBackView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
    
    [KWindow addSubview:self.dateBackView];
    [KWindow bringSubviewToFront:_dateBackView];

    _calendar = [[FSCalendar alloc] initWithFrame:CGRectMake(0, 0, 500, 300)];
    _calendar.layer.cornerRadius = 5;
    _calendar.layer.masksToBounds = YES;
    _calendar.center = self.dateBackView.center;
    [self.dateBackView addSubview:_calendar];
    _calendar.backgroundColor = [UIColor whiteColor];
    _calendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];

    self.dateBackView.hidden = YES;
}

- (void)didClickStartDataBtn:(UIButton *)sender{
    
    [self chooseDate:self.startDataBtn.currentTitle];
    self.currentDateBtn = sender;
}

- (void)didClickEndDataBtn:(UIButton *)sender{
    
    [self chooseDate:self.endDataBtn.currentTitle];
    
    self.currentDateBtn = sender;
}

- (void)chooseDate:(NSString *)dateString{
    self.dateBackView.hidden = NO;
    _calendar.delegate = self;
    _calendar.dataSource = self;
    
    NSDate *now = [NSDate date];
    NSCalendar *calendarNow = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponet = [calendarNow components:unitFlags fromDate:now];
    
    NSInteger year = dateComponet.year;
    NSInteger month = dateComponet.month;
    NSInteger day = dateComponet.day;
    
    NSDateFormatter *dateForrmatter = [[NSDateFormatter alloc] init];
    dateForrmatter.dateFormat = @"yyyy-MM-dd";
    
    NSDate *date = [dateForrmatter dateFromString:dateString];
    
    if (date) {
        
        dateComponet = [calendarNow components:unitFlags fromDate:date];
        year = dateComponet.year;
        month = dateComponet.month;
        day = dateComponet.day;
    }
    
    [self.calendar selectDate:[NSDate fs_dateWithYear:year month:month day:day]];
}


#pragma mark- 日历代理方法


- (BOOL)calendar:(FSCalendar *)calendar shouldSelectDate:(NSDate *)date
{
    NSLog(@"select shouldSelectDate date :%@",date);
 
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    NSLocale *locale =[[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
    dateFormatter.locale = locale;
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];

    NSString *dateString = [dateFormatter stringFromDate:date];
    
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    dateFormatter1.locale = locale;
    [dateFormatter1 setDateFormat:@"yyyyMMdd"];
    [self.currentDateBtn setTitle:dateString forState:UIControlStateNormal];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.dateBackView.hidden = YES;
    });
    
    return YES;
    
}






@end
