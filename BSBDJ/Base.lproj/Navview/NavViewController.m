//
//  NavViewController.m
//  BSBDJ
//
//  Created by Hongjian.Lan on 2016/11/30.
//  Copyright © 2016年 Hongjian.Lan. All rights reserved.
//

#import "NavViewController.h"

@interface NavViewController ()

@end

@implementation NavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [UIColor colorWithRed:210/255.0 green:0 blue:64/225.0 alpha:1];
    
}
//设置状态栏
- (UIStatusBarStyle)preferredStatusBarStyle {

    return UIStatusBarStyleLightContent;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
        but.frame = CGRectMake(0, 0, 30, 30);
        [but setTitle:NSLocalizedString(@"返回", nil) forState:UIControlStateNormal];
        [but setImage:[UIImage imageNamed:@"navigationButtonReturnClick"] forState:UIControlStateNormal];
        UIBarButtonItem *butleft = [[UIBarButtonItem alloc]initWithCustomView:but];
        
        [but sizeToFit];
        UIBarButtonItem *newbut = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        newbut.width = -15;
        viewController.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:newbut,butleft,nil];
        [but addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:but];
    }
    [super pushViewController:viewController animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)pop  {
    
    [self popViewControllerAnimated:YES];
    
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
