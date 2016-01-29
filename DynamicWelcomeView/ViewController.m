//
//  ViewController.m
//  DynamicWelcomeView
//
//  Created by LiMingjie on 16/1/29.
//  Copyright © 2016年 iOS开发者公会. All rights reserved.
//

#import "ViewController.h"

#import "LMJDynamicWelcomeView.h"
#import "LMJAnimatedElement.h"

@interface ViewController ()
{
    LMJDynamicWelcomeView * _welcomeView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    
    NSMutableArray * elementsDataArr = [[NSMutableArray alloc] init];
    
    LMJAnimatedElement * element1 = [[LMJAnimatedElement alloc] initWithImage:[UIImage imageNamed:@"umbrella"]];
    element1.belongToScreen   = 0;
    element1.size             = CGSizeMake(64, 64);
    element1.startPoint       = CGPointMake(130, 420);
    element1.endPoint         = CGPointMake(130, 420);
    element1.isGradient       = NO;
    [elementsDataArr addObject:element1];
    
    LMJAnimatedElement * element2 = [[LMJAnimatedElement alloc] initWithImage:[UIImage imageNamed:@"cocktail"]];
    element2.belongToScreen   = 1;
    element2.size             = CGSizeMake(64, 64);
    element2.startPoint       = CGPointMake(40, 350);
    element2.endPoint         = CGPointMake(40, 480);
    element2.isGradient       = YES;
    [elementsDataArr addObject:element2];
    
    LMJAnimatedElement * element3 = [[LMJAnimatedElement alloc] initWithImage:[UIImage imageNamed:@"flip_flops"]];
    element3.belongToScreen   = 2;
    element3.size             = CGSizeMake(64, 64);
    element3.startPoint       = CGPointMake(-70, 500);
    element3.endPoint         = CGPointMake(190, 470);
    element3.isGradient       = YES;
    [elementsDataArr addObject:element3];
    
    LMJAnimatedElement * element4 = [[LMJAnimatedElement alloc] initWithImage:[UIImage imageNamed:@"surfboard"]];
    element4.belongToScreen   = 3;
    element4.size             = CGSizeMake(96, 96);
    element4.startPoint       = CGPointMake(300, 440);
    element4.endPoint         = CGPointMake(40, 440);
    element4.isGradient       = NO;
    [elementsDataArr addObject:element4];
    
    LMJAnimatedElement * element5 = [[LMJAnimatedElement alloc] initWithImage:[UIImage imageNamed:@"beach_chair"]];
    element5.belongToScreen   = 4;
    element5.size             = CGSizeMake(64, 64);
    element5.startPoint       = CGPointMake(320, 440);
    element5.endPoint         = CGPointMake(220, 440);
    element5.isGradient       = YES;
    [elementsDataArr addObject:element5];
    
    
    _welcomeView = [[LMJDynamicWelcomeView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [_welcomeView setAnimatedItems:elementsDataArr];
    [_welcomeView setBackgroundImage:[UIImage imageNamed:@"beach_bg.png"] size:CGSizeMake(_welcomeView.frame.size.width, _welcomeView.frame.size.height)];
    [_welcomeView setAnimatedPageCount:5];
    
    [self.view addSubview:_welcomeView];
    
}
@end
