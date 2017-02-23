//
//  UIButton+JYResources.m
//  ios-groups
//
//  Created by 董旭 on 17/2/17.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import "UIButton+JYResources.h"

@implementation UIButton (JYResources)


+ (UIButton *)jy_buttonBack{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 35, 35);
    [btn setImage:[UIImage imageNamed:@"btn_nav_back_n"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"btn_nav_back_h"] forState:UIControlStateHighlighted];
    return btn;
}




@end
