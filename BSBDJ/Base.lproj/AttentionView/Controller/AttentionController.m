//
//  AttentionController.m
//  BSBDJ
//
//  Created by Hongjian.Lan on 2016/11/30.
//  Copyright © 2016年 Hongjian.Lan. All rights reserved.
//

#import "AttentionController.h"

#import "RecomViewController.h"

@interface AttentionController ()

@end

@implementation AttentionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"button3", nil );
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"friendsRecommentIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(leftbarbutton:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(rightbatbutton:)];
}
//left点击的方法
- (void)leftbarbutton:(UIBarButtonItem *)but {
    RecomViewController *recom = [[RecomViewController alloc]init];
    [self.navigationController pushViewController:recom animated:YES];


}
                                               
//right点击方法
- (void)rightbatbutton:(UIBarButtonItem *)but {
                                                   
                                                   
                                                   
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
