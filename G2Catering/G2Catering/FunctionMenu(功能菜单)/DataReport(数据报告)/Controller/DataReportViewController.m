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
#import "OrderCountTableViewCell.h"
#import "FoodAnayseTableViewCell.h"
#import "ZFChart.h"
#import "DishTypeCollectionViewCell.h"
@interface DataReportViewController ()<FSCalendarDelegate,FSCalendarDataSource,UITableViewDelegate,UITableViewDataSource,ZFPieChartDataSource,ZFGenericChartDataSource,ZFLineChartDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) FSCalendar *calendar;
@property (nonatomic, strong) UIView *dateBackView;
@property (nonatomic, strong) UIButton *currentDateBtn;

@property (nonatomic, strong) NSMutableArray * pointArray;

@property (nonatomic, strong) ZFWaveChart * waveChart2;
@property (nonatomic, strong) ZFWaveChart * waveChart;
@end

@implementation DataReportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setupTopView];
    //日期选择
    [self setupDatePickerView];
    //订单统计
    [self setupOrderCountView];
    //菜品分析
    [self setupFoodAnayseView];
    //营收总收入
    [self setupTotalRevenueView];
    //下单方式
    [self setupOrderWayView];
    //营收分布
    [self setupDistributionRevenueView];
    //菜品分类
    [self setupFoodCategoryView];
}

#pragma mark - setupTopView
- (void)setupTopView {
    
    [self.startDataBtn setCornerRadius:5.0 withBorderWidth:1.0 withBorderColor:RGB(0xc2, 0xc7, 0xcc)];
    
    [self.endDataBtn setCornerRadius:5.0 withBorderWidth:1.0 withBorderColor:RGB(0xc2, 0xc7, 0xcc)];
    
    
    
    
    self.bigBackView.layer.masksToBounds = YES;
    self.bigBackView.layer.cornerRadius  = 5;
    
    self.todayBtn.layer.masksToBounds = YES;
    self.todayBtn.layer.cornerRadius  = 15;
    self.weekBtn.layer.masksToBounds = YES;
    self.weekBtn.layer.cornerRadius  = 15;
    self.monthBtn.layer.masksToBounds = YES;
    self.monthBtn.layer.cornerRadius  = 15;

    
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


#pragma mark - setupOrderCountView
static NSString *reuserID = @"OrderingTableViewCell";
- (void)setupOrderCountView{

    self.orderCountView.layer.masksToBounds = YES;
    self.orderCountView.layer.cornerRadius = 5;
    
    self.orderTableView.delegate = self;
    self.orderTableView.dataSource = self;

    [self.orderTableView registerNib:[UINib nibWithNibName:@"OrderCountTableViewCell" bundle:nil] forCellReuseIdentifier:reuserID];
}

#pragma mark- FoodAnayseTableViewCell

static NSString *reuser = @"FoodAnayseTableViewCell";
- (void)setupFoodAnayseView{
    

    [self.top10Btn setCornerRadius:5.0 withBorderWidth:1.0 withBorderColor:RGB(0xc2, 0xc7, 0xcc)];
    
    [self.foodAnalyseBackView setCornerRadius:5.0 withBorderWidth:1.0 withBorderColor:RGB(0xc2, 0xc7, 0xcc)];
    
    
    
    self.foodAnayseTableView.delegate = self;
    self.foodAnayseTableView.dataSource = self;
    
    [self.foodAnayseTableView registerNib:[UINib nibWithNibName:@"FoodAnayseTableViewCell" bundle:nil] forCellReuseIdentifier:reuser];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    if (tableView == self.orderTableView) {
         return 5;
    }else{
        
        return 10;
    }
    
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (tableView == self.orderTableView) {
        OrderCountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuserID forIndexPath:indexPath];
        
        if (indexPath.row == 0) {
            
            cell.categoryName.text = @"堂食";
            cell.orderNum.text = @"30";
            cell.percentLabel.text = @"30%";
        }
        
        if (indexPath.row == 1) {
            
            cell.categoryName.text = @"外卖";
            cell.orderNum.text = @"40";
            cell.percentLabel.text = @"40%";
        }
        
        if (indexPath.row == 2) {
            
            cell.categoryName.text = @"外带";
            cell.orderNum.text = @"30";
            cell.percentLabel.text = @"30%";
        }
        
        if (indexPath.row == 3) {
            
            cell.categoryName.text = @"";
            cell.orderNum.text = @"";
            cell.percentLabel.text = @"";
        }
        
        if (indexPath.row == 4) {
            
            cell.categoryName.text = @"合计";
            cell.orderNum.text = @"100";
            cell.percentLabel.text = @"100%";
        }
        
        if (indexPath.row % 2 == 0) {
            
            cell.backgroundColor = [UIColor colorWithRed:248/255.0f green:248/255.0f blue:248/255.0f alpha:1];
        }else{
            
            cell.backgroundColor = [UIColor whiteColor];
        }
        
        return cell;

    }else{
        
        FoodAnayseTableViewCell *foodAnayseCell = [tableView dequeueReusableCellWithIdentifier:reuser forIndexPath:indexPath];
        
        if (indexPath.row == 0) {
       
            foodAnayseCell.backgroundColor = [UIColor colorWithRed:42/255.0f green:66/255.0f blue:90/255.0f alpha:1];
            foodAnayseCell.num.textColor = [UIColor whiteColor];
            foodAnayseCell.orderNum.textColor = [UIColor whiteColor];
            foodAnayseCell.foodName.textColor = [UIColor whiteColor];
        }else if (indexPath.row == 1){
            
             foodAnayseCell.backgroundColor = [UIColor colorWithRed:85/255.0f green:104/255.0f blue:123/255.0f alpha:1];
            foodAnayseCell.num.textColor = [UIColor whiteColor];
            foodAnayseCell.orderNum.textColor = [UIColor whiteColor];
            foodAnayseCell.foodName.textColor = [UIColor whiteColor];
        }else if (indexPath.row == 2){
            
            foodAnayseCell.backgroundColor = [UIColor colorWithRed:148/255.0f green:160/255.0f blue:172/255.0f alpha:1];
            foodAnayseCell.num.textColor = [UIColor whiteColor];
            foodAnayseCell.orderNum.textColor = [UIColor whiteColor];
            foodAnayseCell.foodName.textColor = [UIColor whiteColor];
        }else{
            
            foodAnayseCell.backgroundColor = [UIColor whiteColor];
        }
        
        return foodAnayseCell;
    }
 
}



#pragma mark -setupTotalRevenueView

- (void)setupTotalRevenueView{
    
    
    //假数据
    NSArray *array = @[@50,@60,@70,@80,@100,@200,@20,@50];
    
    NSInteger totall = 630;
    
    for (int i = 0; i< array.count; i++) {
        
        float a = [array[i] doubleValue];
        
        NSLayoutConstraint *aContraint = self.totalRevenueConstraint[i];
        
        aContraint.constant = a / totall * 178;
 
    }
    
    
}

#pragma mark -setupOrderWayView

- (void)setupOrderWayView{
    
    
    ZFPieChart * pieChart = [[ZFPieChart alloc] initWithFrame:CGRectMake(0, 0, 328, 248)];
    pieChart.dataSource = self;
    //    pieChart.piePatternType = kPieChartPatternTypeForCircle;
    //    pieChart.percentType = kPercentTypeInteger;
    //    pieChart.isShadow = NO;
    //    pieChart.isAnimated = NO;
    pieChart.isShowDetail = YES;
    [pieChart strokePath];
    [self.pieView addSubview:pieChart];
}

#pragma mark - ZFPieChartDataSource

- (NSArray *)valueArrayInPieChart:(ZFPieChart *)chart{
    //    return @[@"200", @"256", @"300", @"283", @"490", @"236"];
    return @[@"200", @"256", @"300", @"283", @"490"];
}

- (NSArray *)nameArrayInPieChart:(ZFPieChart *)chart{
    return @[@"预定", @"堂食", @"立即结算", @"外卖", @"外带"];
}

- (NSArray *)colorArrayInPieChart:(ZFPieChart *)chart{
    
//    51 102 102  42 66 90  31 136 175  40103153
    return @[ZFColor(51, 102, 102, 1), ZFColor(42, 66, 90, 1), ZFColor(31, 136, 175, 1), ZFColor(40, 103, 153, 1), ZFColor(31, 136, 175, 1)];
}



#pragma mark -setupDistributionRevenueView

- (void)setupDistributionRevenueView{
    
    
    ZFLineChart * lineChart = [[ZFLineChart alloc] initWithFrame:CGRectMake(-20, 0, 336, 269)];
    lineChart.dataSource = self;
    lineChart.delegate = self;
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(70, 20, 15, 15)];
    blueView.backgroundColor = ZFColor(42, 66, 90, 1);
    [lineChart addSubview:blueView];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(90, 12, 30, 30)];
    label1.text = @"金额";
    label1.font = [UIFont systemFontOfSize:12];
    [lineChart addSubview:label1];
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(120, 20, 15, 15)];
    greenView.backgroundColor = ZFColor(51, 153, 153, 1);
    [lineChart addSubview:greenView];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(140, 12, 50, 30)];
    label2.text = @"订单数";
    label2.font = [UIFont systemFontOfSize:12];
    [lineChart addSubview:label2];
    
    lineChart.unit = @"￥";
    lineChart.topicColor = ZFWhite;
    lineChart.isShowSeparate = YES;
    //    lineChart.isAnimated = NO;
    lineChart.isResetAxisLineMinValue = YES;
    //    lineChart.isShowAxisLineValue = NO;
    //    lineChart.isShadowForValueLabel = NO;
    lineChart.isShadow = NO;
    //    lineChart.valueLabelPattern = kPopoverLabelPatternBlank;
    //    lineChart.valueCenterToCircleCenterPadding = 0;
    //    lineChart.separateColor = ZFYellow;
    lineChart.unitColor = ZFBlack;
    lineChart.backgroundColor = ZFWhite;
    lineChart.axisColor = ZFBlack;
    lineChart.axisLineNameColor = ZFBlack;
    lineChart.axisLineValueColor = ZFBlack;
    lineChart.xLineNameLabelToXAxisLinePadding = -10;
    [self.distributionRevenueBackView addSubview:lineChart];
    [lineChart strokePath];
}

#pragma mark - ZFGenericChartDataSource

- (NSArray *)valueArrayInGenericChart:(ZFGenericChart *)chart{
    return @[@[@"22", @"300", @"490", @"380", @"167", @"451"], @[@"380", @"200", @"326", @"240", @"258", @"137"]];
}

- (NSArray *)nameArrayInGenericChart:(ZFGenericChart *)chart{
    return @[@"6-10", @"10-14", @"14-18", @"18-22", @"22-2", @"2-4",@"(H)"];
}


////42 66 90  51 153 153
- (NSArray *)colorArrayInGenericChart:(ZFGenericChart *)chart{
    return @[ZFColor(42, 66, 90, 1), ZFColor(51, 153, 153, 1)];
}

- (CGFloat)axisLineMaxValueInGenericChart:(ZFGenericChart *)chart{
    return 700;
}

- (CGFloat)axisLineMinValueInGenericChart:(ZFGenericChart *)chart{
    return 0;
}

- (NSInteger)axisLineSectionCountInGenericChart:(ZFGenericChart *)chart{
    return 10;
}

#pragma mark - ZFLineChartDelegate

- (CGFloat)groupWidthInLineChart:(ZFLineChart *)lineChart{
    return 20.f;
}

- (CGFloat)paddingForGroupsInLineChart:(ZFLineChart *)lineChart{
    return 20.f;
}
//
//- (CGFloat)circleRadiusInLineChart:(ZFLineChart *)lineChart{
//    return 10.f;
//}
//
//- (CGFloat)lineWidthInLineChart:(ZFLineChart *)lineChart{
//    return 5.f;
//}

- (void)lineChart:(ZFLineChart *)lineChart didSelectCircleAtLineIndex:(NSInteger)lineIndex circleIndex:(NSInteger)circleIndex{
    NSLog(@"第%ld条线========第%ld个",(long)lineIndex,(long)circleIndex);
}

- (void)lineChart:(ZFLineChart *)lineChart didSelectPopoverLabelAtLineIndex:(NSInteger)lineIndex circleIndex:(NSInteger)circleIndex{
    NSLog(@"第%ld条线========第%ld个",(long)lineIndex,(long)circleIndex);
}

#pragma mark -setupFoodCategoryView
static NSString *reuserCollectionID = @"DishTypeCollectionViewCell";
- (void)setupFoodCategoryView{
    
    [self.foodCategoryBackView setCornerRadius:5.0 withBorderWidth:1.0 withBorderColor:RGB(0xc2, 0xc7, 0xcc)];
    
//    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.foodCategoryBackView.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = self.foodCategoryBackView.bounds;
//    maskLayer.path = bezierPath.CGPath;
//    self.foodCategoryBackView.layer.mask = maskLayer;

    
    [self setDishCategoryCollectionView];
    
}


- (void)setDishCategoryCollectionView{
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.foodCategoryCollectionView.collectionViewLayout;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(45, 63);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.foodCategoryCollectionView.showsVerticalScrollIndicator = NO;
    self.foodCategoryCollectionView.backgroundColor = [UIColor whiteColor];
    
    self.foodCategoryCollectionView.delegate = self;
    self.foodCategoryCollectionView.dataSource = self;
    
    [self.foodCategoryCollectionView registerNib:[UINib nibWithNibName:@"DishTypeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuserCollectionID];
}

#pragma mark- collectionView代理

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 10;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DishTypeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuserCollectionID forIndexPath:indexPath];
    

    
    if (indexPath.row == 0) {
        
        cell.selected = YES;
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    if (cell.selected == YES) {
        
        cell.backgroundColor = [UIColor whiteColor];
    }else{
        
        cell.backgroundColor = [UIColor colorWithRed:248/255.0f green:248/255.0f blue:248/255.0f alpha:1];
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    for ( DishTypeCollectionViewCell *cell in self.foodCategoryCollectionView.subviews) {
        if (![cell isKindOfClass:[DishTypeCollectionViewCell class]]) {
            return;
        }
        if ([collectionView indexPathForCell:cell] == indexPath) {
            
            cell.backgroundColor = [UIColor whiteColor];
        }else{

             cell.backgroundColor = [UIColor colorWithRed:248/255.0f green:248/255.0f blue:248/255.0f alpha:1];
        }
    }
    
    
}



@end
