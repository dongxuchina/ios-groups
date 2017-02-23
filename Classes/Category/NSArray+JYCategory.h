//
//  NSArray+JYCategory.h
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (JYCategory)

+ (instancetype)jy_arrayWithObject:(id)anObject;

- (id)jy_objectAtIndex:(NSUInteger)index;

- (id)jy_objectAtIndexedSubscript:(NSUInteger)idx;

- (NSArray *)jy_subarrayWithRange:(NSRange)range;

- (NSUInteger)jy_indexOfObject:(id)anObject;

/**
 plist转成数组

 @param plistName name
 @return array
 */
- (NSArray *)jy_arrayWithPlistName:(NSString *)plistName;

/**
 数组转json字符串

 @return str
 */
- (NSString *)jy_toJSONString;

@end
