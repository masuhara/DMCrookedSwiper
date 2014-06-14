//
//  DMCrookedSwipeView.m
//  DMCrookedSwiper
//
//  Created by Master on 2014/06/15.
//  Copyright (c) 2014年 jp.co.mappy. All rights reserved.
//

#import "DMCrookedSwipeView.h"

@implementation DMCrookedSwipeView

const float kWidth = 300;
const float kHeight = 300;


#pragma mark - init
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self makeView];

    }
    return self;
}

#pragma mark - GestureView

- (void)makeView
{
    /* 時計回りに45度回転 */
    CGRect rect = [[UIScreen mainScreen] applicationFrame];
    NSLog(@"%@", NSStringFromCGRect(rect));
    float x = rect.size.width/2;
    float y = rect.size.height/2;
    self.center = CGPointMake(x, y);
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/4);
    [self setTransform:transform];
    
    NSLog(@"hoge");
    
    /* ビューを作成 */
    CGRect baseRect = CGRectMake(0, 0, kWidth, kHeight);
    UIView *baseView = [[UIView alloc]initWithFrame:baseRect];
    baseView.backgroundColor = [UIColor blueColor];
    [self addSubview:baseView];
    
    /* 左上スワイプ */
    UISwipeGestureRecognizer *swipeLeftGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [baseView addGestureRecognizer:swipeLeftGesture];
    
    /* 右上スワイプ */
    UISwipeGestureRecognizer *swipeUpwardGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeUpward:)];
    swipeUpwardGesture.direction = UISwipeGestureRecognizerDirectionUp;
    [baseView addGestureRecognizer:swipeUpwardGesture];
    
    /* 左下スワイプ */
    UISwipeGestureRecognizer *swipeDownwardGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDownward:)];
    swipeDownwardGesture.direction = UISwipeGestureRecognizerDirectionDown;
    [baseView addGestureRecognizer:swipeDownwardGesture];
    
    
    /* 右下スワイプ */
    UISwipeGestureRecognizer *swipeRightGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [baseView addGestureRecognizer:swipeRightGesture];
}

#pragma mark - Gesture

- (void)swipeUpward:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"右上");
}

- (void)swipeDownward:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"左下");
}


- (void)swipeLeft:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"左上");
}


- (void)swipeRight:(UISwipeGestureRecognizer *)sender
{
    NSLog(@"右下");
}





@end
