//
//  ColorUtility.h
//  Icon
//
//  Created by PENGJU on 13-8-20.
//  Copyright (c) 2013年 estar. All rights reserved.
//

#import <Foundation/Foundation.h>


#define FDParseColor(hexString)  [FDColorUtility parseColor:(hexString)]

@interface FDColorUtility : NSObject

+(UIColor *)parseColor:(NSString *)hexString;

@end
