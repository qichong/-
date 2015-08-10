//
//  BSNetStatusHintView.m
//  BSports
//
//  Created by 高大鹏 on 15/3/24.
//  Copyright (c) 2015年 ist. All rights reserved.
//

#import "BSNetStatusHintView.h"

@implementation BSNetStatusHintView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kMainBGColor;
    }
    
    return self;
}

- (void)layoutSubviews
{
    for (id elem in self.subviews) {
        [elem removeFromSuperview];
    }
    
    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 43)];
    logoView.center = CGPointMake(self.centerX, 100);
    logoView.image = [UIImage imageNamed:@"erro_logo.png"];
    [self addSubview:logoView];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, logoView.maxY + 10, kScreen_Width, 30)];
    textLabel.text = @"咦！数据加载失败了！";
    textLabel.textColor = kDarkGrayText;
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:textLabel];
    
    UIButton *reloadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    reloadBtn.frame = CGRectMake(self.width/2-50, textLabel.maxY + 20, 100, 100);
    [reloadBtn setImage:[UIImage imageNamed:@"reload.png"] forState:UIControlStateNormal];
    [reloadBtn addTarget:self action:@selector(reloadBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:reloadBtn];
    
    if (_errorType == ErrorType_NetWork) {
        UIView *netBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, 30)];
        netBar.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:netBar];
        
        UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 13, 20)];
        logoView.image = [UIImage imageNamed:@"requestLogo.png"];
        logoView.userInteractionEnabled = YES;
        [netBar addSubview:logoView];
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(logoView.maxX + 10, 5, 250, 20)];
        titleLabel.text = @"网络请求失败，请检查您的网络设置";
        titleLabel.font = kFontNormal;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = kWhiteColor;
        titleLabel.textAlignment = NSTextAlignmentLeft;
        [netBar addSubview:titleLabel];
        
        UIImageView *arrow = [[UIImageView alloc] initWithFrame:CGRectMake(self.width - 20, 7, 8, 15)];
        arrow.image = [UIImage imageNamed:@"jintou5[white].png"];
        [netBar addSubview:arrow];
        
        
        UIButton *checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [checkBtn setBackgroundColor:[UIColor clearColor]];
        checkBtn.frame = netBar.bounds;
        [checkBtn addTarget:self action:@selector(checkBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [netBar addSubview:checkBtn];
    }
}

#pragma mark - 按钮方法

- (void)reloadBtnPressed:(UIButton *)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(reloadData)]) {
        [_delegate reloadData];
    }
}

- (void)checkBtnPressed:(UIButton *)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(checkNetwork)]) {
        [_delegate checkNetwork];
    }
}

#pragma mark - 显示及隐藏

- (void)show
{
    [self layoutSubviews];
}

- (void)hide
{
    [self removeFromSuperview];
}

@end
