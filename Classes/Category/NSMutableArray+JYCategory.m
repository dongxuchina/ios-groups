//
//  NSMutableArray+JYCategory.m
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import "NSMutableArray+JYCategory.h"

@implementation NSMutableArray (JYCategory)

- (void)jy_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx{
    if (obj == nil) {
        return ;
    }
    if (self.count < idx) {
        return ;
    }
    if (idx == self.count) {
        [self addObject:obj];
    } else {
        [self replaceObjectAtIndex:idx withObject:obj];
    }
}

- (void)jy_addObject:(id)anObject{
    if (anObject == nil) {
        return;
    } else {
        [self addObject:anObject];
    }
}

- (void)jy_insertObject:(id)anObject atIndex:(NSUInteger)index{
    if (anObject == nil) {
        return;
    } else if (index > self.count) {
        return;
    } else {
        [self insertObject:anObject atIndex:index];
    }
}

- (void)jy_insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes{
    NSUInteger firstIndex = indexes.firstIndex;
    if (indexes == nil) {
        return;
    } else if (indexes.count!=objects.count || firstIndex>objects.count) {
        return;
    } else {
        [self insertObjects:objects atIndexes:indexes];
    }
}

- (void)jy_removeObjectAtIndex:(NSUInteger)index{
    if (index >= self.count) {
        return;
    } else {
        [self removeObjectAtIndex:index];
    }
}

- (void)jy_removeObjectsInRange:(NSRange)range{
    NSUInteger location = range.location;
    NSUInteger length = range.length;
    if (location + length > self.count) {
        return;
    } else {
        [self removeObjectsInRange:range];
    }
}

@end
