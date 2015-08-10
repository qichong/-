//
//  LubeCRMLoginViewController.m
//  NewLubeCRM
//
//  Created by lijian on 14-5-29.
//  Copyright (c) 2014年 lijian. All rights reserved.
//

#import "LubeCRMLoginViewController.h"
#import "HttpManager.h"
#import "CRMUserLoginItem.h"


//#import "eventManagementViewController.h"
//#import "businessInfoViewController.h"
//#import "electronicMapViewController.h"
//#import "CRMPersonalInformationViewController.h"

//#import "ApproveMarketingViewController.h"


//#import "LubeNoticeViewController.h"

@interface LubeCRMLoginViewController ()

@end

@implementation LubeCRMLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
//    [self.backViewImage removeFromSuperview];
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    self.versionInfo.text=[NSString stringWithFormat:@"内部平台v%@",[infoDictionary objectForKey:@"CFBundleShortVersionString"]];
    
    self.userName.delegate=self;
    self.passWord.delegate=self;
    if (kScreen_Height>480) {
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"loginBackground640x1136.png"]];
        //        self.userName.frame=CGRectMake(80, 169, 210, 30);
        //        self.passWord.frame=CGRectMake(80, 217, 210, 30);
        //        self.loginButton.frame=CGRectMake(92, 293, 136, 42);
        //        self.ErrorInfo.frame=CGRectMake(20, 255, 280, 40);
        //        self.userNameimage.frame=CGRectMake(20, 164, 280, 40);
        //        self.passWordimage.frame=CGRectMake(20, 212, 280, 40);
    }else{
        self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"loginBackground.png"]];
    }
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"ios_button_default_03.png"] forState:UIControlStateNormal];
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"ios_button_click_03.png"] forState:UIControlStateSelected];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"loginUserName"]) {
        
        self.userName.text=[[NSUserDefaults standardUserDefaults] objectForKey:@"loginUserName"];
    }
    [self getVersionInformation];
    
}
//设置uitextfiled的retnrn按钮事件
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ([textField isEqual:self.userName]) {
        [self.passWord becomeFirstResponder];
    }else if([textField isEqual:self.passWord]){
        
        [self loginAction:nil];
    }
    return YES;
}
//登陆事件
- (IBAction)loginAction:(id)sender {
    self.loginButton.selected=YES;
//    [self resignTextFirstRespond];
    self.userName.text=[self.userName.text uppercaseString];
    self.passWordStr=self.passWord.text;
//    self.passWordStr=@"crm123";

    self.userNameStr=self.userName.text;
    if ([self.userNameStr isEqualToString:@""]||[self.passWordStr isEqualToString:@""]) {
        
        kTipAlert(@"用户名和密码错误");
        return;
    }
   
    NSString *url=[NSString stringWithFormat:@"%@CrmMobileManagerHandler.ashx?method=CrmLogin&authkey=",LOGING_URL];
    NSDictionary * dic=[[NSDictionary alloc]initWithObjectsAndKeys:self.userNameStr,@"loginName",self.passWordStr,@"password", nil];
    [[HttpManager sharedManager]addDownloadToQueue:url type:LOGING_TYPE dict:dic];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downloadLogin:) name:url object:nil];
}

/**
 *  登录交互通知
 *
 *  @param data 服务器返回携带登录返回信息的参数
 */
-(void)downloadLogin:(NSNotification *)data{
    
    CRMUserLoginItem * item =(CRMUserLoginItem*)[[HttpManager sharedManager].resultDict objectForKey:data.object];
//    NSLog(@"%@",item.PARVA);
    if ([item.TYPE isEqualToString:@"S"]) {
        NSLog(@"登陆成功");
//      记录登陆名
        [CRMPublicOperation sharedManager].userName=self.userNameStr;
        [CRMPublicOperation sharedManager].passWord=self.passWordStr;
//        保存登陆后的状态
         [CRMPublicOperation sharedManager].loginType=YES;
        
      [[NSUserDefaults standardUserDefaults] setObject:self.userNameStr forKey:@"loginUserName"];
        
        
//        发送token值
        [self sendTokenInfo];
        if (_delegate &&[_delegate respondsToSelector:@selector(loginSuccess)]) {
            [_delegate loginSuccess];
        }
    }else{
    
    
        if (item.MESSAGE) {
            self.ErrorInfo.text=item.MESSAGE;
        }else{
            self.ErrorInfo.text=@"网络错误,请检查您的网络连接";
        }
    }
}
-(void)sendTokenInfo{


    NSString *tokenRequesrUrl=[NSString stringWithFormat:@"%@MessageSendHandler.ashx?method=MessageSendToken",LOGING_URL];
    
    NSString *tokenInfo=@"token取值失败";
    
    //            [self shouAlertViewMessage:[CRMPublicOperation sharedManager].deviceToken];
    
    if ([[CRMPublicOperation sharedManager].deviceToken rangeOfString:@" "].length) {
        
        tokenInfo=[CRMPublicOperation sharedManager].deviceToken;
        NSString * tokenString=[[tokenInfo description]stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
        tokenInfo=[tokenString stringByReplacingOccurrencesOfString:@" " withString:@""];
        
    }
    NSDictionary * dic=[[NSDictionary alloc]initWithObjectsAndKeys:self.userName.text,@"loginName",[tokenInfo stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],@"token",@"iphone",@"device",nil];
    [[HttpManager sharedManager]addDownloadToQueue:tokenRequesrUrl type:POSTTOKEN_TYPE dict:dic];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(PostTokendownload:) name:tokenRequesrUrl object:nil];
}
-(void)PostTokendownload:(NSNotification*)data{
    
    //    NSString * type=[[HttpManager sharedManager].resultDict objectForKey:data.object];
    //    if ([type isEqualToString:@"E"]) {
    ////        [[NSUserDefaults standardUserDefaults] setObject:@"发送失败" forKey:@"loginUsrName"];
    //
    //        UIAlertView * show=[[UIAlertView  alloc]initWithTitle:@"token" message:@"发送失败" delegate:nil  cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
    //        [show show];
    //    }else if ([type isEqualToString:@"S"]){
    //        UIAlertView * show=[[UIAlertView  alloc]initWithTitle:@"token" message:@"发送成功" delegate:nil  cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
    //        [show show];
    //    }
    
}
-(void)btnClickSelect:(UIButton*)btn{
    NSLog(@"点击成功");
    for (UIButton * subBtn in btn.superview.subviews) {
        subBtn.selected=NO;
    }
    btn.selected=YES;
    UITabBarController * bar=(UITabBarController * )[UIApplication sharedApplication].delegate.window.rootViewController;
    bar.selectedIndex=btn.tag-104;
}

//获取版本信息更新版本
-(void)getVersionInformation{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    NSString *verson = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    NSURL *url=[[NSURL alloc] initWithString:[[NSString stringWithFormat:@"%@phone/iphone/version2.xml",LOGING_URL] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
//    NSURL * url=[NSURL URLWithString:@"http://mapp.sinopec.com/phone/iphone/version2.xml"];
    
    NSString *value=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSArray *array=[CRMPublicOperation fsPraseXmlVersion:value];
    if ([value length]) {
        //        isVPN = false;
    }
    if(array!=nil&&array.count>0)
    {
        NSDictionary *item=[array objectAtIndex:18];
        NSString *newVersion=[item objectForKey:@"versionid"];
        NSString *downUrl=[item objectForKey:@"downloadurl"];
        if(![newVersion isEqualToString:verson])
        {
            //存在新版本
            self.downLoadUrl=[NSString stringWithFormat:@"itms-services://?action=download-manifest&url=%@",downUrl];
            [self performSelectorOnMainThread:@selector(downNewVersion:) withObject:item waitUntilDone:NO];
        }
    }
}

-(void) downNewVersion:(NSDictionary *)item
{
    NSString *content = [item objectForKey:@"info"];
    NSString *versonId = [item objectForKey:@"versionid"];
    NSString * title =[NSString stringWithFormat:@"有可用的新版本%@",versonId];
    UIAlertView *versonAlert=[[UIAlertView alloc]initWithTitle:title message:content delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"更新",nil];
    [versonAlert show];
}


-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        //程序内更新
        NSURL *url=[[NSURL alloc] initWithString:[self.downLoadUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [[UIApplication sharedApplication] openURL:url];
    }
}

//点击任何地方放弃第一响应
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self resignTextFirstResponde];
}
-(void)resignTextFirstResponde
{
    if (_userName && ![_userName isExclusiveTouch]) {
        [_userName resignFirstResponder];
    }
    if (_passWord && ![_passWord isExclusiveTouch]) {
        [_userName resignFirstResponder];
    }
}

//失去第一响应者调用此方法
-(void)textFieldDidEndEditing:(UITextField *)textField{
    //用户名
    if (1111==textField.tag) {
        self.userNameStr=textField.text;
        
    }//登陆密码
    else if(2222==textField.tag){
        self.passWordStr=textField.text;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
