//
//  FDImageUtility.h
//  FDKit
//
//  Created by 陆振文 on 14-12-11.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import <Foundation/Foundation.h>

#define FDResizableImage(name)  ([(name) isKindOfClass:[UIImage class]]?[FDImageUtility resizableImageByImage:(name)]:[FDImageUtility resizableImageByName:(name)])

@interface FDImageUtility : NSObject
+(UIImage *)resizableImageByName:(NSString *)name;
+(UIImage *)resizableImageByImage:(UIImage *)image;

@end
