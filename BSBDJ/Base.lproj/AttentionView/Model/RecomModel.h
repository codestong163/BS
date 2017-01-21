//
//  RecomModel.h
//  BSBDJ
//
//  Created by Code on 2017/1/21.
//  Copyright © 2017年 Hongjian.Lan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecomModel : NSObject
//count = 7;
//id = 39;
//name = "\U8da3\U56fe";
//总数
@property (nonatomic,assign)NSInteger count;
/**id*/
@property (nonatomic,assign)NSInteger id;
/**名字*/
@property (nonatomic,copy)NSString *name;
@end
