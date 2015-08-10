//
//  CRMAuctionDetailsInfoItem.h
//  CRMIphone01
//
//  Created by lijian on 13-12-13.
//  Copyright (c) 2013年 lijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRMAuctionDetailsInfoItem : NSObject
@property (nonatomic,retain)NSString *ZCJGZ_TEXT;//成交规则
@property (nonatomic,retain)NSString *ZSL_RULE_TEXT;//数量规则
@property (nonatomic,retain)NSString *ZJG_RULE_TEXT;//价格规则
@property (nonatomic,retain)NSString *ZKWMENG;//最低起拍量
@property (nonatomic,retain)NSString *WERKS_TXT;//工厂
@property (nonatomic,retain)NSString *LGORT_TXT;//库位
@property (nonatomic,retain)NSString *ZTHDATEF;//提货开始时间
@property (nonatomic,retain)NSMutableArray *addVkorgArray;//增加销售组织数组
@end
