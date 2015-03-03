//
//  FDKitMicro.h
//  core
//
//  Created by PENGJU on 14-2-10.
//  Copyright (c) 2014年 pengju. All rights reserved.
//

#ifndef core_core_h
#define core_core_h

#if DEBUG
#define debug 1
#endif

#if debug
#define FDLog(...) NSLog(__VA_ARGS__)
#else
#define FDLog(...)
#endif


/**
 * ARC支持
 */
#if __has_feature(objc_arc)

#define ARC_SUPPORT
#define ARC
#define STRONG strong

#if __has_feature(objc_arc_weak)
#define WEAK weak
#else
#define WEAK unsafe_unretained
#endif

#define Retain(x)      (x)
#define Release(x)
#define AutoRelease(x) (x)

#else

#define STRONG retain
#define WEAK   assign

#define Retain(x)      [(x) retain]
#define Release(x)     [(x) release]
#define AutoRelease(x) [(x) autorelease]

#endif


/**
 * 常用快捷方式
 */

#define FDDocumentPath ([NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0])

#define FDIOSVersion ([[[UIDevice currentDevice] systemVersion] floatValue])

/**
 * 加载资源图片
 */
#define FDLoadImage(name) ([UIImage imageNamed:(name)])
/**
 * 保证string不为nil,为nil则返回空字符串
 */
#define FDForceString(string)     ((string)==nil?@"":(string))
/**
 * 去除字符串两端空格
 */
#define FDTrim(string)    ((string)==nil?@"":([(string) stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]))
/**
 * 去除字符串所以空格
 */
#define FDTrimAll(string) ([[NSRegularExpression regularExpressionWithPattern:@"\\s+" options:NSRegularExpressionCaseInsensitive error:nil] stringByReplacingMatchesInString:(string) options:0 range:NSMakeRange(0, (string).length) withTemplate:@""])
/**
 * 判断字符串是否为空
 */
#define FDIsEmptyString(string)  ((string)==nil || [[(string) stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]<1)
/**
 * 判断字符串是否不为空
 */
#define FDNotEmptyString(string) (!FDIsEmptyString(string))


#define FDFormatString(...)       [NSString stringWithFormat:__VA_ARGS__];

/**
 * 将对象转换为字符串
 */
#define FDObjectString(val)  ((val)==nil?@"":[NSString stringWithFormat:@"%@",(val)])

#define FDIntString(val)      [NSString stringWithFormat:@"%d",(val)]
#define FDFloatString(val)    [NSString stringWithFormat:@"%.2f",(val)]
#define FDLongString(val)     [NSString stringWithFormat:@"%ld",(val)]
#define FDCharString(val)     [NSString stringWithFormat:@"%c",(val)]

#define FDRectCenter(rect)    CGPointMake((rect).size.width*0.5f, (rect).size.height*0.5f)

#endif
