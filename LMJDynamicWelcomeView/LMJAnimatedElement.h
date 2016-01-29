//
//  LMJAnimatedElement.h
//  动态引导页
//
//  Created by apple on 14-11-17.
//  Copyright (c) 2014年 杰睿科技. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface LMJAnimatedElement : NSObject

- (LMJAnimatedElement *)initWithImage:(UIImage *)image;

- (LMJAnimatedElement *)initWithText:(NSString *)text; // 该功能尚未实现，敬请期待...

@property (nonatomic,assign) NSInteger belongToScreen;  // 属于第几屏 （取值范围：0~...）

@property (nonatomic,assign) CGSize  size; // 元素大小

@property (nonatomic,assign) CGPoint startPoint; // 动画起点
@property (nonatomic,assign) CGPoint endPoint;   // 动画终点

@property (nonatomic,assign) BOOL isGradient; // 是否有渐变效果 当设置为YES时，动画元素只有在所属页跟随动画出现；当设置为NO时，动画元素会一直在屏幕显示，只在其所属页移动

@property (nonatomic,strong) UIView * elementView; // 元素容器

@end
