//
//  MyModel.m
//  html
//
//  Created by qianfeng on 15/9/12.
//  Copyright (c) 2015年 靳占占. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel

+ (NSString *)JsonToString:(NSDictionary *)url
{
    NSString *html;
    NSString *head;
    NSString *body;
    
    html = @"<html lang='zh-CN'>";
    head = [NSString stringWithFormat:@"<head><link rel='stylesheet' href='%@'></head><body><img src='%@' width=375 height=300  />", [url objectForKey:@"css"][0],[url objectForKey:@"image"]];
    body = [NSString stringWithFormat:@"%@</body></html>", [url objectForKey:@"body"]];
    html = [html stringByAppendingString:head];
    html = [html stringByAppendingString:body];
    return html;
}


/*
 
 
 <img src="img.gif" width='100px" height="50px">
 
 你改成
 
 <div style="background:url('img.gif') no-repeat;width:100px;height:50px">这样就可以图片上加文字了</div>
 */


/*
 <div style="background:url('[url objectForKey:@"image"]') no-repeat;width:100px;height:50px">这样就可以图片上加文字了</div>
 */

@end