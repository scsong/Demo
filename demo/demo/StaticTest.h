//
//  StaticTest.h
//  demo
//
//  Created by sun cs on 13-5-7.
//  Copyright (c) 2013年 com.suncs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StaticTest : NSObject
{
    
    int c;
    
}


- (void) setStaticStr:(NSString *) _string;

- (void) testStatic;

- (void) testTmpStatic;

- (void) testStaticFunction;

static void function();

@end
