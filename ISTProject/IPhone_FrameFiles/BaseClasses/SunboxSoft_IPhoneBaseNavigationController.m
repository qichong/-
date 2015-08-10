//
//  SunboxSoft_IPhoneBaseNavigationController.m
//  SunboxApp_Standard_IPhone2.0
//
//  Created by 张 云鹤 on 12-12-29.
//  Copyright (c) 2012年 liqiang. All rights reserved.
//

#import "SunboxSoft_IPhoneBaseNavigationController.h"

@interface SunboxSoft_IPhoneBaseNavigationController ()<UINavigationControllerDelegate>

@end

@implementation SunboxSoft_IPhoneBaseNavigationController

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
	// Do any additional setup after loading the view.
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        [self.interactivePopGestureRecognizer setEnabled:YES];
        self.interactivePopGestureRecognizer.delegate = self;
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait||interfaceOrientation==UIInterfaceOrientationPortraitUpsideDown);
}


- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{

}


@end
