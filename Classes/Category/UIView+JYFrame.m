//
//  UIView+JYFrame.m
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import "UIView+JYFrame.h"

@implementation UIView (JYCategory)

- (CGFloat)jy_top{
    return self.frame.origin.y;
}

- (CGFloat)jy_left{
    return self.frame.origin.x;
}

- (CGFloat)jy_width{
    return self.frame.size.width;
}

- (CGFloat)jy_height{
    return self.frame.size.height;
}

- (CGFloat)jy_bottom{
    return self.frame.size.height + self.frame.origin.y;
}

- (CGFloat)jy_right{
    return self.frame.size.width + self.frame.origin.x;
}

- (CGFloat)jy_x{
    return self.frame.origin.x;
}

- (CGFloat)jy_y{
    return self.frame.origin.y;
}

- (CGPoint)jy_offset{
    CGPoint point = CGPointZero;
    UIView *view = self;
    while (view){
        point.x += view.frame.origin.x;
        point.y += view.frame.origin.y;
        view = view.superview;
    }
    return point;
}

- (CGPoint)jy_position{
    return self.frame.origin;
}

- (CGSize)jy_size{
    return self.frame.size;
}

- (CGFloat)jy_centerX{
    return self.center.x;
}

- (CGFloat)jy_centerY{
    return self.center.y;
}

- (CGPoint)jy_origin{
    return self.frame.origin;
}

- (CGPoint)jy_boundsCenter{
    return CGPointMake( CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds) );
}


- (void)setJy_top:(CGFloat)top{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (void)setJy_left:(CGFloat)left{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (void)setJy_width:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setJy_height:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setJy_bottom:(CGFloat)bottom{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (void)setJy_right:(CGFloat)right{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (void)setJy_x:(CGFloat)value{
    CGRect frame = self.frame;
    frame.origin.x = value;
    self.frame = frame;
}

- (void)setJy_y:(CGFloat)value{
    CGRect frame = self.frame;
    frame.origin.y = value;
    self.frame = frame;
}

- (void)setJy_offset:(CGPoint)offset{
    UIView *view = self;
    if (nil == view){
        return;
    }
    CGPoint point = offset;
    while (view){
        point.x += view.superview.frame.origin.x;
        point.y += view.superview.frame.origin.y;
        view = view.superview;
    }
    CGRect frame = self.frame;
    frame.origin = point;
    self.frame = frame;
}

- (void)setJy_position:(CGPoint)pos{
    CGRect frame = self.frame;
    frame.origin = pos;
    self.frame = frame;
}

- (void)setJy_size:(CGSize)size{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setJy_centerX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setJy_centerY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (void)setJy_origin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
@end
