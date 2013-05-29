//
//  sun_csAppDelegate.m
//  demo
//
//  Created by sun cs on 13-4-23.
//  Copyright (c) 2013年 com.suncs. All rights reserved.
//

#import "DemoAppDelegate.h"

#import "TestView.h"

@implementation DemoAppDelegate
@synthesize string;
@synthesize viewArray;

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (void) setString:(NSString *) _string
{
    
    NSLog(@"%@",[_string description]);
    
    [string release];
     string=nil;
    
    string=[_string retain];
    
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
    
    
    int pages=10;
    
    for (int num = 0; num < pages; num++) {
        
        report_memory();
        
        TestView * zoomView = [[TestView alloc] initWithFrame:CGRectMake(0, num*20, 10, 10)];
        zoomView.backgroundColor = [UIColor redColor];
        //[self.window addSubview:zoomView];
        
        //[self.viewArray addObject:zoomView];
        
        
        
        NSLog(@"1:%d",[zoomView retainCount]);
        report_memory();
        
        [zoomView release];
        
        NSLog(@"2:%d",[zoomView retainCount]);
        report_memory();
        
        
        zoomView = nil;
        
        NSLog(@"3:%d",[zoomView retainCount]);
        report_memory();
        
        
    }

    

    //   test 基本NSString char
    
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
     p ="456"; 是错误的， 指针不允许再指向其他地址 
     
     如 const char* p =  123;
     p[0]='4'; 是错的， 字符串内容不允许改 
     p ="456"; 是错误的， 指针不允许再指向其他地址
     
     如 const char* p =  123;
     p[0]='4'; 是错的， 字符串内容不允许改
     
     
     */
    

    //   test 基本数据类型
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
    
    
    
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    NSRunLoop *mainloop=[NSRunLoop mainRunLoop];
    if (runloop==mainloop) {
        NSLog(@"当前loop为mainloop");
    }
    
    //NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(myTimerAction:) userInfo:nil repeats:YES];
    //NSTimer *timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(myTimerAction:) userInfo:nil repeats:YES];
    //[runloop addTimer:timer forMode:NSRunLoopCommonModes];
    //[runloop addTimer:timer forMode:UITrackingRunLoopMode];
    
    //[self performSelectorOnMainThread:@selector(calculate:) withObject:nil waitUntilDone:NO];
    //NSLog(@"1111");
    
    
    
    label=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    label.backgroundColor=[UIColor yellowColor];
    [self.window addSubview:label];
    
    
    
    pageStillLoading = YES;
    // init a new Thread and start it
    [NSThread detachNewThreadSelector:@selector(loadPageInBackground:)toTarget:self withObject:nil];
    
//    while (pageStillLoading) {
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
//    }
    NSLog(@"完成");
    
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
    for (int i=0; i<10; i++) {
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
