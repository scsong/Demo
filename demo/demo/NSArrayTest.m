//
//  NASrrayTest.m
//  demo
//
//  Created by sun cs on 13-5-9.
//  Copyright (c) 2013年 com.suncs. All rights reserved.
//

#import "NSArrayTest.h"

@implementation NSArrayTest



- (void) filteredObject
{
    // 对单个对象操作
    
    
    NSMutableDictionary *obj=[NSMutableDictionary dictionary];
    [obj setObject:@"jim" forKey:@"name"];
    [obj setObject:@"12" forKey:@"age"];
    
    
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"name==%@",@"jim"];//注意这里%@没有被单引号引用
    
    BOOL match=[predicate evaluateWithObject:obj];//obj使用valueForKeyPath取得name属性的值，与jim对比。
    
    
    predicate = [NSPredicate predicateWithFormat:@"age==%@",@"10"];//注意这里%@没有被单引号引用
    match=[predicate evaluateWithObject:obj];//obj使用valueForKeyPath取得name属性的值，与jim对比。
    
    /*
    predicate = [NSPredicate predicateWithFormat:@"innerObj.name=='%@'", “jim”];
    match=[predicate evaluateWithObject:obj];//obj使用成员innerObj的name的值与jim对比。
     */
     
}


- (void) filteredArray
{
    
    NSMutableArray *numArray=[NSMutableArray array];
    for (int i=0; i<10; i++) {
        NSMutableDictionary *dic=[NSMutableDictionary dictionary];
        [dic setObject:[NSString stringWithFormat:@"%d",i] forKey:@"NUM"];
        
        
        [numArray addObject:dic];
    };
    
    [numArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        int num=[[obj objectForKey:@"NUM"] intValue];
        if (num%2==0) {
            NSLog(@"%d is 偶数",num);
        }
        
    }];
    
    NSDictionary *bindings = [NSDictionary dictionaryWithObject:[NSNumber numberWithInt:2] forKey:@"NUM"];
    
    
    NSPredicate* _predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary * bindings) {
        
        
        int num=[[evaluatedObject objectForKey:@"NUM"] intValue];
        
        int expectedValue = [[bindings valueForKey:@"NUM"] intValue];
        return (num == expectedValue);
    }];
    
    NSIndexSet *indexs= [numArray indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        
        int num=[[obj objectForKey:@"NUM"] intValue];
        if (num%2==0) {
            return YES;
        }
        
        return NO;
    }];
    
    NSLog(@"%@",indexs);
    
    // filter array use string
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"NUM BETWEEN {'3','8'}"];
    NSArray* resultArr=[numArray filteredArrayUsingPredicate:predicate];
    
    
    // filter array use block
    /*
    NSPredicate* predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        
        int num=[[evaluatedObject objectForKey:@"NUM"] intValue];
        if (num%2==0) {
            return YES;
        }
        
        return NO;
        
    }];
    
    
    NSArray* resultArr=[numArray filteredArrayUsingPredicate:predicate];
     
    */
    NSLog(@"the filter resultarr is : %@",resultArr);
    
    

}


NSInteger intSort(id num1, id num2, void *context)

{
    int v1 = [num1 intValue];
    int v2 = [num2 intValue];
    if (v1 < v2)
        return NSOrderedDescending;
    else if (v1 > v2)
        return NSOrderedAscending;
    else
        return NSOrderedSame;
}


- (void) sortArray
{

    NSArray *numArray=[NSArray arrayWithObjects:[NSNumber numberWithInt:2],[NSNumber numberWithInt:1],
                       [NSNumber numberWithInt:2],[NSNumber numberWithInt:5],[NSNumber numberWithInt:4],
                       [NSNumber numberWithInt:12],[NSNumber numberWithInt:10],[NSNumber numberWithInt:20], nil];
    
    // sort by NSSortDescriptor
    /*
    NSSortDescriptor *desctiptor=[NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSMutableArray *sortArr= [NSMutableArray arrayWithObjects:desctiptor, nil];
    NSArray *resultArr= [numArray sortedArrayUsingDescriptors:sortArr];
     */
    
    // sort by system selector
    /*
    NSArray *resultArr=[numArray sortedArrayUsingFunction:intSort context:NULL];
    resultArr=[numArray sortedArrayUsingSelector:@selector(compare:)];
    */
    
    // sort by Compatator
    
    NSArray *resultArr=[numArray sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        int v1 = [obj1 intValue];
        int v2 = [obj2 intValue];
        if (v1 < v2)
            return NSOrderedDescending;
        else if (v1 > v2)
            return NSOrderedAscending;
        else
            return NSOrderedSame;
        
    }];
    
    
    NSLog(@"the sort resultarr is : %@",resultArr);
    
    
}


@end
