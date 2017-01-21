//
//  RecomCell.m
//  BSBDJ
//
//  Created by Code on 2017/1/21.
//  Copyright © 2017年 Hongjian.Lan. All rights reserved.
//

#import "RecomCell.h"
#import "RecomModel.h"
@implementation RecomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = QJRGBBGCL;
    self.touchview.backgroundColor = QJRGBColor(219, 21, 26);
}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

- (void)setModel:(RecomModel *)model {

    _model = model;
    
    self.labelname.text = model.name;

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.touchview.hidden = !selected;
    
    self.labelname.textColor = selected ? self.touchview.backgroundColor : QJRGBColor(78, 78, 78);
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    self.selectedBackgroundView =view;
    

}

@end
