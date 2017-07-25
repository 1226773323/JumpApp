//
//  ViewController.m
//  AppTow
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
    
    lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 60)];
    
    lable.numberOfLines = 0;
    textFieldTwo = [[UITextField alloc] initWithFrame:CGRectMake(70, 100, 180, 40)];
    textFieldTwo.borderStyle = UITextBorderStyleRoundedRect;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(80, 150, 160, 40)];
    //    [button setBackgroundColor:[UIColor redColor]];
    [button setTitle:@"Goto APP One" forState:UIControlStateNormal];
    [self.view addSubview:textFieldTwo];
    [self.view addSubview:button];
    [self.view addSubview:lable];
    [button addTarget:self action:@selector(gotoAppTow) forControlEvents:UIControlEventTouchUpInside];

    self.view.backgroundColor = [UIColor whiteColor];
    
    _chooseImageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_chooseImageButton setTitle:@"不带图片传递" forState:UIControlStateNormal];
    [_chooseImageButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_chooseImageButton setFrame:CGRectMake(80, 300, 160, 40)];
    [_chooseImageButton addTarget:self action:@selector(chooseImageClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_chooseImageButton];

    
}

/**
 跳带参转到AppTow
 */
- (void)gotoAppTow
{
       // 打开AppTwo应用, 如果你想携带参数: NSURL *url  = [NSURLURLWithString:@"AppOneShemes://你想携带的代数"] 不想携带直接AppOneShemes://;
    NSString *ourPath = [NSString stringWithFormat:@"AppOneShemes://com.ecpss.apps.AppOow?paramsOne=%@&paramsTow=%@",textFieldTwo.text,@"APPParamsTest"];
    NSURL *ourURL = [NSURL URLWithString:ourPath];
    if ([[UIApplication sharedApplication] canOpenURL:ourURL])  // 判断设备是否安装了AppTwo
    {
        NSLog(@"canOpenURL");
        if ([[_chooseImageButton titleForState:UIControlStateNormal] isEqualToString:@"带图片传递"]) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        pasteboard.string = @"Modal.png";
        pasteboard.image = [UIImage imageNamed:@"Modal.png"];
        }
        // NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"Modal.png"], 0);
        // [pasteboard setData:imageData forPasteboardType:@"Modal.png"];
        
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_10_0
        
        //1）亲测key:UIApplicationOpenURLOptionUniversalLinksOnly无效,目前使用的是这个key:UIApplicationOpenURLOptionsSourceApplicationKey 可能iOS10 以后,canurl 与openurl合并一个 可以实现动态跳转不用配置
        //2）这个参数有什么作用能,如果我设置它为true并打开URL：https://twitter.com/kharrison 时, 如果我并没有安装Twitter app那它就会失败，同时会调用safari来打开这个链接。
        NSDictionary *options = @{UIApplicationOpenURLOptionsSourceApplicationKey :@YES};
        [[UIApplication sharedApplication] openURL:ourURL options:options completionHandler:nil];
        //3)也可以传空字典,就像下方代码一样调用也是可以使用.
        //        [[UIApplication sharedApplication] openURL:ourURL options:@{} completionHandler:^(BOOL success) {
        //            if (success) {
        //                NSLog(@"跳转成功！");
        //            }
        //        }];
#else
        [[UIApplication sharedApplication] openURL:ourURL];
        
#endif
        
    } else
    {
        NSLog(@"can not OpenURL");
        
    }
}

- (IBAction)chooseImageClick:(UIButton*)sender {
    
   
[sender setTitle:@"带图片传递" forState:UIControlStateNormal];
 
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
