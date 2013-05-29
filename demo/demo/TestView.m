//
//  TestView.m
//  demo
//
//  Created by sun cs on 13-4-26.
//  Copyright (c) 2013年 com.suncs. All rights reserved.
//

#import "TestView.h"
#import "UIView+Drawing.h"

@implementation TestView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 12, 12)];
        [self addSubview:imageView];
        [imageView release];
    
    
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


- (void) dealloc
{
    [super dealloc];
}

@end
