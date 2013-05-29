//
//  OperateQueueTest.m
//  demo
//
//  Created by sun cs on 13-5-7.
//  Copyright (c) 2013年 com.suncs. All rights reserved.
//

#import "OperateQueueTest.h"

@implementation OperateQueueTest


- (id) init
{
    self=[super init];
    if (self) {
    
        
    }
    
    
    return self;

}



- (void) downloadImage{
    
    NSInvocationOperation *operation1 = [[NSInvocationOperation alloc]initWithTarget:self
                                                                            selector:@selector(downloadImage1:)
                                                                              object:@"http://www.zjjzx.cn/upload/news/201109/20110912105324104372.JPG"];
    
    NSInvocationOperation *operation2 = [[NSInvocationOperation alloc]initWithTarget:self
                                                                            selector:@selector(downloadImage2:)
                                                                              object:@"http://www.zjjzx.cn/upload/news/201109/20110912105331579470.JPG"];
    
    NSLog(@"开始下载");
    
    // 默认调用的是main方法
    [operation1 start];
    
    [operation2 start];
    
    NSLog(@"完成下载");
    
    // 调用异步方法
    /*
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperation:operation1];
    [queue addOperation:operation2];
    [queue setMaxConcurrentOperationCount:1];
     */
    
}


-(void)downloadImage1:(NSString *)url{
    NSLog(@"url:%@", url);
    NSURL *nsUrl = [NSURL URLWithString:url];
    NSData *data = [[NSData alloc]initWithContentsOfURL:nsUrl];
    UIImage * image = [[UIImage alloc]initWithData:data];
    [self performSelectorOnMainThread:@selector(updateImage1:) withObject:image waitUntilDone:YES];
}
-(void)updateImage1:(UIImage*) image{
    
    NSLog(@"下载1完毕");
}
-(void)downloadImage2:(NSString *)url{
    NSLog(@"url:%@", url);
    NSURL *nsUrl = [NSURL URLWithString:url];
    NSData *data = [[NSData alloc]initWithContentsOfURL:nsUrl];
    UIImage * image = [[UIImage alloc]initWithData:data];
    [self performSelectorOnMainThread:@selector(updateImage2:) withObject:image waitUntilDone:YES];
}
-(void)updateImage2:(UIImage*) image{
    NSLog(@"下载2完毕");
}




@end
