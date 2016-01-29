//
//  LMJAnimatedElement.m
//  动态引导页
//
//  Created by apple on 14-11-17.
//  Copyright (c) 2014年 杰睿科技. All rights reserved.
//

#import "LMJAnimatedElement.h"

@implementation LMJAnimatedElement

-(id)init{
    self = [super init];
    if (self) {
        
        _size       = CGSizeMake(0, 0);   // 大小 默认值
        
        _startPoint = CGPointMake(0, 0);  // 起始位置 默认值
        _endPoint   = CGPointMake(0, 0);  // 终点位置 默认值

        _isGradient = YES;
    }
    return self;
}


- (LMJAnimatedElement *)initWithImage:(UIImage *)image{
    self = [self init];
    if (self) {
        self.elementView = [[UIImageView alloc] initWithFrame:CGRectMake(self.startPoint.x, self.startPoint.y, self.size.width, self.size.height)];
        [(UIImageView *)self.elementView setImage:image];
    }
    return self;
    
}

- (LMJAnimatedElement *)initWithText:(NSString *)text{
    self = [self init];
    if (self) {
        
    }
    return self;
}

- (void)setSize:(CGSize)size{
    _size = size;
    
    [self.elementView setFrame:CGRectMake(self.startPoint.x, self.startPoint.y, self.size.width, self.size.height)];
}

- (void)setStartPoint:(CGPoint)startPoint{
    _startPoint = startPoint;
    
    [self.elementView setFrame:CGRectMake(self.startPoint.x, self.startPoint.y, self.size.width, self.size.height)];
}

- (void)setIsGradient:(BOOL)isGradient{
    _isGradient = isGradient;
    
    if (isGradient == YES) {
        self.elementView.alpha = 0.f;
    }else{
        self.elementView.alpha = 1.f;
    }
}


@end
