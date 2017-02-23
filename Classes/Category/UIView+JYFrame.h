//
//  UIView+JYFrame.h
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JYFrame)

@property (assign, nonatomic) CGFloat	jy_top;
@property (assign, nonatomic) CGFloat	jy_bottom;
@property (assign, nonatomic) CGFloat	jy_left;
@property (assign, nonatomic) CGFloat	jy_right;
@property (assign, nonatomic) CGPoint	jy_offset;
@property (assign, nonatomic) CGPoint	jy_position;
@property (assign, nonatomic) CGFloat	jy_x;
@property (assign, nonatomic) CGFloat	jy_y;
@property (assign, nonatomic) CGFloat	jy_width;
@property (assign, nonatomic) CGFloat	jy_height;
@property (assign, nonatomic) CGSize	jy_size;
@property (assign, nonatomic) CGFloat	jy_centerX;
@property (assign, nonatomic) CGFloat	jy_centerY;
@property (assign, nonatomic) CGPoint	jy_origin;
@property (readonly, nonatomic) CGPoint	jy_boundsCenter;

@end
