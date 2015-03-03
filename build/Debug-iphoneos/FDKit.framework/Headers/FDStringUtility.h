//
//  StringUtility.h
//  PJFramework
//
//  Created by 陆振文 on 14-11-28.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FDSelectString(...)    [FDStringUtility select:YES strings:__VA_ARGS__]

@interface FDStringUtility : NSObject

/*!
 @method
 @author LZW
 @abstract 返回第一个不为nil或空的NSString,调用此方法必须要有一个默认的非空字符串值结尾,要是全部参数为nil或空字符串会崩溃
 */
+(NSString *)select:(BOOL)skipEmpty strings:(NSString *)strings,...;

@end
