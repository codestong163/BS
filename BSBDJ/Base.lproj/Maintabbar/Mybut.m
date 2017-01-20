//
//  Mybut.m
//  BSBDJ
//
//  Created by Hongjian.Lan on 2016/12/2.
//  Copyright © 2016年 Hongjian.Lan. All rights reserved.
//

#import "Mybut.h"


@interface Mybut () {

  
}

@end

@implementation Mybut



- (instancetype)initWithFrame:(CGRect)frame withimage:(NSString *)image withlabel:(NSString *)label withinttag:(int )tg{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"%@",image);
        NSLog(@"%@",label);
        _view1 = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width-25)/2, 5, 25, 25)];
        _view1.image = [UIImage imageNamed:image];
        _view1.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:_view1];
      
        
        _label1 = [[UILabel alloc]initWithFrame:CGRectMake((frame.size.width-35)/2, (49-25)+3, 35, 26)];
        _label1.text = label;
        _label1.textAlignment = NSTextAlignmentCenter;
        _label1.font = [UIFont systemFontOfSize:12];
        _label1.textColor = [UIColor whiteColor];
        [self addSubview:_label1];
        
        
//        _imagar = @[@"tabBar_essence_icon",@"tabBar_new_icon",@"tabBar_friendTrends_icon",@"tabBar_me_icon"];

    }
    return self;
}

//
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//
//    
//    if (isbool == YES) {
//        _label1.textColor = [UIColor whiteColor];
//        _view1.image = [UIImage imageNamed:_imagar[l]];
//        
//         isbool = NO;
//    }
//    else if ( isbool == NO){
//        _label1.textColor = [UIColor blackColor];
//        _view1.image = [UIImage imageNamed:_imagearr[l]];
//        isbool = YES;
//    }
//   
//
//}
@end
