//
//  MyModel.h
//  html
//
//  Created by qianfeng on 15/9/12.
//  Copyright (c) 2015年 靳占占. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject

@property (nonatomic,copy) NSString *body;//html的body
@property (nonatomic,copy) NSString *image_source;//头视图 图片资源  自己把代码粘浏览器看看
@property (nonatomic,copy) NSString *title;//图片上面的标题
@property (nonatomic,copy) NSString *image;//头视图
@property (nonatomic,copy) NSString *css;//css

+ (NSString *)JsonToString:(NSDictionary *)url;

@end
