//
//  PJFDKitMicro.h
//  PJFramework
//
//  Created by 陆振文 on 14-7-31.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import <Foundation/Foundation.h>



extern NSString *kFDNetworkStatusNotification;


@interface FDKit : NSObject

+(FDKit *)shareInstance;

-(BOOL)watchNetworkStatusForURL:(NSString *)url;
-(BOOL)stopWatchNetworkStatus;

@end
