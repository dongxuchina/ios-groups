//
//  UIColor+JYResources.h
//  ios-groups
//
//  Created by 董旭 on 17/2/17.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (JYResources)


/**
 顶部导航背景颜色
 */
@property (nonatomic, class, readonly) UIColor *jy_bgNavBarColor;


/**
 线颜色
 */
@property (nonatomic, class, readonly) UIColor *jy_lineColor;


/**
 内容背景颜色
 */
@property (nonatomic, class, readonly) UIColor *jy_bgContentColor;


/**
 主颜色
 */
@property (nonatomic, class, readonly) UIColor *jy_primaryColor;


/**
 次颜色
 */
@property (nonatomic, class, readonly) UIColor *jy_secondaryColor;


@end
