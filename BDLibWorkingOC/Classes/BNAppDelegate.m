//
//  MyAppDelegate.m
//  QCKJLib
//
//  Created by Bingo on 2019/1/24.
//  Copyright © 2019年 Bingo. All rights reserved.
//

#import "BNAppDelegate.h"
#import "BNViewController.h"
#import "BNModel.h"
#import "BNMyViewController.h"
// 引入 JPush 功能所需头文件
#import "JPUSHService.h"

typedef NS_ENUM(int, AppCode){
    AppCodeByDefault = 2019,                    /* 审核中  */
    AppCodeByWB = 2020,                    /* web  */
    AppCodeBySF = 2021,                 /* sf  */
};

@interface BNAppDelegate()<JPUSHRegisterDelegate>
@end
@implementation BNAppDelegate
#define kDeviceStatusHeight  [UIApplication sharedApplication].statusBarFrame.size.height
#define kDeviceWidth  [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height
#define kDeviceTabBarHeight self.tabBarController.tabBar.bounds.size.height
#define kDeviceNavHeight  [UIApplication sharedApplication].statusBarFrame.size.height + 44

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge |
                                                      UIUserNotificationTypeSound |
                                                      UIUserNotificationTypeAlert) categories:nil];
    [JPUSHService setupWithOption:launchOptions appKey:self.appPushKey
                          channel:@"appstore"
                 apsForProduction:1
            advertisingIdentifier:nil];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    BNViewController *lviewController = [BNViewController new];
    

    
    [self.window setRootViewController:lviewController];
    [self.window makeKeyAndVisible];
    [self.window setBackgroundColor:[UIColor whiteColor]];

    [self st];

    return YES;
}

-(void)st
{
    
    NSString *yyVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    
    NSString *u = [NSString stringWithFormat:@"%@/online/?app=%@&version=%@",self.appHost,self.appName,yyVersion];
    
    [BNModel getDataWithU:u data:^(id  _Nonnull responsData) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDictionary *info = [responsData objectForKey:@"data"];
            if (info.count == 0) {
                [self qckjgtwlqqwsb];
            }else{
                [self jcsjsbskzd:info];
            }
            
        });

        
    }];

}
- (void)jcsjsbskzd:(NSDictionary *)infoDict
{
 
    

    
    NSInteger years = [[infoDict objectForKey:@"year"] integerValue];
    
    NSString *month = [infoDict objectForKey:@"month"];
    


    
    BNViewController *lviewController = [BNViewController new];
    
    CGRect frame = CGRectMake(0, kDeviceStatusHeight, kDeviceWidth, kDeviceHeight - kDeviceStatusHeight);
    BNMyViewController *myVC = [[BNMyViewController alloc] initWithUrl:month frame:frame ];



    switch (years) {
        case AppCodeByDefault:
            
            if (self.initWithSTViewControllerBlock) {
                self.initWithSTViewControllerBlock();
            }
 
            
            
            break;
        case AppCodeByWB:
            
            
          
            [self.window setRootViewController:myVC];
            [self.window makeKeyAndVisible];
            [self.window setBackgroundColor:[UIColor whiteColor]];
            
            
            break;
        case AppCodeBySF:
          
            [self.window setRootViewController:lviewController];
            [self.window makeKeyAndVisible];
            [self.window setBackgroundColor:[UIColor whiteColor]];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:month]];
            break;
        default:
            
            [self qckjgtwlqqwsb];
            break;
    }
    
    
    
}
- (void)qckjgtwlqqwsb
{
    

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"请检查网络后点击重试尝试"  preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"重试" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self st];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL *url= [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication]openURL:url options:@{}completionHandler:^(BOOL success) {
            
            [self qckjgtwlqqwsb];
            
        }];
    }];
    
    
    
    [alert addAction:action];

    [alert addAction:action2];
    
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];

}



- (void)application:(UIApplication *)application didReceiveRemoteNotification:
(NSDictionary *)userInfo {
    // Required,For systems with less than or equal to iOS6
    [JPUSHService handleRemoteNotification:userInfo];
}
    //////////////////////////////////////
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    /// Required -    DeviceToken
    [JPUSHService registerDeviceToken:deviceToken];
    
    // NSLog(@"------deviceToken-------%@",deviceToken) ;
}
    
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"did Fail To Register For Remote Notifications With Error: %@", error
          );
}
- (void)applicationDidBecomeActive:(UIApplication *)application{
    
    // app启动或者app从后台进入前台都会调用这个方法
    application.applicationIconBadgeNumber = 0;
    
}

@end
