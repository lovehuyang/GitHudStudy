//
//  AppDelegate.m
//  GitHudStudy
//
//  Created by tzsoft on 2017/12/7.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (@available(iOS 11.0, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    
    [self addMainView];
    //启动页
    [self loadLanchView];
    
    return YES;
}

#pragma mark - 加载根控制器
- (void)addMainView{

    // 是不是已经登录
    BOOL isLogIn = [[SetupTools sharedInstance]isInLogIn];
    
    if (isLogIn) {
    // 打开数据库读取用户信息
    }
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[SetupTools sharedInstance]chooseRootViewController];
    
    [self.window makeKeyAndVisible];
}

#pragma mark -  加载启动页
- (void)loadLanchView{
    
    LanchModel *adModel = [[LanchModel alloc]init];
    adModel.adImgUrl = @"http://d.hiphotos.baidu.com/image/pic/item/f7246b600c3387444834846f580fd9f9d72aa034.jpg";
    adModel.adContentUrl = @"http://www.baidu.com";
    LanchViewManger *lvc = [LanchViewManger lanchViewController];
    lvc.adModel = adModel;
    
    //获取窗口的根视图
    UIViewController *vc = [self.window rootViewController];
    //把启动页加载到根视图上
    [lvc showLanchViewToView:vc.view];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
