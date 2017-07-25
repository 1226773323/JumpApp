//
//  ViewController.m
//  AppOne
//
//  Created by LiLong on 2017/7/20.
//  Copyright © 2017年 上海沛池金融信息服务有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textFieldTwo;
@synthesize lable;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 60)];
    lable.numberOfLines = 0;
    textFieldTwo = [[UITextField alloc] initWithFrame:CGRectMake(70, 100, 180, 40)];
    textFieldTwo.borderStyle = UITextBorderStyleRoundedRect;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(80, 150, 160, 40)];
    //    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"Goto APP Tow" forState:UIControlStateNormal];
    [self.view addSubview:textFieldTwo];
    [self.view addSubview:button];
    [self.view addSubview:lable];
    [button addTarget:self action:@selector(gotoAppTow) forControlEvents:UIControlEventTouchUpInside];
    
    
    _showIamge = [[UIImageView alloc] initWithFrame:CGRectMake(80, 300, 50, 50)];
    [self.view addSubview:_showIamge];
    
    
}


/**
 跳带参转到AppTow
 */
- (void)gotoAppTow
{
    
    // 打开AppTwo应用, 如果你想携带参数: NSURL *url  = [NSURLURLWithString:@"AppOneShemes://你想携带的代数"] 不想携带直接AppOneShemes://;
    NSString *ourPath = [NSString stringWithFormat:@"AppTowShemes://com.ecpss.apps.AppTow?paramsOne=%@&paramsTow=%@",textFieldTwo.text,@"APPParamsTest"];
    NSURL *ourURL = [NSURL URLWithString:ourPath];
    
    if ([[UIApplication sharedApplication] canOpenURL:ourURL])  // 判断设备是否安装了AppTwo
    {
        NSLog(@"canOpenURL");
        
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_10_0
        [[UIApplication sharedApplication] openURL:ourURL options:@{} completionHandler:^(BOOL success) {
            if (success) {
                NSLog(@"跳转成功！");
            }
            
        }];
#else
        [[UIApplication sharedApplication] openURL:ourURL];
        
#endif
        
    } else
    {
        NSLog(@"can not OpenURL");
        
    }
}


@end
