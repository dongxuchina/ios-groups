//
//  NSString+JYCategory.h
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JYCategory)


/**
 md5转换

 @return md5 string
 */
- (NSString *) jy_md5;


/**
 通过时间戳计算时间差

 @param compareDate 时间戳
 @return 时间差
 */
+ (NSString *) jy_compareCurrentTime:(NSTimeInterval) compareDate;

/**
 通过时间戳得出显示时间

 @param timestamp 时间戳
 @return 时间字符串
 */
+ (NSString *) jy_dateStringWithTimestamp:(NSTimeInterval)timestamp;

/**
 通过时间戳和格式显示时间

 @param timestamp 时间戳
 @param formatter 格式化
 @return 时间字符串
 */
+ (NSString *) jy_dataStringWithTimestamp:(NSTimeInterval)timestamp formatter:(NSString*)formatter;


@end
