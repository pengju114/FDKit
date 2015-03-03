//
//  HttpResult.h
//  PJFramework
//
//  Created by 陆振文 on 14-7-29.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FDKitMicro.h"

typedef NS_ENUM(NSInteger,FDHTTPStatus){
    kHTTPOK       = 0,
    kHTTPNotLogin = -1,
    kHTTPError    = -9
};

@interface FDHttpResult : NSObject

@property (nonatomic,STRONG,readonly) id            responseData;
@property (nonatomic,STRONG,readonly) NSDictionary  *responseHeader;
@property (nonatomic,assign,readonly) FDHTTPStatus    statusCode;
@property (nonatomic,STRONG,readonly) NSString      *statusText;


-(id) initWithResponseData:(id)respData andResponseHeaders:(NSDictionary *)header;

-(id) initWithResponseData:(id)respData andResponseHeaders:(NSDictionary *)header andStatusText:(NSString *)st;

/*!
 @abstract 获取服务器返回的数据
 */
-(NSArray *) dataList;

-(NSInteger) pageCount;

-(NSInteger) currentPage;
-(NSInteger) totalResultsCount;

@end
