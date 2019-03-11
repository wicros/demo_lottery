//
//  ILHtmlViewController.m
//  ItheimaLottery
//
//  Created by yz on 14-8-17.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "ILHtmlViewController.h"

#import "ILHtml.h"

@interface ILHtmlViewController ()<UIWebViewDelegate>



@end

@implementation ILHtmlViewController

- (void)loadView
{
    self.view = [[UIWebView alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.加载网页
    UIWebView *webView = (UIWebView *)self.view;
    webView.delegate = self;
    // 创建URL
    NSURL *url = [[NSBundle mainBundle] URLForResource:self.html.html withExtension:nil];
    
    // 创建请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    
    // 发送请求
    [webView loadRequest:request];
    
    // 添加取消按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
}
- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    // javascript里面不能用双引号，双引号在oc有特殊含义
    NSString *ID = [NSString stringWithFormat:@"window.location.href = '#%@'",self.html.ID];
    
    // 执行javascript
    [webView stringByEvaluatingJavaScriptFromString:ID];
}

@end
