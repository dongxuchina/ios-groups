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
    return [UIColor colorWithHexString:@"#0a0a0f"];
}

+ (UIColor *)jy_lineColor{
    return [UIColor colorWithHexString:@""];
}

+ (UIColor *)jy_bgContentColor{
    return [UIColor colorWithHexString:@"#F3F3F7"];
}

+ (UIColor *)jy_primaryColor{
    return [UIColor colorWithHexString:@"#1FB922"];
}

+ (UIColor *)jy_secondaryColor{
    return [UIColor colorWithHexString:@"#319B39"];
}


+ (UIColor *)colorWithKey:(NSString *)key
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"colors" ofType:@"plist"];
    NSDictionary *colorsDic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSString *hexString = [colorsDic jy_objectForKey:key];
    return [UIColor colorWithHexString:hexString];
}

@end
