//
//  LingShouViewController.m
//  G2Catering
//
//  Created by iOS  on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "LingShouViewController.h"
#import "LingShouTableViewCell.h"

@interface LingShouViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LingShouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setRoundAngleWithView:self.leftView withCornerRadius:5 withColor:[UIColor lightGrayColor]];
    [self.consumeTable registerNib:[UINib nibWithNibName:@"LingShouTableViewCell" bundle:nil] forCellReuseIdentifier:@"LingShouTableViewCell"];
    
    
    
}

//设置圆角
- (void)setRoundAngleWithView:(UIView *)changeView withCornerRadius:(double)cornerRadius withColor:(UIColor *)color{
    
    changeView.layer.masksToBounds = YES;
    changeView.layer.cornerRadius = cornerRadius;
    changeView.layer.borderColor = color.CGColor;
    changeView.layer.borderWidth = 1;
    
}

#pragma mark  注释UITableViewDelegate  

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return  10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LingShouTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LingShouTableViewCell" forIndexPath:indexPath];
    return cell;
    
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
