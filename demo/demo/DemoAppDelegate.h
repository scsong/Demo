//
//  sun_csAppDelegate.h
//  demo
//
//  Created by sun cs on 13-4-23.
//  Copyright (c) 2013年 com.suncs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <mach/mach.h>
#include  <assert.h>

#include  <pthread.h>

@interface DemoAppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString *testStr;
    BOOL pageStillLoading;
    UILabel *label;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSString *testStr;
@property (nonatomic, retain) NSMutableArray *viewArray;

@end
