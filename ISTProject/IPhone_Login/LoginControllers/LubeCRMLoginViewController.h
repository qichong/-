//
//  LubeCRMLoginViewController.h
//  NewLubeCRM
//
//  Created by lijian on 14-5-29.
//  Copyright (c) 2014年 lijian. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  登录成功的代理
 */
@protocol LoginSuccess <NSObject>
- (void)loginSuccess;
@end

@interface LubeCRMLoginViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UILabel *ErrorInfo;
@property (strong, nonatomic) IBOutlet UILabel *versionInfo;



@property (nonatomic,retain) NSString * userNameStr;
@property (nonatomic,retain) NSString * passWordStr;
@property (nonatomic,retain)NSString * downLoadUrl;
@property (nonatomic,assign) id <LoginSuccess>delegate;
@end
