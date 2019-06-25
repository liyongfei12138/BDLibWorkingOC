//
//  MyAppDelegate.h
//  QCKJLib
//
//  Created by Bingo on 2019/1/24.
//  Copyright © 2019年 Bingo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



typedef void (^initWithSTViewControllerBlock)(void);


@interface BNAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, copy) initWithSTViewControllerBlock initWithSTViewControllerBlock;
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, copy) NSString *appName;
@property (nonatomic, copy) NSString *appPushKey;

@property (nonatomic, copy) NSString *appHost;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary * _Nullable)launchOptions;



@end

NS_ASSUME_NONNULL_END
