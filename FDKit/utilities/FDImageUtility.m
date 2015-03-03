//
//  FDImageUtility.m
//  FDKit
//
//  Created by 陆振文 on 14-12-11.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import "FDImageUtility.h"

@implementation FDImageUtility

+(UIImage *)resizableImageByName:(NSString *)name{
    
    UIImage *image = [UIImage imageNamed:name];
    return [FDImageUtility resizableImageByImage:image];
}

+(UIImage *)resizableImageByImage:(UIImage *)image{
    if (!image) {
        return image;
    }
    
    return [image stretchableImageWithLeftCapWidth:floorf(image.size.width * 0.5f) topCapHeight:floorf(image.size.height * 0.5f)];
}

@end
