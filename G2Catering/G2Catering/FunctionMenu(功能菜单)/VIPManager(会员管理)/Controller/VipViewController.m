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

#import "UserDataManager.h"
#import "UserModel.h"


@interface VipViewController ()<UITableViewDelegate,UITableViewDataSource,VIPLeftViewDelegate>{
    
    BOOL _isHidden;
}

@property (nonatomic,strong) NSArray<UserModel *> *userArray;

@end

@implementation VipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isHidden = YES;
    self.vipTable.dataSource =self;
    self.vipTable.delegate =self;
    [self.vipTable registerNib:[UINib nibWithNibName:@"VIPTableViewCell" bundle:nil] forCellReuseIdentifier:@"VIPTableViewCell"];
    
    [self.addBtn addTarget:self action:@selector(addVipAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.allView setCornerRadius:5.0 withBorderWidth:1.0 withBorderColor:RGB(0xc2, 0xc7, 0xcc)];
    

    
    self.userArray = [NSArray array];
    

    [self p_getData];
}


-(void)p_getData{
    
    
    UserModel *model = [[UserModel alloc]init];
    model.jobStatus = @"2";
    
    [UserDataManager getVIPUserList:model success:^(id response) {
        
        self.userArray = response;
        
        [self.vipTable reloadData];
    } failure:^(NSError *error) {
        
        
    }];
    
}

- (void)addVipAction:(UIButton *)btn{
    
    if (_isHidden) {
        [UIView animateWithDuration:0.25 animations:^{
            
            self.allView.transform = CGAffineTransformMakeTranslation(-338, 0);
  
            _isHidden = NO;
            
        } completion:^(BOOL finished) {
            
            VIPLeftView *leftView = [[[NSBundle mainBundle]loadNibNamed:@"VIPLeftView" owner:self options:nil]lastObject];
            leftView.delegate = self;
            leftView.frame = CGRectMake(KScreenWidth - 338, 27, 338, 720);
            [self.view addSubview:leftView];
            
            
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
    
    
    NSString *phone =   orderContent.phoneTextField.text;
    NSString *name = orderContent.nameLabel.text;
    
    NSString *amount = orderContent.amountTextField.text;
    
    UserModel *model = [[UserModel alloc]init];
    model.mobile = phone;
    model.name = name;
    model.jobStatus = @"2";
    model.groupIds = @[@"15b86fa03cfd11e66bd265bf3021409c"];
    
    [UserDataManager addVIPUser:model success:^(id response) {
        
        
        [UIView animateWithDuration:0.25 animations:^{
            
            self.allView.transform = CGAffineTransformIdentity;
            [orderContent removeFromSuperview];
            _isHidden = YES;
            
        } completion:^(BOOL finished) {
            
            
            
        }];
        
        
    } failure:^(NSError *error) {
       
        
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
    
    return self.userArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    VIPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VIPTableViewCell" forIndexPath:indexPath];
    cell.model = self.userArray[indexPath.row];
    
    if (indexPath.row % 2 == 1) {
        cell.backgroundColor = RGB(248, 251, 255);
    }else{
        cell.backgroundColor = [UIColor whiteColor];
    }
    
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
