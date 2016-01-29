//
//  LMJDynamicWelcomeView.m
//  自定义动态引导页
//
//  Version:1.0.0
//
//  Created by MajorLi on 14/11/17.
//  Copyright © 2014年 iOS开发者公会. All rights reserved.
//
//  iOS开发者公会-技术1群 QQ群号：87440292
//  iOS开发者公会-技术2群 QQ群号：232702419
//  iOS开发者公会-议事区  QQ群号：413102158
//

#import "LMJDynamicWelcomeView.h"

#import "LMJAnimatedElement.h"

#define SelfWidth  self.frame.size.width
#define SelfHeight self.frame.size.height

@implementation LMJDynamicWelcomeView
{
    NSMutableArray * _elementsDataArr;  // 有效的动画元素数组
    NSInteger        _animatePageCount; // 动画总屏数
    
    
    
    UIScrollView * _backgroundScrollView; // 背景滚动视图
    UIScrollView * _touchScrollView;      // 触摸滚动视图
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _elementsDataArr   = [NSMutableArray array];
        _animatePageCount  = 1;
        
        [self initBackgroundScrollView];
        [self initTouchScrollView];
        
    }
    return self;
}
#pragma mark - Init Methods

-(void)initBackgroundScrollView{

    _backgroundScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SelfWidth, SelfHeight)];
    _backgroundScrollView.showsHorizontalScrollIndicator = NO;
    _backgroundScrollView.showsVerticalScrollIndicator   = NO;
    _backgroundScrollView.pagingEnabled                  = NO;
    [self addSubview:_backgroundScrollView];
}

-(void)initTouchScrollView{
    
    _touchScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SelfWidth, SelfHeight)];
    _touchScrollView.backgroundColor                = [UIColor clearColor];
    _touchScrollView.pagingEnabled                  = YES;
    _touchScrollView.bounces                        = NO;
    _touchScrollView.showsHorizontalScrollIndicator = NO;
    _touchScrollView.showsVerticalScrollIndicator   = NO;
    _touchScrollView.delegate                       = self;
    [self addSubview:_touchScrollView];
}

#pragma mark - Set Methods
- (void)setAnimatedItems:(NSArray *)items{
    
    for (LMJAnimatedElement * element in items) {
        
        if ([element isKindOfClass:[LMJAnimatedElement class]]) {
            
            [self addSubview:element.elementView];
            [_elementsDataArr addObject:element];
            
        }else{
            continue;
        }
    }
}

- (void)setAnimatedPageCount:(NSInteger)count{
    _animatePageCount = count;
    
    _touchScrollView.contentSize = CGSizeMake(SelfWidth * count, SelfHeight);
}

- (void)setBackgroundImage:(UIImage *)image size:(CGSize)size{
    
    _backgroundScrollView.contentSize = size;
    
    UIImageView * bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    [bgImageView setImage:image];
    [_backgroundScrollView addSubview:bgImageView];
}

#pragma mark - UIScrollView Delegate
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
  
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat   content_X           =    scrollView.contentOffset.x;
    CGFloat   percentageOfMoved   =    fmod(content_X, SelfWidth) / SelfWidth;
    NSInteger currentScreen       =    content_X / SelfWidth;
    
    NSLog(@"---%f",percentageOfMoved);
    
    //移动背景
    _backgroundScrollView.contentOffset = CGPointMake((_backgroundScrollView.contentSize.width -SelfWidth)* content_X/(scrollView.contentSize.width -SelfWidth), 0);
    
    //元素动画
    for (LMJAnimatedElement * element in _elementsDataArr) {
        
        
        
        if (element.belongToScreen == currentScreen) { // 当前页动画元素
            if (element.isGradient == YES) {
                element.elementView.alpha = 1 * (1 -percentageOfMoved);
            }else{
                element.elementView.alpha = 1.f;
            }
            
        }
        
    
            
        if (element.belongToScreen == currentScreen +1) { // 下一页的元素
            CGFloat x = element.startPoint.x + (element.endPoint.x - element.startPoint.x) * percentageOfMoved;
            CGFloat y = element.startPoint.y + (element.endPoint.y - element.startPoint.y) * percentageOfMoved;
            
            [element.elementView setFrame:CGRectMake(x, y, element.elementView.frame.size.width, element.elementView.frame.size.height)];
            
            
            if (element.isGradient == YES) {
                element.elementView.alpha = 1 * percentageOfMoved;
            }else {
                element.elementView.alpha = 1.f;
            }
        }
        
        
    }
}

@end
