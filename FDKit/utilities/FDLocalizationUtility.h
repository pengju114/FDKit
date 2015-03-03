//
//  FDLocalizationUtility.h
//  FDKit
//
//  Created by 陆振文 on 15-1-5.
//  Copyright (c) 2015年 pj. All rights reserved.
//

#import <Foundation/Foundation.h>


#define FDLocalizedString(key, table, bundleName, defaultVal) [FDLocalizationUtility translateLanguageByKey:key table:table bundleName:bundleName defaultValue:defaultVal]

@interface FDLocalizationUtility : NSObject

+(NSString *)translateLanguageByKey:(NSString *)key table:(NSString *)table bundle:(NSBundle *)bundle defaultValue:(NSString *)defaultVal;

+(NSString *)translateLanguageByKey:(NSString *)key table:(NSString *)table bundleName:(NSString *)bundleName defaultValue:(NSString *)defaultVal;

@end
