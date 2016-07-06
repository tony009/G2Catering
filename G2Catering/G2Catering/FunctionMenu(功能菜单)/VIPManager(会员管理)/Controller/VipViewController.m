//
//  VipViewController.m
//  G2Catering
//
//  Created by iOS  on 16/6/15.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "VipViewController.h"
#import "VIPTableViewCell.h"
#import "VIPLeftView.h"
@interface VipViewController ()<UITableViewDelegate,UITableViewDataSource,VIPLeftViewDelegate>{
    
    BOOL _isHidden;
}

@end

@implementation VipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isHidden = YES;
  //[self.bgView setImage:[UIImage imageNamed:@"订单-BG"]];
    self.vipTable.dataSource =self;
    self.vipTable.delegate =self;
    [self.vipTable registerNib:[UINib nibWithNibName:@"VIPTableViewCell" bundle:nil] forCellReuseIdentifier:@"VIPTableViewCell"];
    [self.addBtn addTarget:self action:@selector(addVipAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.allView setCornerRadius:5.0 withBorderWidth:1.0 withBorderColor:[UIColor grayColor]];

}
//设置圆角
- (void)setRoundAngleWithView:(UIView *)changeView withCornerRadius:(double)cornerRadius withColor:(UIColor *)color{
    
    changeView.layer.masksToBounds = YES;
    changeView.layer.cornerRadius = cornerRadius;
    changeView.layer.borderColor = color.CGColor;
    changeView.layer.borderWidth = 1;
    
}


- (void)addVipAction:(UIButton *)btn{
    
    if (_isHidden) {
        [UIView animateWithDuration:0.25 animations:^{
            
            self.allView.transform = CGAffineTransformMakeTranslation(-338, 0);
            VIPLeftView *leftView = [[[NSBundle mainBundle]loadNibNamed:@"VIPLeftView" owner:self options:nil]lastObject];
            leftView.delegate = self;
            leftView.frame = CGRectMake(KScreenWidth - 338, 0, 338, 768);
            [self.view addSubview:leftView];
            _isHidden = NO;
            
        } completion:^(BOOL finished) {
            
            
            
        }];

    }
    
}
#pragma mark  注释

- (void)VIPLeftViewDidChickCancel:(VIPLeftView  *)orderContent{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.allView.transform = CGAffineTransformIdentity;
        [orderContent removeFromSuperview];
        _isHidden = YES;
        
    } completion:^(BOOL finished) {
       
        
        
    }];
    
    
}
- (void)VIPLeftViewDidChickYes:(VIPLeftView  *)orderContent{
    
    [UIView animateWithDuration:0.25 animations:^{
        
        self.allView.transform = CGAffineTransformIdentity;
         [orderContent removeFromSuperview];
        _isHidden = YES;
        
    } completion:^(BOOL finished) {
        
        
        
    }];
}


#pragma mark  注释UITableViewDelegate
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewCellEditingStyleDelete;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"充值";
}




- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
     NSLog(@"充值");
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    VIPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VIPTableViewCell" forIndexPath:indexPath];
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    
    
    
    
    
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
