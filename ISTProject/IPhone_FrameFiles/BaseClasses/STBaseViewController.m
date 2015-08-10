//
//  STBaseViewController.m
//  IceMan
//
//  Created by steven_l on 15/3/4.
//  Copyright (c) 2015年 steven_l. All rights reserved.
//

#import "STBaseViewController.h"
//#include "BSTopBar.h"
@interface STBaseViewController ()

@end

@implementation STBaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        if (IOSVersion < 7.0) {
            self.iosChangeFloat = 0;
        }else{
            self.iosChangeFloat = 20;
        }
        _reloadFlag = NO;

    }
    return self;
}
/** 导航栏 */
- (BSTopBar *)creatTopBarView:(CGRect)frame
{
    // 导航头
//    BSTopBar *tbTop = [[BSTopBar alloc] initWithFrame:frame];
//    [tbTop.btnTitle setTitle:@"天天运动" forState:UIControlStateNormal];
//    [tbTop setLetfTitle:nil];
//    [tbTop.btnLeft addTarget:self action:@selector(onClickTopBar:) forControlEvents:UIControlEventTouchUpInside];
//    return tbTop;
    return nil;
}

- (void)loadSubviews
{
    
}

- (void)loadView
{
    [super loadView];
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height)];
}

//重要：不然有偏移
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _contentView.contentInset = UIEdgeInsetsZero;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.iosChangeFloat + kNavHeight, kScreen_Width, kScreen_Height - (kNavHeight+self.iosChangeFloat))];
    _contentView.backgroundColor = kMainBGColor;
    _contentView.scrollEnabled = YES;
    _contentView.showsVerticalScrollIndicator = NO;
    _contentView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_contentView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
