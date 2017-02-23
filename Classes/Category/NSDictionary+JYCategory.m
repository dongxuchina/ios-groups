//
//  NSDictionary+JYCategory.m
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import "NSDictionary+JYCategory.h"

@implementation NSDictionary (JYCategory)

- (id)jy_objectForKey:(id)aKey{
    if (aKey == nil || [self isKindOfClass:[NSNull class]]) {
        return nil;
    }
    id object = [self objectForKey:aKey];
    if (object==nil || object == [NSNull null]) {
        return @"";
    }
    return object;
}

- (id)jy_keyForValue:(id)value{
    for (id key in self.allKeys) {
        if ([value isEqual:[self objectForKey:key]]) {
            return key;
        }
    }
    return nil;
}

- (NSString *)jy_toJSONString{
    NSData *paramsJSONData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:paramsJSONData encoding:NSUTF8StringEncoding];
}



@end
