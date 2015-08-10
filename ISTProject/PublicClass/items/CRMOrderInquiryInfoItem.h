//
//  CRMOrderInquiryInfoItem.h
//  CRMIphone01
//
//  Created by lijian on 13-12-18.
//  Copyright (c) 2013年 lijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CRMOrderInquiryInfoItem : NSObject
@property(nonatomic,retain) NSString * productDescription;//产品描述
@property(nonatomic,retain) NSString *needNumber;//需求数量
@property(nonatomic,retain) NSString *coreNumber;//核对数量
@property(nonatomic,retain) NSString *userType;//客户状态
@property(nonatomic,retain) NSString *pricingDate;//定价时间
@property(nonatomic,retain) NSString *delivery;//送达方
@property(nonatomic,retain) NSString *  unit;//数量单位
@property(nonatomic,retain) NSString * orderFormID;//订单ID
@end
