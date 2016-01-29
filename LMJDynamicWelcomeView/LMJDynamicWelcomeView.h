//
//  LMJDynamicWelcomeView.h
//  DynamicWelcomeWindow
//
//  Created by LiMingjie on 16/1/28.
//  Copyright © 2016年 iOS开发者公会. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMJDynamicWelcomeView : UIView <UIScrollViewDelegate>

- (void)setAnimatedItems:(NSArray *)items;

- (void)setAnimatedPageCount:(NSInteger)count;

- (void)setBackgroundImage:(UIImage *)image size:(CGSize)size;

@end
