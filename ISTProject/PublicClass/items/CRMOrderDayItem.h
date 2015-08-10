//
//  CRMOrderDayItem.h
//  CRMIphone01
//
//  Created by lijian on 14-1-3.
//  Copyright (c) 2014年 lijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRMOrderDayItem : NSObject
@property(nonatomic,retain) NSString * productDescription;//产品描述
@property(nonatomic,retain) NSString *needNumber;//需求数量
@property(nonatomic,retain) NSString *coreNumber;//核对数量
@property(nonatomic,retain) NSString *userType;//客户状态
@property(nonatomic,retain) NSString *pricingDate;//定价时间
@property(nonatomic,retain) NSString *delivery;//送达方
@property(nonatomic,retain) NSString *  unit;//数量单位
@property(nonatomic,retain) NSString * orderFormID;//订单ID
@end
