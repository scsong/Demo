//
//  StaticTest.m
//  demo
//
//  Created by sun cs on 13-5-7.
//  Copyright (c) 2013年 com.suncs. All rights reserved.
//

#import "StaticTest.h"

static NSString * StaticStr=@"DefaultStaticString";
static int b;

@implementation StaticTest


- (void) setStaticStr:(NSString *) _string
{
    NSLog(@"old staticstr is:%@",StaticStr);
    
    StaticStr=_string;
    
    NSLog(@"new staticstr is:%@",StaticStr);
    
}


- (void) testStatic
{

    NSLog(@"cur staticstr is:%@",StaticStr);

}


- (void) testTmpStatic
{
    static int a=2;
    
    a++;
    
    NSLog(@"cur tmpstr is:%d",a);

}


- (void) testStaticFunction
{

    function();
}


static void function()
{
    
    b++;
    //c++;
    printf("static function\n");
}



@end
