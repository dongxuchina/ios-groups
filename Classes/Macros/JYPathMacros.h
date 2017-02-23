//
//  JYPathMacros.h
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#ifndef JYPathMacros_h
#define JYPathMacros_h

#define kPathTemp                   NSTemporaryDirectory()
#define kPathDocument               [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
#define kPathCache                  [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0]

#define kPathMagazine               [kPathDocument stringByAppendingPathComponent:@"JunYang"]
#define kPathOperation              [kPathMagazine stringByAppendingPathComponent:@"Operation.plist"]
#define kPathSplashScreen           [kPathCache stringByAppendingPathComponent:@"splashScreen"]

#endif /* PathMacros_h */
