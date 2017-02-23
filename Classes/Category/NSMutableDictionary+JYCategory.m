//
//  NSMutableDictionary+JYCategory.m
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import "NSMutableDictionary+JYCategory.h"

@implementation NSMutableDictionary (JYCategory)

- (id)jy_objectForKey:(id)aKey{
    if (aKey != nil) {
        return [self objectForKey:aKey];
    } else {
        return nil;
    }
}

- (void)jy_setObject:(id)anObject forKey:(id<NSCopying>)aKey{
    if (anObject && ![anObject isKindOfClass:[NSNull class]] && aKey) {
        [self setObject:anObject forKey:aKey];
    } else {
        return;
    }
}

- (void)jy_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key{
    if (!key) {
        return ;
    }
    if (!obj) {
        [self removeObjectForKey:key];
    }
    else {
        [self setObject:obj forKey:key];
    }
}

@end
