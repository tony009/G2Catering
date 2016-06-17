//
//  MainLeftView.m
//  G2Catering
//
//  Created by wd on 16/6/13.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "MainLeftView.h"
#import "MainLeftTableViewCell.h"

@interface MainLeftView ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *imageArray; //图片数组
    NSArray *selectedImageArray; //选择的图片数组
    NSArray *nameArray;
}
@property (weak, nonatomic) IBOutlet UITableView *menuTableView;

@end

@implementation MainLeftView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
    
}


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    
    [self.menuTableView registerNib:[UINib nibWithNibName:@"MainLeftTableViewCell" bundle:nil] forCellReuseIdentifier:@"MainLeftTableViewCellIdentifier"];
    
    imageArray = @[@"菜单－预定管理",@"菜单－订单记录",@"菜单－数据报告",@"菜单－会员管理",@"菜单－系统设置"];
    selectedImageArray = @[@"菜单－预定管理-点击",@"菜单－订单记录-点击",@"菜单－数据报告-点击",@"菜单－会员管理-点击",@"菜单－系统设置-点击"];
    nameArray = @[@"预订管理",@"订单记录",@"数据报告",@"会员管理",@"系统设置"];
    
}


#pragma mark -- UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainLeftTableViewCellIdentifier"];
    
    if (cell ==nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MainLeftTableViewCell" owner:nil options:nil]lastObject];
    }
    cell.pLabel.text = nameArray[indexPath.row];
    cell.defaultImageName = imageArray[indexPath.row];
    cell.selectedImageName = selectedImageArray[indexPath.row];
    
    return cell;
    
}

#pragma mark -- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.delegate respondsToSelector:@selector(MainLeftViewMenuDidChick:withIndex:)]) {
        [self.delegate MainLeftViewMenuDidChick:self withIndex:indexPath.row];
    }
    
}



@end
