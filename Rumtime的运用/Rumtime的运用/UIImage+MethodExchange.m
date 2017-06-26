//
//  UIImage+MethodExchange.m
//  Rumtime的运用
//
//  Created by 高飞 on 16/11/8.
//  Copyright © 2016年 高飞. All rights reserved.
//
/*不能在分类中重写系统方法imageNamed，因为会把系统的功能给覆盖掉，而且分类中不能调用super.*/
#import "UIImage+MethodExchange.h"
#import <objc/runtime.h>
@implementation UIImage (MethodExchange)
+ (void)load {
    /*
     self:UIImage
     谁的事情,谁开头 1.发送消息(对象:objc) 2.注册方法(方法编号:sel) 3.交互方法(方法:method) 4.获取方法(类:class)
     Method:方法名
     
     获取方法,方法保存到类
     Class:获取哪个类方法
     SEL:获取哪个方法
     imageName
     */
    // 获取imageName:方法的地址
    Method imageNameMethod = class_getClassMethod(self, @selector(imageNamed:));
   
   Method initWithContentsOfFileMethod = class_getClassMethod(self, @selector(initWithContentsOfFile:));
    
    // 获取wg_imageWithName:方法的地址
    Method wg_imageWithNameMethod = class_getClassMethod(self, @selector(wg_imageWithName:));
    Method wg_initWithContentsOfFileMethod = class_getClassMethod(self, @selector(wg_initWithContentsOfFile:));
    
    // 交换方法地址，相当于交换实现方式(避免重写系统方法imageNamed）
    method_exchangeImplementations(imageNameMethod, wg_imageWithNameMethod);
    method_exchangeImplementations(initWithContentsOfFileMethod, wg_initWithContentsOfFileMethod);
    
    
}
// 加载图片, 判断是否为空
+ (UIImage *)wg_imageWithName:(NSString *)imageName
{
    // 这里调用imageWithName，相当于调用imageName
    UIImage *image = [UIImage wg_imageWithName:imageName];
    if (!image) {
        NSLog(@"Alex : 图片不存在");
    }
    return image;
}
+ (UIImage *)wg_initWithContentsOfFile:(NSString *)path{
    UIImage* image = [[UIImage alloc]initWithContentsOfFile:path];
    if (!image) {
        NSLog(@"alex:图片不存在");
        
    }
    return image;
}
@end
