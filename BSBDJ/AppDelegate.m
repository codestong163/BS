//
//  AppDelegate.m
//  BSBDJ
//
//  Created by Hongjian.Lan on 2016/11/30.
//  Copyright © 2016年 Hongjian.Lan. All rights reserved.
//

#import "AppDelegate.h"

#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    MainViewController *main = [[MainViewController alloc]init];
    UIViewController *viewC = [[UIViewController alloc]init];
    viewC.view.backgroundColor = [UIColor orangeColor];
    self.window.rootViewController = main;
     [self.window makeKeyAndVisible];
    
    return YES;
}






@end
