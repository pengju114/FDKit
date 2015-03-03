//
//  PJCore.m
//  PJFramework
//
//  Created by 陆振文 on 14-7-31.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import "FDKit.h"
#import "Reachability.h"
#import "ASIHTTPRequest.h"

#import "FDKitMicro.h"



static FDKit *coreInstance = nil;

extern NetworkStatus networkStatus;

NSString *kFDNetworkStatusNotification = @"__fd_network_status__";

@interface FDKit ()

@property(nonatomic,STRONG) Reachability *reachability;

@end


@implementation FDKit

@synthesize reachability = _reachability;


- (instancetype)init
{
    self = [super init];
    if (self) {
        [ASIHTTPRequest setShouldUpdateNetworkActivityIndicator:YES];
        self.reachability = nil;
    }
    return self;
}


+(FDKit *)shareInstance{
    if (coreInstance == nil) {
        @synchronized(self){
            if (coreInstance == nil) {
                id tmp = [[self alloc] init];
                NSLog(@"%@",tmp);
            }
        }
    }
    return coreInstance;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    if (coreInstance == nil) {
        @synchronized(self){
            if (coreInstance == nil) {
                coreInstance = [super allocWithZone:zone];
            }
        }
    }
    return coreInstance;
}

-(id)copyWithZone:(NSZone *)zone{
    return self;
}

#ifndef ARC

-(id)autorelease{
    return self;
}

-(id)retain{
    return self;
}

-(unsigned)retainCount{
    return NSIntegerMax;
}

-(oneway void)release{
    //do notthing
}

#endif

- (void)dealloc
{
    Release(_reachability);
#ifndef ARC
    [super dealloc];
#endif
}

-(BOOL)watchNetworkStatusForURL:(NSString *)url{
    
    if (!url) {
        return NO;
    }
    if (self.reachability) {
        return NO;
    }
    
    //网络监听部分
    networkStatus=NotReachable;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateChanged:) name:kReachabilityChangedNotification object:nil];
    self.reachability = [Reachability reachabilityWithHostName:url];
    [_reachability startNotifier];
    [self performSelectorInBackground:@selector(chenckNetworkState) withObject:nil];
    
    return YES;
}

-(BOOL)stopWatchNetworkStatus{
    if (!self.reachability) {
        return NO;
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
    [_reachability stopNotifier];
    self.reachability = nil;
    return YES;
}


-(void)networkStateChanged:(NSNotification *)n{
    FDLog(@"framework %@ data:%@",NSStringFromSelector(_cmd),n.userInfo);
    NetworkStatus status = networkStatus;
    networkStatus=[_reachability currentReachabilityStatus];
    FDLog(@"framework network status change from %u to %u",status,networkStatus);
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:kFDNetworkStatusNotification object:nil];
    });
}

-(void)chenckNetworkState{
    networkStatus=[_reachability currentReachabilityStatus];
}

@end
