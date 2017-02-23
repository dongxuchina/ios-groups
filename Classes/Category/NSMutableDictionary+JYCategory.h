//
//  NSMutableDictionary+JYCategory.h
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (JYCategory)

- (void)jy_setObject:(id)anObject forKey:(id<NSCopying>)aKey;

- (void)jy_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key;

- (id)jy_objectForKey:(id)aKey;

@end
