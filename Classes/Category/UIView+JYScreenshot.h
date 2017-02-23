//
//  UIView+JYScreenshot.h
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JYScreenshot)

/**
 视图截屏

 @return image
 */
- (UIImage*) jy_screenshot;

/**
 按 contentOffset 截屏

 @param contentOffset contentOffset
 @return image
 */
- (UIImage*) jy_screenshotForScrollViewWithContentOffset:(CGPoint)contentOffset;

/**
 按 CGRect 截屏

 @param frame frame
 @return image
 */
- (UIImage*) jy_screenshotInFrame:(CGRect)frame;

@end
