//
//  ConstantValue.h
//  JieXinIphone
//
//  Created by liqiang on 14-2-19.
//  Copyright (c) 2014年 sunboxsoft. All rights reserved.
//


// 79  端口是80
#define  kDomain    @"http://42.96.173.8:8080/Interface/"
#define  kImageUrlPrefix    @"http://42.96.173.8:8080/"



#define  kNavHeight  44
#define  kTabbarHeight 50
#define kOperationBtnsViewHeight  44
//#define kTabBarHeight           100/2.0


typedef NS_ENUM(NSInteger, ModelCatagoryType) {
    NewUpLoadType = 1,
    MostDownLoad,
    MostPopular,
};

typedef NS_ENUM(NSInteger, HttpRequestType) {
    LoginRequestType,
    RegisterRequestType,
    CollectionRequestType,
    LikeModelRequestType,
    ModelListRequestType,
    ModelDetailInfoRequestType,
    
};

//error页面
typedef enum
{
    ErrorType_NetWork,              //网络请求失败
    ErrorType_DataLoad,             //获取数据为空或者接口请求失败
}ErrorType;


/**颜色设定**/
#define  kMainBGColor            RGBCOLOR(246,246,246)
#define  kThemeColor             RGBCOLOR(12,77,187)
#define  kMainTheme_Color        RGBCOLOR(238,120,0)
#define  kLine_Color             RGBCOLOR(221, 222, 222)
#define  kBookabel_Color         RGBCOLOR(105, 189, 131)
#define  kLeftMenuBG_Color       RGBCOLOR(76, 73, 72)
#define  kLeftMenuText_Color     RGBCOLOR(201, 202, 202)
#define  kGrayBGColor            RGBCOLOR(239, 239, 239)
#define  kDarkGrayText           RGBCOLOR(137, 137, 137)
#define  kMainGrayBGColor        RGBCOLOR(170, 171, 171)
#define  kWhiteColor             RGBCOLOR(255, 255, 255)
#define  kLightGray              RGBCOLOR(114, 113, 113)

#define  kCarPay_Color           RGBCOLOR(215,0,127)
#define  kWXPay_Color            RGBCOLOR(72,178,52)
#define  kZFBPay_Color           RGBCOLOR(84,104,141)
#define  kZFBWebPay_Color        RGBCOLOR(239,120,0)
//rgb颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]


/**字体设定**/
#define kFontHuge               [UIFont systemFontOfSize:24]
#define kFontHuge_b             [UIFont boldSystemFontOfSize:24]
#define kFontSuper              [UIFont systemFontOfSize:20]
#define kFontSuper_b            [UIFont boldSystemFontOfSize:20]
#define kFontLarge_1            [UIFont systemFontOfSize:15]
#define KFontLarge_1_6          [UIFont systemFontOfSize:16]
#define kFontLarge_1_b          [UIFont boldSystemFontOfSize:15]
#define kFontLarge_2            [UIFont systemFontOfSize:19]
#define kFontLarge_2_b          [UIFont boldSystemFontOfSize:19]

#define kFontNormalBold         [UIFont boldSystemFontOfSize:14]
#define kFontNormal             [UIFont systemFontOfSize:14]
#define kFontMiddle             [UIFont systemFontOfSize:13]
#define kFontSmall              [UIFont systemFontOfSize:12]
#define kFontSmallBold          [UIFont boldSystemFontOfSize:12]
#define kFontTiny               [UIFont systemFontOfSize:11]
#define kFontMini               [UIFont systemFontOfSize:10]


