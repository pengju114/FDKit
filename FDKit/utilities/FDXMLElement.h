//
//  XMLElement.h
//  xml
//
//  Created by 陆振文 on 14-7-9.
//  Copyright (c) 2014年 excelsecu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FDKitMicro.h"

// 暂时不使用
typedef enum FDXMLElementType{
    kXMLElementNode,
    kXMLElementText
}XMLElementType;

@class FDXMLElement;

/*!
 元素遍历器
 遍历整个DOM树，直到返回NO停止
 */
typedef BOOL (^FDXMLElementIterator) (FDXMLElement *element,int level) ;

@interface FDXMLElement : NSObject
@property (nonatomic,assign) XMLElementType type;
@property (nonatomic,copy) NSString       *text;
@property (nonatomic,copy) NSString       *name;
@property (nonatomic,STRONG, readonly) FDXMLElement     *parent;

-(id) initWithXMLData:(NSData *) data;
-(id) initWithFile:(NSString *)  path;
-(id) initWithStream:(NSInputStream *)  stream;

-(NSString *)attributeForKey:(NSString *)key;
-(NSArray  *)attributeKeys;
-(void)setAttribute:(NSString *)value forKey:(NSString *)key;
-(NSString *)removeAttributeForKey:(NSString *)key;


-(NSArray * /*XMLElement*/ ) children;
-(NSUInteger) childrenCount;
/*!
 @abstract 根据节点名获取子节点列表
 */
-(NSArray * /*XMLElement*/ ) childrenForName:(NSString *)elementName;
/*!
 @abstract 根据节点名获取一个子节点（即使有多个）
 */
-(FDXMLElement *) childForName:(NSString *)elementName;
-(FDXMLElement *) childAt:(NSUInteger)index;
-(void) addChildElement:(FDXMLElement *)child;
-(NSArray *) removeChildrenForName:(NSString *)elementName;
-(void) removeChild:(FDXMLElement *)element;

-(void) each:(FDXMLElementIterator) iterator;
-(NSString *)toXMLString;


@end

