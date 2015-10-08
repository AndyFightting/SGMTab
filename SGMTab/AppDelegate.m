//
//  AppDelegate.m
//  SGMTab
//
//  Created by 苏贵明 on 15/10/8.
//  Copyright (c) 2015年 苏贵明. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SGMTabViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
   
    
    ViewController* view1 = [[ViewController alloc]init];
    view1.view.backgroundColor = [UIColor grayColor];
    UINavigationController* nav1 = [[UINavigationController alloc]initWithRootViewController:view1];
    
    ViewController* view2 = [[ViewController alloc]init];
    view2.view.backgroundColor = [UIColor brownColor];
    UINavigationController* nav2 = [[UINavigationController alloc]initWithRootViewController:view2];
    
    ViewController* view3 = [[ViewController alloc]init];
    view3.view.backgroundColor = [UIColor purpleColor];
    UINavigationController* nav3 = [[UINavigationController alloc]initWithRootViewController:view3];
    
    ViewController* view4 = [[ViewController alloc]init];
    view4.view.backgroundColor = [UIColor blackColor];
    UINavigationController* nav4 = [[UINavigationController alloc]initWithRootViewController:view4];
    
    ViewController* view5 = [[ViewController alloc]init];
    view5.view.backgroundColor = [UIColor lightGrayColor];
    UINavigationController* nav5 = [[UINavigationController alloc]initWithRootViewController:view5];
    
    NSArray* vcArray = @[nav1,nav2,nav3,nav4,nav5];
    NSArray *images = @[@{NORMAL_IMAGE:@"flat_tab1",SELECTED_IMAGE:@"flat_tab1s"},
                       @{NORMAL_IMAGE:@"flat_tab2",SELECTED_IMAGE:@"flat_tab2s"},
                       @{NORMAL_IMAGE:@"flat_tab3",SELECTED_IMAGE:@"flat_tab3s"},
                       @{NORMAL_IMAGE:@"flat_tab4",SELECTED_IMAGE:@"flat_tab4s"},
                       @{NORMAL_IMAGE:@"flat_tab5",SELECTED_IMAGE:@"flat_tab5s"}];
    SGMTabViewController* tabVC = [[SGMTabViewController alloc]initWithViewControllers:vcArray andImages:images];
    tabVC.selectedIndex = 1;
    
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
