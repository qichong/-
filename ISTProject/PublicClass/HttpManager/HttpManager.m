//
//  HttpManager.m
//  SnsDemo
//
//  Created by DuHaiFeng on 13-5-23.
//  Copyright (c) 2013年 dhf. All rights reserved.
//

#import "HttpManager.h"
#import "HttpHelper.h"
#import "GDataXMLNode.h"
#import "CRMUserLoginItem.h"
#import "CRMAnnInfoItem.h"
#import "CRMAuctionLIstItem.h"
#import "OrderFormItem.h"
#import "CRMAuctionBidListItem.h"
#import "CRMAddVkorgItem.h"
#import "CRMAuctionDetailsInfoItem.h"
#import "CRMOrderInquiryInfoItem.h"
#import "CRMContactSupportInfoItem.h"
#import "CRMOrderDayItem.h"
#import "CRMCompetitiveTenderListItem.h"
//应用添加的新Item
//#import "LocationListitem.h"
//#import "BalanceFractionItem.h"
//#import "DeliveryOrderItem.h"
//#import "InvoiceInquireItem.h"
//#import "SecurityCodeItem.h"
//#import "ShippingOrderItem.h"
//#import "ActiveQueryItem.h"
//#import "AudtActiveListItem.h"
//#import "NearbyCustomerItem.h"
//#import "ApproveMarketingItem.h"
//#import "executeprojectItem.h"
//#import "ApplyForOrderItem.h"
//#import "AgreementRebateItem.h"
//#import "AgreementItem.h"
//#import "ProjectItem.h"
//#import "LubeApproveOrderItem.h"
//#import "SellJournalItem.h"
//
//#import "CustomerCallOnItem.h"
//#import "CustomerTradeInfoItem.h"
////客户搜索信息
//#import "CustomerInfo.h"
//#import "ContactInfo.h"
//
////客户开发状态
//#import "customerDevelopermentItem.h"
////客户销售统计
//#import "CustomerSalesStatisticsItem.h"
////修改用油档案
//#import "NewLubeUseFileManageItem.h"

static HttpManager *gl_HttpManager=nil;
@implementation HttpManager
@synthesize resultDict;
+(HttpManager*)sharedManager
{
    if (!gl_HttpManager) {
        gl_HttpManager=[[HttpManager alloc] init];
    }
    return gl_HttpManager;
}
-(id)init
{
    if (self=[super init]) {
        downloadQueue=[[NSMutableDictionary alloc] init];
        
        resultDict=[[NSMutableDictionary alloc] init];
    }
    return self;
}
-(void)addDownloadToQueue:(NSString *)url type:(NSInteger)type
{
    HttpHelper *hh=[[HttpHelper alloc] init];
    hh.type=type;
    hh.delegate=self;
    hh.mUrl=url;
    hh.method=@selector(downloadComplete:);
//    [hh downloadFromUrl:url];
    [hh downloadFromUrl:url];
//    [hh downloadFromUrlWithASI:url];
    [downloadQueue setObject:hh forKey:url];
    [hh release];
}
-(void)addDownloadToQueue:(NSString *)url type:(NSInteger)type dict:(NSDictionary *)dict
{
    HttpHelper *hh=[[HttpHelper alloc] init];
    hh.type=type;
    hh.delegate=self;
    hh.method=@selector(downloadComplete:);
    [hh downloadFromUrlWithASIByPost:url dict:dict];
    hh.mUrl=url;
    [downloadQueue setObject:hh forKey:url];
    [hh release];
}
//解析登录
-(void)parseLogin:(HttpHelper*)hh
{
    GDataXMLDocument* document=[[GDataXMLDocument alloc]initWithData:hh.downloadData options:0 error:nil];
    CRMUserLoginItem * userItem =[[CRMUserLoginItem alloc]init];
    if (document) {
   //解析XML
        GDataXMLElement *root = [document rootElement];
        NSArray * TYPE=[root nodesForXPath:@"EsReturn/Type" error:nil];
        NSArray * MESSAGE =[root nodesForXPath:@"EsReturn/Message" error:nil];
        NSArray *PARVA=[root nodesForXPath:@"EtProfile/item/Parva" error:nil];
//        NSArray *VKORG=[root nodesForXPath:@"ET_VKORG/item/VKORG" error:nil];
//        NSArray *VKORG_TXT=[root nodesForXPath:@"ET_VKORG/item/VKORG_TXT" error:nil];
        userItem.TYPE=[[TYPE lastObject] stringValue];
        userItem.MESSAGE=[[MESSAGE lastObject]  stringValue];
        userItem.PARVA=[[PARVA lastObject]  stringValue];
//        userItem.VKORG=[[VKORG lastObject]  stringValue];
//        userItem.VKORG_TXT=[[VKORG_TXT lastObject] stringValue];
    
//  保存销售组织标识和销售组织名      
        [CRMPublicOperation sharedManager].salesGroup =userItem.VKORG;
        [CRMPublicOperation sharedManager].VKORG_TXT=userItem.VKORG_TXT;
    
        [CRMPublicOperation sharedManager].profile =userItem.PARVA;
        
    }
//储存解析对象
    [self.resultDict setObject:userItem forKey:hh.mUrl];
    

}
//获取token发送之后值
-(void)getPostTokenInfo:(HttpHelper*)hh{
    
    GDataXMLDocument * document=[[GDataXMLDocument alloc]initWithData:hh.downloadData options:0 error:nil];
    if (document) {
        
        //解析XML
        GDataXMLElement *root = [document rootElement] ;
        
        NSString * type =[[[root nodesForXPath:@"EsReturn/Type" error:nil]lastObject] stringValue];
        
        [self.resultDict setObject:type forKey:hh.mUrl];
    }
}
//下载解析类
-(void)downloadComplete:(HttpHelper*)hh
{
    [CRMPublicOperation sharedManager].requestBackInfo=nil;
    switch (hh.type) {
        case LOGING_TYPE:
            [self parseLogin:hh];
            break;

        
            break;
        case  POSTTOKEN_TYPE:
            [self getPostTokenInfo:hh];
            break;
        case RequestCustomerSalesStatisticsInfo:
            
            [self getRequestCustomerSalesStatisticsInfo:hh];
            break;
            
        default:
            
            break;
    }
        [[NSNotificationCenter defaultCenter] postNotificationName:hh.mUrl object:hh.mUrl];
    
}

@end
