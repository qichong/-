//
//  HttpHelper.h
//  SnsDemo
//
//  Created by DuHaiFeng on 13-5-23.
//  Copyright (c) 2013年 dhf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
@interface HttpHelper : NSObject<NSURLConnectionDataDelegate,ASIHTTPRequestDelegate>
{
    //系统http请求类
    NSURLConnection *httpConnection;
    //保存下载的数据的缓冲区(内存空间)
    NSMutableData *downloadData;
}
@property (nonatomic,assign) id delegate;
@property (nonatomic,assign) SEL method;
@property (nonatomic,readonly) NSMutableData *downloadData;
@property (nonatomic,assign) NSInteger type;//请求的接口类型
@property (nonatomic,retain) NSString* mUrl;

//用系统类通过get方式请求下载数据
-(void)downloadFromUrl:(NSString*)url;
//用第三方库通过get方式请求下载数据
-(void)downloadFromUrlWithASI:(NSString*)url;

//用第三库通过post方式请求下载数据
-(void)downloadFromUrlWithASIByPost:(NSString *)url dict:(NSDictionary*)dict;

@end






