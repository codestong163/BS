//
//  MainViewController.m
//  BSBDJ
//
//  Created by Hongjian.Lan on 2016/11/30.
//  Copyright © 2016年 Hongjian.Lan. All rights reserved.
//

#import "MainViewController.h"
#import "NavViewController.h"
#import "HomeController.h"
#import "NewController.h"
#import "AttentionController.h"
#import "MyController.h"

#import "Mybut.h"
#import "MiddleButton.h" //中间的按钮

@interface MainViewController ()
{

    NSMutableArray *controllers; //储存控制器的数组
    NSArray *imageseleget; //点击图片的数组
    NSArray *imagearr; //按钮原本的图片
    NSInteger indexpas; //记录点击的tag
    
    

}

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    NSLog(@"%@",self);
    //添加子控制器
    [self addController];
   
   
//0x796774a0
//    0x7876b700
}
- (void)addController {
    controllers = @[].mutableCopy;
    HomeController *home = [[HomeController alloc]init];
    NewController *new = [[NewController alloc]init];
    AttentionController *atten = [[AttentionController alloc]init];
    MyController *my = [[MyController alloc]init];
    NSArray *contros = @[home,new,atten,my];
   
//    NSLog(@"%@",contros);
    for (UIViewController *controller in contros) {
        NavViewController *nav = [[NavViewController alloc]initWithRootViewController:controller];
        [controllers addObject:nav];
    }
//    NSLog(@"%@",NSLocalizedString(@"button1", nil));
    
    self.viewControllers = controllers;
    
    for (UIView *view in self.tabBar.subviews) {
        [view removeFromSuperview];
        
    }
    
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    imagearr = @[@"tabBar_essence_icon",@"tabBar_new_icon",@"tabBar_friendTrends_icon",@"tabBar_me_icon"];
    
    imageseleget = @[@"tabBar_essence_click_icon",@"tabBar_new_click_icon",@"tabBar_friendTrends_click_icon",@"tabBar_me_click_icon"];
    NSMutableArray *mutarray = [NSMutableArray array];
    //中间的按钮
    MiddleButton *midd = [MiddleButton buttonWithType:UIButtonTypeCustom];
    midd.frame = CGRectMake((self.tabBar.frame.size.width-self.tabBar.frame.size.width/5)/2, 0, self.tabBar.frame.size.width/5, self.tabBar.frame.size.height);
    [midd setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
     [midd setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
    
//    [midd setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateNormal];
//     [midd setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateSelected];
    
    [midd addTarget:self action:@selector(middebut:) forControlEvents:UIControlEventTouchUpInside];
    [self.tabBar addSubview:midd];
    
    
    
    for (int i = 0; i < 4; i++) {
        NSString *str = [NSString stringWithFormat:@"button%d",i+1];
        NSString *name = NSLocalizedString(str, nil);

        [mutarray addObject:name];
        CGFloat butwidth = self.tabBar.frame.size.width/5;
        CGFloat butwd = butwidth * ((i > 1) ? i+1 :i);
        CGFloat  butheight = self.tabBar.frame.size.height;
         Mybut *but  = [[Mybut alloc]initWithFrame:CGRectMake(butwd,0,butwidth,butheight) withimage:imagearr[i] withlabel:mutarray[i] withinttag:i];
        [but addTarget:self action:@selector(TouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        but.tag = i+100;
        if (but.tag == 100) {
            self.selectedIndex = but.tag;
            but.view1.image = [UIImage imageNamed:imageseleget[but.tag-100]];
            but.label1.textColor = [UIColor blackColor];
            indexpas = but.tag;
        }

         [self.tabBar addSubview:but];
    }
    
    
}
#pragma mark - 中间按钮的点击方法
- (void)middebut:(UIButton *)but  {
    but.selected = !but.selected;

    



}


#pragma mark - 按钮的点击方法
- (void)TouchUpInside:(Mybut *)but {

    self.selectedIndex = but.tag-100;

    if (but.tag == indexpas) {
        
        return;
    }
    else   {
        
        Mybut *button =  [self.tabBar viewWithTag:but.tag];
        button.view1.image = [UIImage imageNamed:imageseleget[but.tag-100]];
        button.label1.textColor = [UIColor blackColor];
        
        Mybut *butok =  [self.tabBar viewWithTag:indexpas];
        butok.view1.image = [UIImage imageNamed:imagearr[indexpas-100]];
        butok.label1.textColor = [UIColor whiteColor];
        
        indexpas = button.tag;
    
    }
  
    
    

}

- (void)viewWillAppear:(BOOL)animated {
      [super viewWillAppear:animated];
  


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
