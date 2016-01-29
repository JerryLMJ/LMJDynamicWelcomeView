//
//  LMJAnimatedElement.m
//  动画元素
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
