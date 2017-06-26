//
//  NSArray+Name.m
//  Rumtime的运用
//
//  Created by 高飞 on 16/11/8.
//  Copyright © 2016年 高飞. All rights reserved.
//

#import "NSArray+Name.h"
#import <objc/runtime.h>
@implementation NSArray (Name)
static char const* arrayName;
static char const* arrayId;
/*4.动态添加属性
 
 属性的本质:让对象的某个属性与值产生关联
 
 使用场景:给系统的类添加属性
 */
- (void)setName:(NSString *)name{
    /*
     object:保存到哪个对象中
     key:用什么属性保存 属性名
     value:保存值
     policy:策略,strong,weak
     */

    objc_setAssociatedObject(self, arrayName, name, 1);
    
}
- (void)setId:(NSString *)id{
    objc_setAssociatedObject(self, arrayId, id, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
- (NSString *)id{
   return  objc_getAssociatedObject(self, arrayId);
    
}
- (NSString *)name{
    /**
     *  获取到某个类的某个关联对象
     *
     *  @param object#> 关联的对象 description#>
     *  @param key#>    属性的key值 description#>
     */
    return objc_getAssociatedObject(self, arrayName);
}

/* 动态去判断下study方法有没有实现,如果没有实现,动态添加.
 作用:处理未实现的对象方法
 调用时刻:只要调用了一个不存在的对象方法就会调用
 sel:就是未实现方法编号

 判断对象方法有没有实现
+(BOOL)resolveInstanceMethod:(SEL)sel
 判断类方法有没有实现
+ (BOOL)resolveClassMethod:(SEL)sel
*/

void study(id self, SEL _cmd) {
    
    NSLog(@"动态添加了一个学习英语的方法");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    if (sel == NSSelectorFromString(@"study")) {
        // 参数解释:
        // Class;给哪个类添加方法
        // SEL:添加方法
        // IMP:方法实现,函数名
        // type: 方法类型：void用v来表示，id参数用@来表示，SEL用:来表示

        // 注意:这里需要强转成IMP类型
   
        
        class_addMethod(self, sel, (IMP)study, "v@:");
        return YES;
    }
    // 先恢复, 不然会覆盖系统的方法
    return [super resolveInstanceMethod:sel];
}

/*inline函数从源代码层看，有函数的结构，而在编译后，却不具备函数的性质。编译时，类似宏替换，使用函数体替换调用处的函数名。一般在代码中用inline修饰，但是能否形成内联函数，需要看编译器对该函数定义的具体处理。用inline的函数比一般函数调用速度快， 但会占用更多内存空间
 static 函数 不能被外部文件调用的,只能被在本文件调用的*/
static inline void animated_gif_swizzleSelector(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    //动态添加方法
    if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        //如果已存在方法名，则新的覆盖旧的方法名
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        //方法置换
        method_exchangeImplementations(originalMethod, swizzledMethod);
        
    }
    
}

@end
