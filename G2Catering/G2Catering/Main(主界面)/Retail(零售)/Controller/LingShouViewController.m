//
//  LingShouViewController.m
//  G2Catering
//
//  Created by iOS  on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "LingShouViewController.h"
#import "LingShouTableViewCell.h"
#import "ZhifuView.h"
@interface LingShouViewController ()
@end

@implementation LingShouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _resultStr = [[NSMutableString alloc]initWithString:@"0"];
     _priceArray = [NSMutableArray array];
    [self setRoundAngleWithView:self.leftView withCornerRadius:5 withColor:[UIColor lightGrayColor]];
    [self.consumeTable registerNib:[UINib nibWithNibName:@"LingShouTableViewCell" bundle:nil] forCellReuseIdentifier:@"LingShouTableViewCell"];
    self.consumeTable.dataSource =self;
    self.consumeTable.delegate =self;
    [self.jieZhangBtn addTarget:self action:@selector(jieZhangAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}

- (void)jieZhangAction:(UIButton *)btn{
    
    ZhifuView *view = [[[NSBundle mainBundle]loadNibNamed:@"ZhifuView" owner:self options:nil]lastObject];
    view.frame = CGRectMake(8, 33, 680, 727);
    [self.calculatorView addSubview:view];
    
    
}
- (IBAction)numClick:(UIButton *)sender {
    NSInteger senderTag = sender.tag;
    NSString *tmp = [sender currentTitle];
    //判断小数点的位数
    NSRange range = [_resultStr rangeOfString:@"."];
//    NSLog(@"判断小数点的位数 %ld %ld",range.location,range.length);
    if (range.length > 0) {
        if(_resultStr.length -2 == range.location && [tmp isEqualToString:@"00"]){
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"最多两位小数" delegate:nil cancelButtonTitle:@"确定"otherButtonTitles: nil];
            [alertView show];
            return;
            
        }
        
        if (_resultStr.length - range.location -1 >= 2  ) {
            if (senderTag ==3632||senderTag == 3633) {
                
                
            }else{
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"最多两位小数" delegate:nil cancelButtonTitle:@"确定"otherButtonTitles: nil];
                [alertView show];
                return;
            }
            
        }else if (_resultStr.length - 1 == range.location && senderTag == 3633){
            
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"小数点后面需有值" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show ];
            return;
            
        }
        
        
    }
    if (_resultStr.length == 0) {
        
        if ([tmp isEqualToString:@"00"] || [tmp isEqualToString:@"."]) {
            
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"输入数据有误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
            return;
        }
    }
    //  不能输入两次小数点
    if (senderTag == 3631) {
        
        if ( [_resultStr rangeOfString:@"."].length > 0) {
            
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"已经存在小数点" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show];
            return;
        }
        
        
    }
    //此处监控输入，适合使用switch
    if(senderTag == 3632){
        
        NSMutableString* mutableString = [[NSMutableString alloc] initWithFormat:@"%@",  _resultStr];
        //
        if([mutableString isEqualToString:@"￥"]) {
            _resultStr = [[NSMutableString alloc]initWithString:@"0"];

            return;
        }else{
            if ([mutableString length] >= 1) {
                NSRange tmpRange;
                tmpRange.location = [mutableString length] - 1;
                tmpRange.length = 1;
                [mutableString deleteCharactersInRange:tmpRange];
            }
            
            _resultStr = mutableString;
            
            _resultLabel.text =[[NSMutableString alloc]initWithString:[NSString stringWithFormat:@"￥%@", mutableString]];
            
            
        }
    } else if (senderTag == 3633) {
        double value = [_resultStr doubleValue];
        
        if([_resultStr isEqualToString:@""] || value == 0){
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"请输入有效数字" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
            [alertView show
             ];
            return  ;
            
        }else{
            double result = [_resultStr doubleValue];
            NSString *resultString = [NSString stringWithFormat:@"%.2f",result];
            [_priceArray addObject:resultString];
            
            [self.consumeTable reloadData];
            [self setSumText];
            _resultStr = [[NSMutableString alloc]initWithString:@"0"];
            _resultLabel.text =[[NSMutableString alloc]initWithString:@"￥"];
            
            
        }
        
    }else{
        //这个时候是输入数字的情况
        if(([_resultStr isEqualToString:@"0"]|| [_resultStr isEqualToString:@"00"]) && ([tmp isEqualToString:@"0"]|| [tmp isEqualToString:@"00"])){
            _resultStr = [[NSMutableString alloc]initWithString:@"0"];
        }else if([_resultStr isEqualToString:@"0"] && ![tmp isEqualToString:@"."]) {
            _resultStr = [[NSMutableString alloc]initWithString:tmp];
            
        }else{
            
            [_resultStr appendString:tmp];
        }
        
        
        _resultLabel.text =[[NSMutableString alloc]initWithString:[NSString stringWithFormat:@"￥%@", _resultStr]];
        
        
        
    }

}


- (void)setSumText{
//    if (_priceArray.count > 0) {
//        
////        [_xiaDanBtn setImage:[UIImage imageNamed:@"shanchu-1"] forState:UIControlStateNormal];
//        [_xiaDanBtn setTitleColor:[UIColor colorWithRed:78/255.0 green:152/255.0 blue:226/255.0 alpha:1] forState:UIControlStateNormal];
//    }else{
//        
////        [_xiaDanBtn setImage:[UIImage imageNamed:@"shanchu"] forState:UIControlStateNormal];
//        [_xiaDanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    }
    double priceD = 0;
    for(NSString *price  in _priceArray){
        
        priceD += [price doubleValue];
        
    }
//    if (priceD == 0) {
//        //colorWithRed:197/255.0 green:198/255.0 blue:199/255.0 alpha:1
//        [_jieZhangBtn setBackgroundColor:[UIColor colorWithRed:75/255.0 green:138/255.0 blue:221/255.0 alpha:1]];
//        _jieZhangBtn.userInteractionEnabled = NO;
//    }else{
//        [_jieZhangBtn setBackgroundColor:[UIColor colorWithRed:78/255.0 green:152/255.0 blue:226/255.0 alpha:1]];
//        _jieZhangBtn.userInteractionEnabled = YES;
//        
//    }
    _numLabel.text =[NSString stringWithFormat:@"共%ld道",_priceArray.count];
    _priceLabel.text = [NSString stringWithFormat:@"￥%.2f",priceD];
    
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
    
    return  _priceArray.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LingShouTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LingShouTableViewCell" forIndexPath:indexPath];
    cell.priceLabel.text = _priceArray[indexPath.row];
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
