//
//  AppDelegate.m
//  ios-groups
//
//  Created by 董旭 on 17/2/14.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import "AppDelegate.h"
#import "JYHomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    JYHomeViewController *mainController = [[JYHomeViewController alloc] init];
    self.window.rootViewController = mainController;
    
    //注册微信
    [WXApi registerApp:@"wxf05f528cce4bf5d2"];
    
    return YES;
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [WXApi handleOpenURL:url delegate:self];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    return [WXApi handleOpenURL:url delegate:self];
}


@end
