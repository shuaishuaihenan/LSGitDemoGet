//
//  ViewController.m
//  html
//
//  Created by qianfeng on 15/9/12.
//  Copyright (c) 2015年 靳占占. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "MyModel.h"

#define kUrl @"http://news-at.zhihu.com/api/4/story/7089958"//自己看接口
//效果界面 http://daily.zhihu.com/story/7089958  我只要内容查看原文 不要“查看知乎讨论” 以及作者

@interface ViewController ()<UIWebViewDelegate>
{
    AFHTTPRequestOperationManager *_manager;
    NSMutableArray *_dataArr;
}

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _manager =[AFHTTPRequestOperationManager manager];
    _manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [self showView:kUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showView:(NSString *)url{
    
    //写吧。。。 json文件你可以自己看
    NSError *error;
    NSURLRequest *request;
    NSData *response = nil;
    while (response == nil) {
        request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        
        response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    }
    NSDictionary *weatherDic = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
    NSLog(@"%@", [MyModel JsonToString:weatherDic]);
    
    UIWebView *web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:web];
    [web loadHTMLString:[MyModel JsonToString:weatherDic] baseURL:nil];
    
    
}

@end

