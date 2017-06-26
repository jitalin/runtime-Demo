//
//  UIImage+MethodExchange.h
//  Rumtime的运用
//
//  Created by 高飞 on 16/11/8.
//  Copyright © 2016年 高飞. All rights reserved.
//

#import <UIKit/UIKit.h>
//交换方法
@interface UIImage (MethodExchange)
// 声明方法
// 如果跟系统方法差不多功能,可以采取添加前缀,与系统方法区分
+ (UIImage *)wg_imageWithName:(NSString *)imageName;
+ (UIImage *)wg_initWithContentsOfFile:(NSString*)path;

@end
