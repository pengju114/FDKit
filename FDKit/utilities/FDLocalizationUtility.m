//
//  FDLocalizationUtility.m
//  FDKit
//
//  Created by 陆振文 on 15-1-5.
//  Copyright (c) 2015年 pj. All rights reserved.
//

#import "FDLocalizationUtility.h"
#import "FDKitMicro.h"

static NSMutableDictionary *FDGlobalLanguageDict = nil;


@implementation FDLocalizationUtility


+(NSString *)translateLanguageByKey:(NSString *)key table:(NSString *)table bundle:(NSBundle *)bundle defaultValue:(NSString *)defaultVal{
    
    if (!bundle) {
        return defaultVal;
    }
    
    
    NSString *systemLanguage = [[NSLocale preferredLanguages] objectAtIndex:0];
    
    // 先在缓存中查找
    if(!FDGlobalLanguageDict){
        @synchronized([NSLocale class]){
            Release(FDGlobalLanguageDict);
            FDGlobalLanguageDict = [[NSMutableDictionary alloc] initWithCapacity:3];
        }
    }
    
    NSDictionary *langDict = [FDGlobalLanguageDict objectForKey:systemLanguage];
    
    if(langDict){
        NSString *value = [langDict objectForKey:key];
        FDLog(@"**esmobile 多语言(%@)从缓存中获取 %@ -> %@",systemLanguage,key,value);
        return value?value:defaultVal;
    }
    
    
    // 从bundle中获取
    NSURL * url = [bundle URLForResource:table withExtension:@"strings" subdirectory:nil localization:systemLanguage];
    
    
    if (!url) {
        FDLog(@"**esmobile 根据系统设置语言未找到多语言资源文件，系统语言为 %@",systemLanguage);
        // 对中文做特殊处理
        if ([systemLanguage hasPrefix:@"zh-"]) {
            if ([systemLanguage rangeOfString:@"hans" options:NSCaseInsensitiveSearch].location == NSNotFound) {
                // 繁体中文
                url = [bundle URLForResource:table withExtension:@"strings" subdirectory:nil localization:@"zh-Hant"];
            }
        }
    }
    
    if (!url) {
        NSRange loc = [systemLanguage rangeOfString:@"-" options:NSCaseInsensitiveSearch];
        if (loc.location != NSNotFound) {
            // 有横线，则查找语言(如en-US,en-UK,则查找 en 资源文件夹；US、UK是地区)
            NSString *lan = [systemLanguage substringWithRange:NSMakeRange(0, loc.location)];
            FDLog(@"**esmobile 根据系统语言和地区未找到多语言资源文件，按语言'%@'查找",lan);
            url = [bundle URLForResource:table withExtension:@"strings" subdirectory:nil localization:lan];
        }
    }
    
    
    if(url){
        
        langDict = [NSDictionary dictionaryWithContentsOfURL:url];
        [FDGlobalLanguageDict setObject:langDict forKey:systemLanguage];// 缓存起来
        
        NSString *value = [langDict objectForKey:key];
        return value?value:defaultVal;
    }
    // 都没有找到，用系统的
    FDLog(@"**esmobile 找到多语言资源文件，调用系统国际化方法，lang=%@",systemLanguage);
    return NSLocalizedStringWithDefaultValue(key, table, bundle, defaultVal, nil);
}

+(NSString *)translateLanguageByKey:(NSString *)key table:(NSString *)table bundleName:(NSString *)bundleName defaultValue:(NSString *)defaultVal{
    
    
    NSString * bp = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    if(!bp){
        return defaultVal;
    }
    
    NSBundle *bundle = [NSBundle bundleWithPath:bp];
    if (!bundle) {
        return defaultVal;
    }
    
    return [self translateLanguageByKey:key table:table bundle:bundle defaultValue:defaultVal];
}


@end
