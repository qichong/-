//
//  BSTopBar.m
//  BSports
//
//  Created by 雷克 on 15/1/8.
//  Copyright (c) 2015年 ist. All rights reserved.
//

#import "BSTopBar.h"

@implementation BSTopBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        if (IOSVersion < 7.0) {
          self.iosChangeFloat = 0;
        }else{
          self.iosChangeFloat = 20;
        }
        [self initView];
    }
    return self;
}

- (void)initView
{
    //    self.blurTintColor = kColorBlue;
    self.backgroundColor = kThemeColor;
    UIView *vBar = [[UIView alloc] initWithFrame:CGRectMake(0, self.iosChangeFloat, self.width, kNavHeight)];
    vBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    CGFloat segmentWidth = vBar.width / 4;
    
    // 标题
    _btnTitle = [[UIButton alloc] initWithFrame:CGRectMake(segmentWidth, 0, segmentWidth * 2, vBar.height)];
    _btnTitle.titleLabel.font = kFontLarge_2_b;
    _btnTitle.tag = BSTopBarButtonTitle;
    _btnTitle.exclusiveTouch = YES;
    [_btnTitle setTitleColor:kWhiteColor forState:UIControlStateNormal];
    
    // 左按钮
    _btnLeft = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, segmentWidth, vBar.height)];
    _btnLeft.tag = BSTopBarButtonLeft;
    _btnLeft.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _btnLeft.titleLabel.font = kFontLarge_1;
    _btnLeft.titleEdgeInsets = UIEdgeInsetsMake(0, kButtonEdgeInsetsLeft, 0, 0);
    _btnLeft.imageEdgeInsets = UIEdgeInsetsMake(13, kButtonEdgeInsetsLeft, 13, 55);
    _btnLeft.exclusiveTouch = YES;
    [_btnLeft setTitleColor:kWhiteColor  forState:UIControlStateNormal];
    
    // 右按钮
    _btnRight = [[UIButton alloc] initWithFrame:CGRectMake(vBar.width - segmentWidth, 0, segmentWidth, vBar.height)];
    _btnRight.tag = BSTopBarButtonRight;
    _btnRight.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _btnRight.titleLabel.font = kFontLarge_1;
    _btnRight.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, kButtonEdgeInsetsLeft);
    _btnRight.exclusiveTouch = YES;
    [_btnRight setTitleColor:kWhiteColor  forState:UIControlStateNormal];
    
    //line:
    //UIView *line = [[UIView alloc] initLineWithFrame:CGRectMake(0, vBar.height-1, vBar.width, kLinePixel) color:kLine_Color];
    
    [vBar addSubview:_btnTitle];
    [vBar addSubview:_btnLeft];
    [vBar addSubview:_btnRight];
    //[vBar addSubview:line];
    
    [self addSubview:vBar];
}

- (void)setLetfTitle:(NSString *)title
{
    if (title == nil || ![title length]) {
        [_btnLeft setImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
        _btnLeft.imageEdgeInsets = [_btnLeft setImageEdgeInsetsFromOriginOffSet:CGVectorMake(15,15) imageSize:CGSizeMake(8, 15)];
    }
    [_btnLeft setTitle:title forState:UIControlStateNormal];
}

- (void)setRightTitle:(NSString *)title
{
    [_btnRight setTitle:title forState:UIControlStateNormal];
}

- (void)setShrink:(BOOL)shrink animated:(BOOL)animated
{
    
}

@end