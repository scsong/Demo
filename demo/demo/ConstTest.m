//
//  ConstTest.m
//  demo
//
//  Created by sun cs on 13-5-7.
//  Copyright (c) 2013年 com.suncs. All rights reserved.
//

#import "ConstTest.h"

@implementation ConstTest

- (void) testConst
{
    
    /*
     
     Bjarne在他的The C++ Programming Language里面给出过一个助记的方法：
     把一个声明从右向左读。
     
     char * const cp; ( * 读成 pointer to )
     cp is a const pointer to char
     
     const char * p;
     p is a pointer to const char;
     
     char * const p = "123";
     p ="456"; 是错误的， 指针不允许再指向其他地址
     
     如 const char* p =  123;
     p[0]='4'; 是错的， 字符串内容不允许改
     
     */

    
    
    char str1[] = "abc";
    
    const char str2[] = "abc";
    
    if (str1==str2) {
        NSLog(@"str1 is equal str2");
    }
    
    
    str1[0]='4';
    
    // 不能改变数组内容
    //str2[0]='4';
    
    
    char *str5 = "abc";
    
    const char *str7 = "abc";

    if (str5==str7) {
        NSLog(@"str5 is equal str7");
    }
    
    
    str5="def";
    

    //str5[0]='r';
    
    
    str7="def";
    
    //
    //str7[0]='d';
    
    
    NSLog(@"str5 is :%@",[NSString stringWithCString:str5 encoding:NSUTF8StringEncoding]);
    

}

@end
