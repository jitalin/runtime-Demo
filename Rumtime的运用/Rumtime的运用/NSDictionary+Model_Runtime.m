//
//  NSDictionary+Model_Runtime.m
//  Rumtime的运用
//
//  Created by 高飞 on 16/11/8.
//  Copyright © 2016年 高飞. All rights reserved.
//

#import "NSDictionary+Model_Runtime.h"
#import <objc/runtime.h>
@implementation NSDictionary (Model_Runtime)
//+ (NSString*)makeDicToModelInRuntime:(NSDictionary* )dic{
//    /*1.一级转换
//    class_copyIvarList(self, &count)该方法第一个参数是要获取哪个类中的成员属性,第二个参数是这个类中有多少成员属性,需要传入地址,返回值Ivar是个数组,会将所有成员属性放入这个数组中
//     */
//    id objc = [[self alloc] init];
//    
//    unsigned int count;
//    
//    // 获取类中的所有成员属性
//    Ivar *ivarList = class_copyIvarList(self, &count);
//    
//    for (int i = 0; i < count; i++) {
//        Ivar ivar = ivarList[i];
//        
//        // 获取成员属性名
//        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
//        
//        // 处理成员属性名->字典中的key
//        // 从第一个角标开始截取
//        NSString *key = [name substringFromIndex:1];
//        
//        // 根据成员属性名去字典中查找对应的value
//        id value = dic[key];
//
//        /*2.二级转换
//         判断字典中是否存在字典,如果存在,转为模型
//         字典属性生成的是@"@\"xxxx\""类型,需要裁减为@"xxxx"
//         
//*/
//        if ([value isKindOfClass:[NSDictionary class]]) {
//            // 获取成员属性类型
//            NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
//            // 生成的是这种@"@\"User\"" 类型 -》 @"User"  在OC字符串中 \" -> "，\是转义的意思，不占用字符
//            // 裁剪类型字符串
//            NSRange range = [type rangeOfString:@"\""];
//            
//            type = [type substringFromIndex:range.location + range.length];
//            range = [type rangeOfString:@"\""];
//            // 裁剪到哪个角标，不包括当前角标
//            type = [type substringToIndex:range.location];
//            // 根据字符串类名生成类对象
//            Class modelClass = NSClassFromString(type);
//            if (modelClass) {
//                value  =  [modelClass modelWithDict:value];
//            }
//        }
//        
//        
//        /*3.三级转换
//         通过给分类添加一个协议,来实现将数组中的字典转为模型
//         
//*/
//        if ([value isKindOfClass:[NSArray class]])
//        {
//            // 判断对应类有没有实现字典数组转模型数组的协议
//            if ([self respondsToSelector:@selector(arrayContainModelClass)]) {
//                
//                // 转换成id类型，就能调用任何对象的方法
//                id idSelf = self;
//                // 获取数组中字典对应的模型
//                NSString *type =  [idSelf arrayContainModelClass][key];
//                // 生成模型
//                Class classModel = NSClassFromString(type);
//                NSMutableArray *arrM = [NSMutableArray array];
//                // 遍历字典数组，生成模型数组
//                for (NSDictionary *dict in value) {
//                    // 字典转模型
//                    id model =  [classModel modelWithDict:dict];
//                    [arrM addObject:model];
//                }
//                // 把模型数组赋值给value
//                value = arrM;
//            }
//        }
//}
@end
