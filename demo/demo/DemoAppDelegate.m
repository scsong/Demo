//
//  sun_csAppDelegate.m
//  demo
//
//  Created by sun cs on 13-4-23.
//  Copyright (c) 2013年 com.suncs. All rights reserved.
//

#import "DemoAppDelegate.h"
#import "TestView.h"
#import "StaticTest.h"
#import "StaticTest2.h"
#import "ConstTest.h"
#import "SingletonTest.h"
#import "OperateQueueTest.h"
#import "NSArrayTest.h"
#import "UIView+Drawing.h"

@implementation DemoAppDelegate
@synthesize testStr;
@synthesize viewArray;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (void) setTestStr:(NSString *) _string
{
    
    NSLog(@"%@",[_string description]);
    
    [testStr release];
     testStr=nil;
    
    testStr=[_string retain];
    
    _string=[NSString stringWithFormat:@"2222222"];
    NSLog(@"%@",_string);

}

void report_memory(void) {
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kerr = task_info(mach_task_self(),
                                   TASK_BASIC_INFO,
                                   (task_info_t)&info,
                                   &size);
    if( kerr == KERN_SUCCESS ) {
        NSLog(@"Memory in use (in bytes): %u", info.resident_size);
    } else {
        NSLog(@"Error with task_info(): %s", mach_error_string(kerr));
    }
}

#pragma mark -
#pragma mark 判定任意给定的一个数是否是2的n次方

BOOL checkisPower(int n)
{
    
    BOOL ispower=NO;
    
    int low=n%2;
    
    if (low==0) {
        
        if (n==0) {
            
            ispower=NO;
            
        }else
        {
            int tmplow=n/2;
            
            ispower=checkisPower(tmplow);
        }
    
    }else
    {
    
        if (n==1) {
            ispower= YES;
        }
        
    }
    
    return ispower;
    
}

BOOL checkisPower2(int num)
{
    int i = 1;
    while (true)
    {
        if (i > num)
            return false;
        if (i == num)
            return true;
        i = i * 2;
    }
}

BOOL checkisPower3(int num)
{
    int low=num;
    
    if (low==0) {
        return NO;
    }
    
    while (true)
    {
       
        if (low%2==0) {
            low=low/2;
        }else
        {
            if (low==1) {
                return YES;
            }
            return NO;
        }
        
        
    }
}


#pragma mark -
#pragma mark 判定一个数是不是另一个数的n次方


BOOL isPower(int m, int n)

{
    if (n==0) {
        return NO;
    }
    
    if (n==1) {
        
        if (m==1)
            return YES;
        else
            return NO;
    }
    
    int low=m;
    while (true) {
        
        if (low%n==0) {
            low=low/n;
        }else
        {
            if (low==1) 
            return YES;
        
            return NO;
        }
    }
    
}



#pragma mark -
#pragma mark 二分法查找对应元素
/**
 *	@brief	递归算法 二分法查找
 *
 *	@param 	a 	将要查找的数组
 *	@param 	key 	要查找的值
 *	@param 	low 	最低标示位
 *	@param 	high 	最高标示位
 *
 *	@return	key对应与a中的下标
 */
int recurbinary(int *a,int key,int low,int high)

{
    int mid;
    if(low > high)
        return -1;
    mid = (low + high)/2;
    if(a[mid] == key) return mid;
    else if(a[mid] > key)
        return recurbinary(a,key,low,mid -1);
    else
        return recurbinary(a,key,mid + 1,high);
}


/**
 *	@brief	循环算法 二分法查找
 *
 *	@param 	a 	将要查找的数组
 *	@param 	key 	要查找的值
 *	@param 	n 	总的数组的个数
 *
 *	@return	key对应与a中的下标
 */
int binary( int *a, int key, int n )
{
    int low = 0, high = n, mid;
    mid = (low + high) / 2;
    
        
    while(low <= high)
    {
        if(a[mid] == key)
            return mid;

        
        if(a[mid] < key)
            low = mid + 1;
        else if(a[mid] > key)
            high = mid - 1;
        mid = (low + high) / 2;
    }
    
    return -1;
}

#pragma mark - 
#pragma mark 排序算法


#pragma mark -
#pragma mark 冒泡排序

void bubble_sort(int *a, int n)
{
    int *p1 = a;
    int *p2 = a;
    int k;
    int j;
    for (int i = 0; i < n; i++)
    {
        p2 = p1;
        p2++;
        for (j = n - i - 1; j > 0; j--)
        {
            if (*p2 < *p1) // 升序
            {
                k = *p1;
                *p1 = *p2;
                *p2 = k;
            }
            p2++;
        }
        p1++;
    }
}



void bubble_Asort(int *a, int n)
{
    
    BOOL flag=NO;

    for (int i=0; i < n; i++) {
        
        flag=NO;
        
        for (int j=0; j<n-i-1; j++) {
    
            if (a[j]>a[j+1]) {
                
                int tmp=a[j];
                a[j]=a[j+1];
                a[j+1]=tmp;
                flag=YES;
                
            }
        }
        
        
        if (!flag) {
            return ;
        }
        
    }
    
}




#pragma mark -
#pragma mark static 关键字

- (void) staticTest
{
    StaticTest *test1=[[StaticTest alloc] init];
    
    [test1 testStatic];
    
    [test1 setStaticStr:@"test1"];
    
    [test1 release];
    
    
    StaticTest *test2=[[StaticTest alloc] init];
    
    [test2 setStaticStr:@"test2"];
    
    [test2 release];
    
    
    StaticTest *test3=[[StaticTest alloc] init];
    
    [test3 testStatic];
    
    [test3 testTmpStatic];
    
    [test3 testTmpStatic];
    
    [test3 release];
    
    
    StaticTest *test4=[[StaticTest alloc] init];
    
    [test4 testTmpStatic];
    
    [test4 testTmpStatic];
    
    [test4 release];
    
    
    
    StaticTest2 *test5=[[StaticTest2 alloc] init];
    
    [test5 testStatic];
    
    [test5 testTmpStatic];
    
    [test5 testTmpStatic];
    
    [test5 release];
    
}


#pragma mark -
#pragma mark const 关键字

- (void) constTest
{
    
    ConstTest *test1=[[ConstTest alloc] init];
    [test1 testConst];
    [test1 release];

}

#pragma mark -
#pragma mark singleton 测试

- (void) singletonTest
{
    SingletonTest *test=[SingletonTest shareInstance];
    
    NSLog(@"1 retaincount :%d",[test retainCount]);
    
    SingletonTest *test2=[[SingletonTest alloc] init];
    
    NSLog(@"2 retaincount :%d",[test2 retainCount]);
    
    [test2 release];
    
    NSLog(@"3 retaincount :%d",[test2 retainCount]);
    
    NSLog(@"%@",test);
    
    
    NSFileManager *manager=[NSFileManager defaultManager];
    
    
    NSLog(@"4 retaincount :%d",[manager retainCount]);
    
    
    NSFileManager *manager2=[[NSFileManager alloc] init];
    
    if (manager==manager2) {
        NSLog(@"相同的manager");
    }
    

}

#pragma mark -
#pragma mark NSTimer 测试

- (void) testNSTimer
{
    
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    NSRunLoop *mainloop=[NSRunLoop mainRunLoop];
    if (runloop==mainloop) {
        NSLog(@"当前loop为mainloop");
    }else
    {
        // execept mainRunLoop other runloop should you start mainrunloop autostart
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:3]];
    }
    
    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:0 target:self selector:@selector(myTimerAction:) userInfo:nil repeats:NO];
    [runloop addTimer:timer forMode:NSRunLoopCommonModes];
    [runloop addTimer:timer forMode:UITrackingRunLoopMode];

}


- (void) myTimerAction:(id) sender
{
    NSLog(@"begin********************************");
    for (int i=0;i<10000; i++) {
        NSLog(@"-------------------------------%d",i);
    }
    NSLog(@"end********************************");

}

#pragma mark -
#pragma mark View Frame Bounds test
- (void) testViewFrameAndBounds
{

    UIView *topView=[[UIView alloc] initWithFrame:CGRectMake(100, 0, 120, 100)];
    [topView setBackgroundColor:[UIColor redColor]];
    [self.window addSubview:topView];
    
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(100, 100, 120, 240)];
    [self.window addSubview:view];
    view.backgroundColor=[UIColor magentaColor];
    NSLog(@"view center x=======%f",view.center.x);
    NSLog(@"view center y=======%f",view.center.y);
    view.bounds=CGRectMake(-50, 0, 80, 200);
    //[view setClipsToBounds:YES];
    //view.frame=CGRectMake(100, 100, 120, 240);
    NSLog(@"bounds width=======%f",view.bounds.size.width);
    NSLog(@"bounds height======%f",view.bounds.size.height);
    NSLog(@"bounds origin x=======%f",view.bounds.origin.x);
    NSLog(@"bounds origin y=======%f",view.bounds.origin.y);
    NSLog(@"view center x=======%f",view.center.x);
    NSLog(@"view center y=======%f",view.center.y);
    
    NSLog(@"view width=======%f",view.frame.size.width);
    NSLog(@"view height======%f",view.frame.size.height);
    NSLog(@"view origin x=======%f",view.frame.origin.x);
    NSLog(@"view origin y=======%f",view.frame.origin.y);
    
    [view setFrame:CGRectMake(100, 100, 120, 240)];
    
    
    
    NSLog(@"bounds width=======%f",view.bounds.size.width);
    NSLog(@"bounds height======%f",view.bounds.size.height);
    NSLog(@"bounds origin x=======%f",view.bounds.origin.x);
    NSLog(@"bounds origin y=======%f",view.bounds.origin.y);
    
    
    view.bounds=CGRectMake(0, 100, 80, 200);
    
    UIView *contentView=[[UIView alloc] initWithFrame:CGRectMake(0, 10, 80, 80)];
    contentView.backgroundColor=[UIColor blueColor];
    [view addSubview:contentView];
    [contentView release];
    contentView=nil;
    
    
    contentView=[[UIView alloc] initWithFrame:CGRectMake(138, 100, 80, 80)];
    contentView.backgroundColor=[UIColor blueColor];
    [view addSubview:contentView];
    [contentView release];
    contentView=nil;
    
    
    
    [UIView animateWithDuration:2.0 animations:^{
        //view.bounds=CGRectMake(0, 0, 300, 240);
    }];
    
    
    [view release];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    self.viewArray=[NSMutableArray array];
    
    /*
     //冒泡排序  
     
     int brr[] = { 677, 1, 1, 56, 56, 12, 9, 7, 11, 67 };
     
     bubble_Asort(brr , sizeof(brr)/sizeof(brr[0]));
     
    */
    
    
    
    /*
     //test 二分法查找
     
    int arr[] = {1,2,3,4,5,6,7,8,9,12,13,45,67,89,99,101,111,123,134,565,677};
    int brr[] = { 677, 1, 7, 11, 67 };
    int x;
    for( x=0; x<sizeof(brr)/sizeof(brr[0]); x++ )
    {
        //printf( "%d\n", recurbinary(arr,brr[x],0,sizeof(arr)/sizeof(arr[0])-1) );
        //printf( "%d\n", binary( a, 45, sizeof(a)/sizeof(a[0])-1 ));
    }
    */
    
    
    // test ispower
    int number=12;
    BOOL ispower=isPower(number,3);
    if (ispower) {
        
    }
    
    int pages=10;
    
    for (int num = 0; num < pages; num++) {
        
        report_memory();
        
        TestView * zoomView = [[TestView alloc] initWithFrame:CGRectMake(0, num*20, 10, 10)];
        zoomView.backgroundColor = [UIColor redColor];
        [self.window addSubview:zoomView];
        
        //[self.viewArray addObject:zoomView];
        
        
        
        NSLog(@"1:%d",[zoomView retainCount]);
        //report_memory();
        
        [zoomView release];
        
        NSLog(@"2:%d",[zoomView retainCount]);
        //report_memory();
        
        
        zoomView = nil;
        
        NSLog(@"3:%d",[zoomView retainCount]);
        //report_memory();
        
        
    }

    

    //  test 基本NSString char
    /*
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
    */
    

    //   test 基本数据类型
    /*
    int i = 100;
    //浮点型
    float f = 1.1;
    //双浮点型
    double d = 2.2;
    //短整型
    short int si = 200;
    //长整型
    long long int ll = 123324123234123L;
    
    
    //输出数据与内存中所占字节数
    //整型
    NSLog(@"i = %d size = %lu byte ",i, sizeof(i));
    //浮点型
    NSLog(@"f = %f size = %lu byte",f,sizeof(f));
    //双浮点型
    NSLog(@"d = %e size = %lu byte",d,sizeof(d));
    //短整型
    NSLog(@"si = %hi size = %lu byte",si,sizeof(si));
    //长整型
    NSLog(@"ll = %lli size = %lu byte",ll,sizeof(si));
    */
    
    
    // NSTimer test
    
    
    label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    label.backgroundColor=[UIColor yellowColor];
    [self.window addSubview:label];
    
    
    
    pageStillLoading = YES;
    // test new Thread
    
    /*
    [NSThread detachNewThreadSelector:@selector(loadPageInBackground:)toTarget:self withObject:nil];
    
//    while (pageStillLoading) {
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//    }
    NSLog(@"完成");
     */
    
    
    
    
    // static test
    /*
    StaticTest *test=[[StaticTest alloc] init];
    
    [test testTmpStatic];
    
    [test testTmpStatic];
    
    
    [test testStaticFunction];
    
    [test release];
    
    
    [self staticTest];
    */
    
    
    // const test
    
    /*
    [self constTest];
     */
    
    
    // singleton test
    /*
    [self singletonTest];
    
    SingletonTest *singletonTest=[SingletonTest shareInstance];
    NSLog(@"%@",singletonTest);
     */
    
    
    // OperateQueue test
    /*
    OperateQueueTest *queueTest=[[OperateQueueTest alloc] init];
    //[queueTest downloadImage];
    //[queueTest performSelectorInBackground:@selector(downloadImage) withObject:nil];
    
    [NSThread detachNewThreadSelector:@selector(downloadImage) toTarget:queueTest withObject:nil];
    */
    
    
    // array test
    /*
    NSArrayTest *arrTest=[[NSArrayTest alloc] init];
    [arrTest filteredArray];
    [arrTest release];
   */
    

    
    // view frame bounds test
    //[self testViewFrameAndBounds];
    
    return YES;
}

- (void) calculate:(id) sender
{
    while (true) {
        //NSLog(@"222");
    }
    
    
}

/**
 *	@brief	Update UI
 *
 *	@param 	sener the UI label show string
 */
- (void) updateUI:(id) sender
{
    label.text=(NSString *) sender;
}

/**
 *	@brief	do something in another thread
 *
 *	@param 	sener a void point
 */
- (void) loadPageInBackground:(id) sener
{
    
    //[self testNSTimer];
    
    for (int i=0; i<1000; i++) {
        
        NSLog(@"%d",i);
        // Should update UI in mainThread
        [self performSelectorOnMainThread:@selector(updateUI:) withObject:[NSString stringWithFormat:@"%d",i] waitUntilDone:NO];
    }
    
    pageStillLoading=NO;
     
}




int jos(int n,int k)
{// 每次运行都返回当前淘汰出来的位置
	int x;
	if(n==1)	// 当剩下最后一个的时候他就是获胜者
		x=1;
	else
	{// 如果多余一个
		x=(jos(n-1,k)+k)%n;	// 继续从剩余的这些人中进行选取获胜（%n达到了循环的目的）（这里利用n-1时的淘汰位置加上k是下一个淘汰位置， 此时n又被减少）
		if(x==0)
			x=n;
	}
	
	return x;
}


/**
 *	@brief	the posix thread will start with is method
 *
 *	@param 	data a void point
 */
void* PosixThreadMainRoutine(void* data)
{
    // Do some work here.
    return NULL;
}

/**
 *	@brief	Create the thread using POSIX routines.
 */
void LaunchThread()

{
    // Create the thread using POSIX routines.
    pthread_attr_t  attr;
    pthread_t       posixThreadID;
    int             returnVal;
    returnVal = pthread_attr_init(&attr);
    assert(!returnVal);
    returnVal = pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
    assert(!returnVal);
    int     threadError = pthread_create(&posixThreadID, &attr, &PosixThreadMainRoutine, NULL);
    returnVal = pthread_attr_destroy(&attr);
    assert(!returnVal);
    if (threadError != 0)
    {
        // Report an error.
    }
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
