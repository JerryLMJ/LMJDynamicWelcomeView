//
//  LMJDynamicWelcomeView.h
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

#import <UIKit/UIKit.h>

@interface LMJDynamicWelcomeView : UIView <UIScrollViewDelegate>

- (void)setAnimatedItems:(NSArray *)items;

- (void)setAnimatedPageCount:(NSInteger)count;

- (void)setBackgroundImage:(UIImage *)image size:(CGSize)size;

@end
