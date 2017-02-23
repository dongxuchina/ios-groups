//
//  NSArray+JYCategory.m
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import "NSArray+JYCategory.h"

@implementation NSArray (JYCategory)

+ (instancetype)jy_arrayWithObject:(id)anObject{
    if (anObject == nil) {
        return [self array];
    } else {
        return [self arrayWithObject:anObject];
    }
}

- (id)jy_objectAtIndex:(NSUInteger)index{
    if (index >= self.count) {
        return nil;
    } else {
        return [self objectAtIndex:index];
    }
}

- (id)jy_objectAtIndexedSubscript:(NSUInteger)idx{
    if (idx >= self.count) {
        return nil;
    } else {
        return [self objectAtIndex:idx];
    }
}

- (NSArray *)jy_subarrayWithRange:(NSRange)range{
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location + length > self.count) {
        if ((location + length) > self.count) {
            length = (self.count - location);
            return [self jy_subarrayWithRange:NSMakeRange(location, length)];
        }
        return nil;
    }
    else {
        return [self subarrayWithRange:range];
    }
}

- (NSUInteger)jy_indexOfObject:(id)anObject{
    if (anObject == nil) {
        return NSNotFound;
    } else {
        return [self indexOfObject:anObject];
    }
}

- (NSArray *)jy_arrayWithPlistName:(NSString *)plistName{
    NSString *path = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
    return [NSArray arrayWithContentsOfFile:path];
}

- (NSString *)jy_toJSONString{
    NSData *paramsJSONData = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    return [[NSString alloc] initWithData:paramsJSONData encoding:NSUTF8StringEncoding];
}



@end
