//
//  HttpManager.h
//  SnsDemo
//
//  Created by DuHaiFeng on 13-5-23.
//  Copyright (c) 2013年 dhf. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HttpHelper;
@interface HttpManager : NSObject
{
    //保存所有下载类实例的字典
    NSMutableDictionary *downloadQueue;
    
    //保存所有下载解析后的结果
    NSMutableDictionary *resultDict;
}
@property (nonatomic,retain) NSMutableDictionary *resultDict;

//创建单例
+(HttpManager *)sharedManager;

//通过下载网址获得下载对象
//-(HttpHelper*)helperForKey:(NSString*)url;
//添加一个下载到队列中
-(void)addDownloadToQueue:(NSString*)url type:(NSInteger)type;
//添加一个下载到队列中
-(void)addDownloadToQueue:(NSString*)url type:(NSInteger)type dict:(NSDictionary*)dict;
@end





