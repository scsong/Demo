//
//  StaticTest2.m
//  demo
//
//  Created by sun cs on 13-5-7.
//  Copyright (c) 2013年 com.suncs. All rights reserved.
//

#import "StaticTest2.h"

@implementation StaticTest2

static NSString * StaticStr=@"DefaultStatic2String";


- (void) setStaticStr:(NSString *) _string
{
    NSLog(@"old static2str is:%@",StaticStr);
    
    StaticStr=_string;
    
    NSLog(@"new static2str is:%@",StaticStr);
    
}


- (void) testStatic
{
    
    NSLog(@"cur static2str is:%@",StaticStr);
    
}



- (void) testTmpStatic
{
    
    static int a=2;
    
    a++;
    
    NSLog(@"static2 cur tmpstr is:%d",a);

}

@end
