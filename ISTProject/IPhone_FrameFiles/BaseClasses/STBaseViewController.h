//
//  STBaseViewController.h
//  IceMan
//
//  Created by steven_l on 15/3/4.
//  Copyright (c) 2015年 steven_l. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSNetStatusHintView.h"
//@class BSTopBar;
#import "BSTopBar.h"
@interface STBaseViewController : UIViewController<UIScrollViewDelegate,NetworkReloadDataDelegate>
{
    BSTopBar *_tbTop;
    UIScrollView *_contentView;
    BSNetStatusHintView *_netErrorView;
    BOOL _reloadFlag;
}

//ios7和ios6的高度变化
@property (nonatomic, assign) CGFloat iosChangeFloat;
- (void)onClickTopBar:(UIButton *)btn;

//网络错误页面
- (void)layoutNetStatusHintView;
- (void)layoutNullDataHintView;

- (void)layoutNetStatusHintViewNoTab;
- (void)layoutNullDataHintViewNoTab;


//直接输出错误信息
- (void)outputErrorInfo:(NSDictionary *)dict andDefault:(NSString *)str;
//返回请求Msg信息
- (NSString *)getMsg:(NSDictionary *)dict andDefault:(NSString *)str;


@end
