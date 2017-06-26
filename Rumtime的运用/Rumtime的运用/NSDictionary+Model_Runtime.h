//
//  NSDictionary+Model_Runtime.h
//  Rumtime的运用
//
//  Created by 高飞 on 16/11/8.
//  Copyright © 2016年 高飞. All rights reserved.
//
/*RunTime实现字典转模型
 
 实现思路:遍历模型中所有属性,根据模型的属性名去字典中查找key,取出对应的的值,给模型的属性赋值*/
#import <Foundation/Foundation.h>
//意义不大
@interface NSDictionary (Model_Runtime)
+ (NSString*)makeDicToModelInRuntime:(NSDictionary* )dic;
@end
