//
//  DMCrookedSwipeView.m
//  DMCrookedSwiper
//
//  Created by Master on 2014/06/15.
//  Copyright (c) 2014年 jp.co.mappy. All rights reserved.
//

#import "DMCrookedSwipeView.h"

@implementation DMCrookedSwipeView



#pragma mark - init
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        /* -- ビューの作成 -- */
        [self makeView];
    }
    return self;
}

#pragma mark - GestureView

- (void)makeView
{
    //動く速度
    moveX = 5;
    moveY = 5;
    
    /* 時計回りに45度回転 */
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI/4);
    [self setTransform:transform];
    
    /* 左上スワイプ */
    UISwipeGestureRecognizer *swipeLeftGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipeLeftGesture];
    
    /* 右上スワイプ */
    UISwipeGestureRecognizer *swipeUpwardGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeUpward:)];
    swipeUpwardGesture.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:swipeUpwardGesture];
    
    /* 左下スワイプ */
    UISwipeGestureRecognizer *swipeDownwardGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDownward:)];
    swipeDownwardGesture.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipeDownwardGesture];
    
    
    /* 右下スワイプ */
    UISwipeGestureRecognizer *swipeRightGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeRight:)];
    swipeRightGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self addGestureRecognizer:swipeRightGesture];
}

#pragma mark - Gesture

- (void)swipeUpward:(UISwipeGestureRecognizer *)sender
{
    NSDictionary *dic = [NSDictionary dictionaryWithObject:sender.view forKey:@"view"];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveMarbles:) userInfo:dic repeats:YES];
    [timer fire];
    
    sender.view.tag = 1;
}

- (void)swipeRight:(UISwipeGestureRecognizer *)sender
{
    NSDictionary *dic = [NSDictionary dictionaryWithObject:sender.view forKey:@"view"];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveMarbles:) userInfo:dic repeats:YES];
    [timer fire];
    
    sender.view.tag = 2;
    
}

- (void)swipeDownward:(UISwipeGestureRecognizer *)sender
{
    NSDictionary *dic = [NSDictionary dictionaryWithObject:sender.view forKey:@"view"];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveMarbles:) userInfo:dic repeats:YES];
    [timer fire];
    
    sender.view.tag = 3;
}


- (void)swipeLeft:(UISwipeGestureRecognizer *)sender
{
    NSDictionary *dic = [NSDictionary dictionaryWithObject:sender.view forKey:@"view"];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(moveMarbles:) userInfo:dic repeats:YES];
    [timer fire];
    
    sender.view.tag = 4;
}





- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    /* ジェスチャーの同時認識を可能に */
    return YES;
}



- (void)moveMarbles:(NSTimer *)timer
{
    NSDictionary *dic = [timer userInfo];
    DMCrookedSwipeView *swipedView = [dic objectForKey:@"view"];
    
    if (swipedView.tag == 1) {
        swipedView.center = CGPointMake(swipedView.center.x + moveX, swipedView.center.y - moveY);
        // ballと横壁の当たり判定
        if(swipedView.center.x - swipedView.bounds.size.width / 2 < 0) moveX = - moveX;
        if(swipedView.center.x + swipedView.bounds.size.width / 2 >320) moveX = - moveX;
        
        //上下の壁との当たり判定
        if(swipedView.center.y - swipedView.bounds.size.height / 2 < 124) moveY = - moveY;
        if(swipedView.center.y + swipedView.bounds.size.height / 2 > 444) moveY = - moveY;
        
        
    }else if (swipedView.tag == 2){
        swipedView.center = CGPointMake(swipedView.center.x + moveX, swipedView.center.y + moveY);
        // ballと横壁の当たり判定
        if(swipedView.center.x - swipedView.bounds.size.width / 2 < 0) moveX = - moveX;
        if(swipedView.center.x + swipedView.bounds.size.width / 2 > 320) moveX = - moveX;
        
        //上下の壁との当たり判定
        if(swipedView.center.y - swipedView.bounds.size.height / 2 < 124) moveY = - moveY;
        if(swipedView.center.y + swipedView.bounds.size.height / 2 > 444) moveY = - moveY;
        
    }else if (swipedView.tag == 3){
        swipedView.center = CGPointMake(swipedView.center.x - moveX, swipedView.center.y + moveY);
        // ballと横壁の当たり判定
        if(swipedView.center.x - swipedView.bounds.size.width / 2 < 0) moveX = - moveX;
        if(swipedView.center.x + swipedView.bounds.size.width / 2 > 320) moveX = - moveX;
        
        //上下の壁との当たり判定
        if(swipedView.center.y - swipedView.bounds.size.height / 2 < 124) moveY = - moveY;
        if(swipedView.center.y + swipedView.bounds.size.height / 2 > 444) moveY = - moveY;
        
    }else if (swipedView.tag == 4){
        swipedView.center = CGPointMake(swipedView.center.x - moveX, swipedView.center.y - moveY);
        // ballと横壁の当たり判定
        if(swipedView.center.x - swipedView.bounds.size.width / 2 < 0) moveX = - moveX;
        if(swipedView.center.x + swipedView.bounds.size.width / 2 > 320) moveX = - moveX;
        
        //上下の壁との当たり判定
        if(swipedView.center.y - swipedView.bounds.size.height / 2 < 124) moveY = - moveY;
        if(swipedView.center.y + swipedView.bounds.size.height / 2 > 444) moveY = - moveY;
    }
}





@end
