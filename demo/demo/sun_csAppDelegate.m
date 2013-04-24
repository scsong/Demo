//
//  sun_csAppDelegate.m
//  demo
//
//  Created by sun cs on 13-4-23.
//  Copyright (c) 2013年 com.suncs. All rights reserved.
//

#import "sun_csAppDelegate.h"

@implementation sun_csAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    NSString * str = @"MOMO";
    char *c = "MOMO";
    
    //将NSString 转换为char *
    const char *change = [str UTF8String];
    
    NSString *changeStr=[NSString stringWithCString:change encoding:NSUTF8StringEncoding];
    
    const int a =3;
    
    
    //输出log
    NSLog(@"str = %@ size = %lu", str,sizeof(str));
    NSLog(@"c = %s size = %lu", c, sizeof(c));
    NSLog(@"change = %s size = %lu", change, sizeof(change));
    NSLog(@"change = %@ size = %lu", changeStr, sizeof(changeStr));
    NSLog(@"a= %d",a);
    
    /*
     
     事实上这个概念谁都有,只是三种声明方式非常相似很容易记混。
     Bjarne在他的The C++ Programming Language里面给出过一个助记的方法：
     把一个声明从右向左读。
     
     char * const cp; ( * 读成 pointer to )
     cp is a const pointer to char
     
     const char * p;
     p is a pointer to const char;
     
     char * const p = "123";
     p ="456"; 是错误的， 指针不允许再指向其他地址 是一个常量指针 指针地址不能修改
     
     如 const char* p =  123;
     p[0]='4'; 是错的， 字符串内容不允许改 是一个指向常量字符的指针，字符不能修改
     
     
     
     */
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
