//
//  Mybut.h
//  BSBDJ
//
//  Created by Hongjian.Lan on 2016/12/2.
//  Copyright © 2016年 Hongjian.Lan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Mybut : UIButton
- (instancetype)initWithFrame:(CGRect)frame withimage:(NSString *)image withlabel:(NSString *)label withinttag:(int )tg;
@property (nonatomic,strong)  UIImageView *view1;
@property (nonatomic,strong) UILabel *label1;


@end
