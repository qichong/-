//
//  CRMPublicOperation.h
//  CRMIphone01
//
//  Created by lijian on 13-12-2.
//  Copyright (c) 2013年 lijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRMPublicOperation : NSObject

//创建单例
+(CRMPublicOperation *)sharedManager;

@property(nonatomic,retain)NSMutableDictionary * conditionalListDic;
//用回定位位置
@property(nonatomic,retain)NSMutableArray * locationInfo;
//保存用户名和密码 
@property(nonatomic,retain)NSString * userName;
@property(nonatomic,retain)NSString * passWord;
//保存销售组织标识和销售组织名
@property(nonatomic,retain)NSString * salesGroup;
@property(nonatomic,retain)NSString * VKORG_TXT;
//保存登陆时profile值
@property(nonatomic,retain)NSString * profile;
//保存图片数据流
@property(nonatomic,retain)NSData * imageData;

//保存登陆后状态
@property(nonatomic,assign)BOOL loginType;
//记录当前可客户编号
@property(nonatomic,retain)NSString * CustomerNumber;
//记录当前选中cell行数
@property(nonatomic,assign)NSInteger cellNumber;


@property(nonatomic,assign)BOOL isShowIcon;

@property(nonatomic,retain)UIView * bottomSubView;

/*
 记录用户地址物理信息和使用状态
*/
@property(nonatomic,assign)BOOL * useType;
@property(nonatomic,retain)NSString * latitude;
@property(nonatomic,retain)NSString * longitude;
@property(nonatomic,retain)NSString * locationDescribe;


//获取token值
@property (nonatomic,retain)NSString * deviceToken;

//增加请求信息返回提示
@property (nonatomic,retain)NSString * requestBackInfo;

/*****************全局控件**************/
//时间选择控件
-(UIView*)createPickerView;
//获取当前时间的上一月的时间
+(NSString *)getLastOneMonthStringFormatOfStringDate:(NSDate *)currentDate;
//获得当前时间转化格式
+(NSString *)getCurrentFormatOfStringtimeNSString:(NSString *)time;
+(NSString *)getCurrentFormatOfStringtimeData:(NSDate*)date;
//版本信息
+(NSMutableArray *) fsPraseXmlVersion:(NSString *) xmlStr;

+(int)getCurrentTimeNumber:(NSString *)currtent;
@end
