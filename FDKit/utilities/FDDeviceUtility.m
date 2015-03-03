//
//  DeviceUtility.m
//  Icon
//
//  Created by PENGJU on 13-8-13.
//  Copyright (c) 2013年 estar. All rights reserved.
//

#import "FDDeviceUtility.h"

@implementation FDDeviceUtility

+(BOOL)isPhone{
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone);
}

+(BOOL)isPad{
    return ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad);
}

+(CGRect)applicationFrame{
    return [UIScreen mainScreen].applicationFrame;
}
+(CGRect)screenBounds{
    return [UIScreen mainScreen].bounds;
}
+(CGFloat)screenWidth{
    UIInterfaceOrientation ortn=[[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(ortn)) {
        return [FDDeviceUtility screenBounds].size.height;
    }
    return [FDDeviceUtility screenBounds].size.width;
}
+(CGFloat)screenHeight{
    UIInterfaceOrientation ortn=[[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(ortn)) {
        return [FDDeviceUtility screenBounds].size.width;
    }
    return [FDDeviceUtility screenBounds].size.height;
}
+(CGFloat)applicationWidth{
    UIInterfaceOrientation ortn=[[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(ortn)) {
        return [FDDeviceUtility applicationFrame].size.height;
    }
    return [FDDeviceUtility applicationFrame].size.width;
}
+(CGFloat)applicationHeight{
    UIInterfaceOrientation ortn=[[UIApplication sharedApplication] statusBarOrientation];
    if (UIInterfaceOrientationIsLandscape(ortn)) {
        return [FDDeviceUtility applicationFrame].size.width;
    }
    return [FDDeviceUtility applicationFrame].size.height;
}

@end
