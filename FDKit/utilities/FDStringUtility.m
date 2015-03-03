//
//  StringUtility.m
//  PJFramework
//
//  Created by 陆振文 on 14-11-28.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import "FDStringUtility.h"

@implementation FDStringUtility

+(NSString *)select:(BOOL)skipEmpty strings:(NSString *)strings,...{
    
    
    va_list list;
    va_start(list, strings);
    
    NSString *val = strings;
    
    while (!val || (skipEmpty && val.length<1)) {
        val = va_arg(list, NSString*);
    }
    va_end(list);
    
    return val;
}


@end
