//
//  ZhifuView.m
//  G2Catering
//
//  Created by iOS  on 16/6/17.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "ZhifuView.h"
#import "UIButton+RoundSide.h"
#import "TypeCollectionViewCell.h"
#import "fuKuanView.h"
#import "ScanView.h"
@interface  ZhifuView()<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate,fuKuanViewDelegate>{
    
    NSMutableArray *_typeArray;
    NSMutableArray *_stypeArray;
    NSMutableArray *_ntypeArray;
    UIButton *_selectedBtn;
     UIButton *_cashSelectedBtn;

}
@end
@implementation ZhifuView

- (void)awakeFromNib{
    _typeArray = [NSMutableArray arrayWithArray:@[@"aliPayWallet",@"ApplePay",@"baiduWallet",@"jdWallet",@"qqWallet",@"UnionPay",@"vip",@"wechatWallet",@"组13"]];
     _stypeArray = [NSMutableArray arrayWithArray:@[@"aliPayWallet",@"ApplePay",@"baiduWallet",@"jdWallet",@"qqWallet",@"UnionPay",@"vip",@"wechatWallet",@"组13"]];
    _ntypeArray = [NSMutableArray arrayWithArray:@[@"aliPayWallet",@"ApplePay",@"baiduWallet",@"jdWallet",@"qqWallet",@"UnionPay",@"vip",@"wechatWallet",@"组13"]];
    [self.typeCollection registerNib:[UINib nibWithNibName:@"TypeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"TypeCollectionViewCell"];
    self.typeCollection.showsVerticalScrollIndicator = NO;
    self.typeCollection.showsHorizontalScrollIndicator = NO;
    
    self.typeCollection.dataSource =self;
    self.typeCollection.delegate =self;
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    self.verifyView.layer.cornerRadius = 5;
    self.verifyView.layer.borderWidth = 1;
    self.verifyView.layer.borderColor = [UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1].CGColor;
    [self setRoundAngleWithView:self.button1 withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
    
    [self setRoundAngleWithView:self.button2 withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
    [self setRoundAngleWithView:self.button3 withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
    [self setRoundAngleWithView:self.inputText withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
    [self setRoundAngleWithView:self.yuView withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
    self.inputText.delegate = self;
    self.inputText.keyboardType = UIKeyboardTypeNumberPad;
    
    [self.scanBtn roundSide:@"SideRight"];
    
    //刘明
    
    [self scan];
    
    
}



- (void)scan{
    
    [self.scanBtn addTarget:self action:@selector(didClickScanBtn) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)didClickScanBtn{
    
    ScanView *scanView = [[NSBundle mainBundle] loadNibNamed:@"ScanView" owner:nil options:nil].lastObject;
    
    [self addSubview:scanView];
}


//end

//设置圆角
- (void)setRoundAngleWithView:(UIView *)changeView withCornerRadius:(double)cornerRadius withColor:(UIColor *)color{
    
    changeView.layer.masksToBounds = YES;
    changeView.layer.cornerRadius = cornerRadius;
    changeView.layer.borderColor = color.CGColor;
    changeView.layer.borderWidth = 1;
    
}


-(void)setIsYu:(BOOL)isYu{
    
    _isYu = isYu;
    if(_isYu){
        
        self.yuFuView.hidden = NO;

            self.allView.transform= CGAffineTransformMakeTranslation(0, 80);

    }
    
}
-(void)setPrice:(float)price{
    
    _price = price;
    _moneyLabel.text = [NSString stringWithFormat:@"%.2f",_price];
    [_button1 setTitle:[NSString stringWithFormat:@"￥%.2f",_price] forState:UIControlStateNormal];
    if ([_moneyLabel.text integerValue] %10<5) {
        
        long count = [_moneyLabel.text integerValue]/10;
        float price = count *10+5;
        float price2 = (count +1)*10;
        
        [_button2 setTitle:[NSString stringWithFormat:@"￥%.2f",price] forState:UIControlStateNormal];
        [_button3 setTitle:[NSString stringWithFormat:@"￥%.2f",price2] forState:UIControlStateNormal];
    }else{
        
        long count = [_moneyLabel.text integerValue]/10;
        float price = (count +1)*10;
        float price2 = (count +2)*10;
        
        [_button2 setTitle:[NSString stringWithFormat:@"￥%.2f",price] forState:UIControlStateNormal];
        [_button3 setTitle:[NSString stringWithFormat:@"￥%.2f",price2] forState:UIControlStateNormal];
    }
    

}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    _cashSelectedBtn.backgroundColor = [UIColor whiteColor];
    [_cashSelectedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _cashSelectedBtn = nil;
    
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    if([textField.text doubleValue]<=0){
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请输入正确的价格" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
        return;
    }
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _typeArray.count;
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TypeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TypeCollectionViewCell" forIndexPath:indexPath];
    [cell.typeBtn setImage:[UIImage imageNamed:_typeArray[indexPath.row]] forState:UIControlStateNormal];
    cell.typeBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;// UIViewContentModeCenter;
    [cell.typeBtn setImage:[UIImage imageNamed:_ntypeArray[indexPath.row]] forState:UIControlStateDisabled];
    [cell.typeBtn setImage:[UIImage imageNamed:_stypeArray[indexPath.row]] forState:UIControlStateSelected];
    cell.typeBtn.tag = 200+indexPath.row;
    return cell;
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    _selectedBtn.selected = NO;
    TypeCollectionViewCell *cell = (TypeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    _selectedBtn = cell.typeBtn;
    cell.typeBtn.selected = !cell.typeBtn.selected;
  //刘明
    fuKuanView *payView = [[NSBundle mainBundle] loadNibNamed:@"fuKuanView" owner:nil options:nil].firstObject;
    
    [self addSubview:payView];
    
    //end
}

- (IBAction)yesAction:(UIButton *)sender {
    if (_selectedBtn.tag == 205) {
        
        //vip
        fuKuanView *fuView = [[[NSBundle mainBundle]loadNibNamed:@"fuKuanView" owner:self options:nil]lastObject];
        fuView.statusString = @"vip";

        fuView.delegate = self;
        [self addSubview:fuView];
        
    }else if (_cashSelectedBtn == nil && _inputText.text.length == 0) {
        
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请填写金额" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alertView show];
        return;
    } else if(_selectedBtn.tag <=205 ){
        
                NSString *type = @"";
                switch (_selectedBtn.tag ) {
                    case 200:
                        type = @"百度钱包";
                        break;
                    case 201:
                        type = @"微信";
                        break;
                    case 202:
                        type = @"支付宝";
                        break;
                    case 203:
                        type = @"QQ";
                        break;
                    case 204:
                        type = @"Apple pay";
                        break;
                    default:
                        break;
                }
                if (_cashSelectedBtn != nil) {
                    ScanView *sV = [[[NSBundle mainBundle]loadNibNamed:@"ScanView" owner:nil options:nil]lastObject];
                    sV.titleLabel.text = type;
                    
                    [self addSubview:sV];
                }else
                {
                    ScanView *sV = [[[NSBundle mainBundle]loadNibNamed:@"ScanView" owner:nil options:nil]lastObject];
                         sV.titleLabel.text = type;
                    [self addSubview:sV];
                }
               

        
        
    }else if(_selectedBtn.tag == 206 ){
        
            fuKuanView *fuView = [[[NSBundle mainBundle]loadNibNamed:@"fuKuanView" owner:self options:nil]lastObject];
            fuView.statusString = @"card";

        
            [self addSubview:fuView];
        
    }else if(_selectedBtn.tag == 207 ){
        
        fuKuanView *fuView = [[[NSBundle mainBundle]loadNibNamed:@"fuKuanView" owner:self options:nil]lastObject];
        fuView.statusString = @"other";
        
        
        [self addSubview:fuView];
        
    }
}

-(void)fuKuanViewDidChickYes:(fuKuanView *)orderContent WithYuE:(NSString *)yue
{
//      TypeCollectionViewCell *cell = (TypeCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if ([yue doubleValue] > 0) {
        
         [_selectedBtn setImage:[UIImage imageNamed:_typeArray[5]] forState:UIControlStateNormal];
    }else {

           [_selectedBtn setImage:[UIImage imageNamed:_ntypeArray[5]] forState:UIControlStateNormal];
    }
    _selectedBtn.selected = NO;

}

- (IBAction)cancelAction:(UIButton *)sender {
    
    [self removeFromSuperview];
}


- (IBAction)cashClick:(UIButton *)sender {

    if (_cashSelectedBtn !=nil) {
        _cashSelectedBtn.backgroundColor = [UIColor whiteColor];
        [_cashSelectedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
   
    _cashSelectedBtn = sender;
    _cashSelectedBtn.backgroundColor = [UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1];
    [_cashSelectedBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
}





@end
