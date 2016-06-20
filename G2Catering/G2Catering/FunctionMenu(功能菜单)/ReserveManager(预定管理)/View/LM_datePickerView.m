//
//  LM_datePickerView.m
//  G2Catering
//
//  Created by NDlan on 16/6/17.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "LM_datePickerView.h"

#define currentMonth [currentMonthString integerValue]

@interface LM_datePickerView()<UIPickerViewDelegate,UIPickerViewDataSource>

@end

@implementation LM_datePickerView
{
    
    NSMutableArray *yearArray;
    NSMutableArray *monthArray;
    NSMutableArray *DaysArray;
    NSArray *amPmArray;
    NSMutableArray *hoursArray;
    NSMutableArray *minutesArray;
    NSMutableArray *secondArray;
    NSString *currentMonthString;
    NSString *currentDateString;
    NSString *currentHourString;
    NSString *currentMinutesString;
    NSString *currentSecondString;
    
    int selectedYearRow;
    int selectedMonthRow;
    int selectedDayRow;
    
    BOOL firstTimeLoad;
    
}

- (void)awakeFromNib{
    
    self.lmDatePickerView.delegate = self;
    self.lmDatePickerView.dataSource = self;
    
    NSDate *date = [NSDate date];
    
    // Get Current Year
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy"];
    
    NSString *currentyearString = [NSString stringWithFormat:@"%@",
                                   [formatter stringFromDate:date]];

    
    [formatter setDateFormat:@"MM"];
    
    currentMonthString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    
    [formatter setDateFormat:@"dd"];
    currentDateString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];

    [formatter setDateFormat:@"hh"];
    currentHourString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];

    [formatter setDateFormat:@"mm"];
    currentMinutesString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];
    
    [formatter setDateFormat:@"ss"];
   currentSecondString = [NSString stringWithFormat:@"%@",[formatter stringFromDate:date]];

    
    yearArray = [[NSMutableArray alloc]init];
    
    
    for (int i = 1970; i <= 2050 ; i++)
    {
        [yearArray addObject:[NSString stringWithFormat:@"%d",i]];
        
    }

    
    monthArray = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <= 12; i++)
    {
        
        [monthArray addObject:[NSString stringWithFormat:@"%02d",i]];
        
    }
    
    
    hoursArray = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <= 24; i++)
    {
        
        [hoursArray addObject:[NSString stringWithFormat:@"%02d",i]];
        
    }
    
    
    
    // PickerView -  Hours data
    
    minutesArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i <= 60; i++)
    {
        
        [minutesArray addObject:[NSString stringWithFormat:@"%02d",i]];
        
    }
    

    // PickerView -  days data
    
    DaysArray = [[NSMutableArray alloc]init];
    
    for (int i = 1; i <= 31; i++)
    {
        [DaysArray addObject:[NSString stringWithFormat:@"%02d",i]];
        
    }
    
    secondArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i <= 60; i++)
    {
        [secondArray addObject:[NSString stringWithFormat:@"%02d",i]];
        
    }
    
//    [self.lmDatePickerView selectRow:[yearArray indexOfObject:currentyearString] inComponent:0 animated:YES];
    
    [self.lmDatePickerView selectRow:[monthArray indexOfObject:currentMonthString] inComponent:0 animated:YES];
    
    [self.lmDatePickerView selectRow:[DaysArray indexOfObject:currentDateString] inComponent:1 animated:YES];
    
    [self.lmDatePickerView selectRow:[hoursArray indexOfObject:currentHourString] inComponent:2 animated:YES];
    
    [self.lmDatePickerView selectRow:[minutesArray indexOfObject:currentMinutesString] inComponent:3 animated:YES];
    
    [self.lmDatePickerView selectRow:[secondArray indexOfObject:currentSecondString] inComponent:4 animated:YES];


    
    self.currentTime.text = [NSString stringWithFormat:@"%@-%@ %@:%@:%@",currentMonthString,currentDateString,currentHourString,currentMinutesString,currentSecondString];
}


//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//    
//    NSLog(@"%zd,%zd",row,component);
//}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSLog(@"%zd,%zd",row,component);
    
    
    if (component == 0) {
        row = row + 1;
        currentMonthString = [NSString stringWithFormat:@"%02zd",row];
    }
    
    if (component == 1) {
        row = row + 1;
          currentDateString = [NSString stringWithFormat:@"%02zd",row];
    }
    
    if (component == 2) {
        row = row + 1;
          currentHourString = [NSString stringWithFormat:@"%02zd",row];
    }
    
    if (component == 3) {

          currentMinutesString = [NSString stringWithFormat:@"%02zd",row];
    }
    if (component == 4) {

          currentSecondString = [NSString stringWithFormat:@"%02zd",row];
    }
    
        self.currentTime.text = [NSString stringWithFormat:@"%@-%@ %@:%@:%@",currentMonthString,currentDateString,currentHourString,currentMinutesString,currentSecondString];
}


#pragma mark - UIPickerViewDatasource

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    UILabel *pickerLabel = (UILabel *)view;
    
    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0.0, 0.0, 50, 60);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor whiteColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:15.0f]];
        pickerLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14.0];
        pickerLabel.textColor = [UIColor blackColor];
        
    }
    
    
    
//    if (component == 0)
//    {
//        pickerLabel.text =  [yearArray objectAtIndex:row]; // Year
//    }
//    else
    
        if (component == 0)
    {
        pickerLabel.text =  [monthArray objectAtIndex:row];  // Month
    }
    else if (component == 1)
    {
        pickerLabel.text =  [DaysArray objectAtIndex:row]; // Date
        
    }
    else if (component == 2)
    {
        pickerLabel.text =  [hoursArray objectAtIndex:row]; // Hours
    }
    else if (component == 3)
    {
        pickerLabel.text =  [minutesArray objectAtIndex:row]; // Mins
    }
    else
    {
        pickerLabel.text =  [secondArray objectAtIndex:row]; // second
    }
    
    return pickerLabel;
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    
    return 5;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

//    if (component == 0)
//    {
//        return [monthArray count];
//    }
//    else
    if (component == 0)
    {
        return [monthArray count];
    }
    else if (component == 1)
    { // day
        
        if (firstTimeLoad)
        {
            if (currentMonth == 1 || currentMonth == 3 || currentMonth == 5 || currentMonth == 7 || currentMonth == 8 || currentMonth == 10 || currentMonth == 12)
            {
                return 31;
            }
            else if (currentMonth == 2)
            {
                int yearint = [[yearArray objectAtIndex:selectedYearRow]intValue ];
                
                if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){
                    
                    return 29;
                }
                else
                {
                    return 28; // or return 29
                }
                
            }
            else
            {
                return 30;
            }
            
        }
        else
        {
            
            if (selectedMonthRow == 0 || selectedMonthRow == 2 || selectedMonthRow == 4 || selectedMonthRow == 6 || selectedMonthRow == 7 || selectedMonthRow == 9 || selectedMonthRow == 11)
            {
                return 31;
            }
            else if (selectedMonthRow == 1)
            {
                int yearint = [[yearArray objectAtIndex:selectedYearRow]intValue ];
                
                if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){
                    return 29;
                }
                else
                {
                    return 28; // or return 29
                }
                
                
                
            }
            else
            {
                return 30;
            }
            
        }
        
        
    }
    else if (component == 2)
    { // hour
        
        return 24;
        
    }
    else if (component == 3)
    { // min
        return 60;
    }
    else
    { // second
        return 60;
        
    }


}




@end
