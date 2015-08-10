//
//  CRMAuctionLIstItem.h
//  CRMIphone01
//
//  Created by lijian on 13-12-9.
//  Copyright (c) 2013年 lijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRMAuctionLIstItem : NSObject
@property(nonatomic,retain)NSString * tenderNumber;
@property(nonatomic,retain)NSString * tenderName;
@property(nonatomic,retain)NSString * tenderType;
@property(nonatomic,retain)NSString * currentTime;
@property(nonatomic,retain)NSString * totalQuantity;//起拍数量
@property(nonatomic,retain)NSString * minimumQuantity;//总数量
@property(nonatomic,retain)NSString * unit;//数量单位
@property(nonatomic,retain)NSString * currentTime2;

@property(nonatomic,retain)NSString * ZPRICE;//起拍价格
@property(nonatomic,retain)NSString * ZJG_RULE;//竞拍价格报价最小单位（元）
@property(nonatomic,retain)NSString  *rankingType;//排名是否可见
@property(nonatomic,retain)NSMutableArray * vkorgArray;//增加销售组织数组数组


@end
