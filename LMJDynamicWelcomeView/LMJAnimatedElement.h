//
//  LMJAnimatedElement.h
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

#import <UIKit/UIKit.h>


@interface LMJAnimatedElement : NSObject

- (LMJAnimatedElement *)initWithImage:(UIImage *)image;

// - (LMJAnimatedElement *)initWithText:(NSString *)text; // 该功能尚未实现，敬请期待...



@property (nonatomic,assign) NSInteger belongToScreen;  // 属于第几屏 （取值范围：0~...）


@property (nonatomic,assign) CGSize  size; // 元素大小


@property (nonatomic,assign) CGPoint startPoint; // 动画起点
@property (nonatomic,assign) CGPoint endPoint;   // 动画终点


@property (nonatomic,assign) BOOL isGradient; // 是否有渐变效果 当设置为YES时，动画元素只有在所属页跟随动画出现；当设置为NO时，动画元素会一直在屏幕显示，只在其所属页移动

@property (nonatomic,strong) UIView * elementView; // 元素容器

@end
