//
//  ViewController.m
//  DMCrookedSwiper
//
//  Created by Master on 2014/06/15.
//  Copyright (c) 2014年 jp.co.mappy. All rights reserved.
//

#import "ViewController.h"
#import "DMCrookedSwipeView.h"


@interface ViewController ()

@end

@implementation ViewController






- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self makeLeftUpwordMarble];
    [self makeRightUpwordMarble];
    [self makeRightDownwordMarble];
    [self makeLeftDownwordMarble];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//============================//
/*①4箇所にそれぞれ石があるかcheck
 *②ないところに石をmake
 *③石がスワイプされると無くなる
 *④スワイプ後になくなった箇所をcheck
 *⑤ないところに石をmake
 *⑥以降くりかえし
 */
//============================//






#pragma mark - SetColor
- (UIColor *)setColor
{
    int randomNumber = arc4random_uniform(4);
    //NSLog(@"randmNumber is %d", randomNumber);
    
    switch (randomNumber) {
        case 0:
            return [UIColor redColor];
            break;
        case 1:
            return [UIColor blueColor];
            break;
        case 2:
            return [UIColor yellowColor];
            break;
        case 3:
            return [UIColor greenColor];
            break;
        default:
            break;
    }
    return nil;
}


#pragma mark - PrivateMethod


- (void)makeLeftUpwordMarble
{
    DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(100, 220, MARBLE_WIDTH, MARBLE_HEIGHT)];
    marble.backgroundColor = [self setColor];
    marble.layer.cornerRadius = 25.0f;
    
    [self.view addSubview:marble];
}

- (void)makeRightUpwordMarble
{
    DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(180, 220, MARBLE_WIDTH, MARBLE_HEIGHT)];
    marble.backgroundColor = [self setColor];
    marble.layer.cornerRadius = 25.0f;

    [self.view addSubview:marble];
}

- (void)makeLeftDownwordMarble
{
    DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(100, 300, MARBLE_WIDTH, MARBLE_HEIGHT)];
    marble.backgroundColor = [self setColor];
    marble.layer.cornerRadius = 25.0f;
    
    [self.view addSubview:marble];
}

- (void)makeRightDownwordMarble
{
    DMCrookedSwipeView *marble = [[DMCrookedSwipeView alloc] initWithFrame:CGRectMake(180, 300, MARBLE_WIDTH, MARBLE_HEIGHT)];
    marble.backgroundColor = [self setColor];
    marble.layer.cornerRadius = 25.0f;
    
    [self.view addSubview:marble];
}




@end
