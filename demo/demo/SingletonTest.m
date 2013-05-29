//
//  SingletonTest.m
//  demo
//
//  Created by sun cs on 13-5-7.
//  Copyright (c) 2013年 com.suncs. All rights reserved.
//

#import "SingletonTest.h"
static SingletonTest *singletonTest=nil;

@implementation SingletonTest

+ (SingletonTest *) shareInstance
{
    @synchronized (self)
    {
        if (singletonTest == nil)
        {
            singletonTest=[[[self alloc] init] autorelease];
        }
    }
    return singletonTest;
    
}


+(id)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (singletonTest == nil) {
            singletonTest = [super allocWithZone:zone];
            return  singletonTest;
        }
    }
    return nil;
}


@end
