//
//  NSDictionary+JYCategory.h
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JYCategory)

- (id)jy_objectForKey:(id)aKey;

- (id)jy_keyForValue:(id)value;

- (NSString *)jy_toJSONString;

@end
