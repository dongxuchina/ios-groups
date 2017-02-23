//
//  NSMutableArray+JYCategory.h
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (JYCategory)

- (void)jy_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx;

- (void)jy_addObject:(id)anObject;

- (void)jy_insertObject:(id)anObject atIndex:(NSUInteger)index;

- (void)jy_insertObjects:(NSArray *)objects atIndexes:(NSIndexSet *)indexes;

- (void)jy_removeObjectAtIndex:(NSUInteger)index;

- (void)jy_removeObjectsInRange:(NSRange)range;

@end
