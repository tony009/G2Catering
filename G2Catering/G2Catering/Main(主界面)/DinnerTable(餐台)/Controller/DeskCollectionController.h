//
//  DeskCollectionController.h
//  G2Catering
//
//  Created by lcc on 16/6/28.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeskCollectionController : UIViewController
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *rightCollection;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;
@end
