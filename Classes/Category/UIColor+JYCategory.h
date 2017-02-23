//
//  UIColor+JYCategory.h
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JYCategory)


/**
 从十六进制字符串获取颜色

 @param color 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color;


/**
 从十六进制字符串获取颜色

 @param color 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 @param alpha 透明度
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
