//
//  ViewController.h
//  DMCrookedSwiper
//
//  Created by Master on 2014/06/15.
//  Copyright (c) 2014年 jp.co.mappy. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MARBLE_WIDTH 50
#define MARBLE_HEIGHT 50



@interface ViewController : UIViewController
<UIGestureRecognizerDelegate>
{
    IBOutlet UIImageView *leftUpwardView;
    IBOutlet UIImageView *rightUpwardView;
    IBOutlet UIImageView *leftDownwardView;
    IBOutlet UIImageView *rightDownwardView;
    
    float moveX;
    float moveY;
    
}


@end
