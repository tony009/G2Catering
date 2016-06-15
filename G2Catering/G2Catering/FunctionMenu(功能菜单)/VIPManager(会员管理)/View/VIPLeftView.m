//
//  VIPLeftView.m
//  G2Catering
//
//  Created by iOS  on 16/6/15.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "VIPLeftView.h"
@interface VIPLeftView()<UITableViewDataSource,UITableViewDelegate>
@end
@implementation VIPLeftView
-(void)awakeFromNib{
    
    self.typeTable.dataSource = self;
    self.typeTable.delegate = self;
    NSArray *segmentedData = [[NSArray alloc]initWithObjects:@"先生",@"女士",nil];
    self.segmentedCtrl = [[UISegmentedControl alloc]initWithItems:segmentedData];
    self.segmentedCtrl.frame = CGRectMake(CGRectGetMaxX(self.nameLabel.frame), CGRectGetMinY(self.nameLabel.frame), 338- CGRectGetMaxX(self.nameLabel.frame)-30, 30);
    [self.topView addSubview:self.segmentedCtrl];
    
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (IBAction)cancelAction:(id)sender {
    
    NSLog(@"VIPLeftViewDidChickCancel");
    if ([self.delegate respondsToSelector:@selector(VIPLeftViewDidChickCancel:)]) {
        
        [self.delegate VIPLeftViewDidChickCancel:self];
        
    }
}

- (IBAction)yesAction:(id)sender {
     NSLog(@"VIPLeftViewDidChickYes");
    if ([self.delegate respondsToSelector:@selector(VIPLeftViewDidChickYes:)]) {
        
        [self.delegate VIPLeftViewDidChickYes:self];
        
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"VIPTableV iew"];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = @"金卡";
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;

}

@end
