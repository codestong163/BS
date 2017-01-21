//
//  RecomCell.h
//  BSBDJ
//
//  Created by Code on 2017/1/21.
//  Copyright © 2017年 Hongjian.Lan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RecomModel;

@interface RecomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelname;
@property (weak, nonatomic) IBOutlet UIView *touchview;
@property  (nonatomic,strong)RecomModel *model;

@end
