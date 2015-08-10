//
//  BSNetStatusHintView.h
//  BSports
//
//  Created by 高大鹏 on 15/3/24.
//  Copyright (c) 2015年 ist. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NetworkReloadDataDelegate;

@interface BSNetStatusHintView : UIView

//@property (nonatomic, assign) ErrorType errorType;
@property (nonatomic,assign) ErrorType errorType;
@property (nonatomic, assign) id<NetworkReloadDataDelegate> delegate;

- (id)initWithFrame:(CGRect)frame;

- (void)show;
- (void)hide;

@end

@protocol NetworkReloadDataDelegate <NSObject>

@optional
- (void)reloadData;
- (void)checkNetwork;

@end