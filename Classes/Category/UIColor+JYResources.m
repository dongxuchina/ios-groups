//
//  UIColor+JYResources.m
//  ios-groups
//
//  Created by 董旭 on 17/2/17.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import "UIColor+JYResources.h"

@implementation UIColor (JYResources)

+ (UIColor *)jy_bgNavBarColor{
    return [UIColor colorWithKey:@"bg_navigationbar_color"];
}

+ (UIColor *)jy_lineColor{
    return [UIColor colorWithKey:@""];
}

+ (UIColor *)jy_bgContentColor{
    return [UIColor colorWithKey:@"bg_content_color"];
}

+ (UIColor *)jy_primaryColor{
    return [UIColor colorWithKey:@"primary_color"];
}





+ (UIColor *)colorWithKey:(NSString *)key
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"colors" ofType:@"plist"];
    NSDictionary *colorsDic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSString *hexString = [colorsDic jy_objectForKey:key];
    return [UIColor colorWithHexString:hexString];
}

@end
