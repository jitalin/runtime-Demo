//
//  NSDictionary+Model.m
//  Rumtime的运用
//
//  Created by 高飞 on 16/11/8.
//  Copyright © 2016年 高飞. All rights reserved.
//

#import "NSDictionary+Model.h"

@implementation NSDictionary (Model)
+ (NSString*)makeDicToModel:(NSDictionary* )dic{
    // 拼接属性字符串代码
    NSMutableString *strM = [NSMutableString string];
    
    // 1.遍历字典，把字典中的所有key取出来，生成对应的属性代码
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        NSString *type;
        
        if ([obj isKindOfClass:NSClassFromString(@"__NSCFString")]) {
            type = @"NSString";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFArray")]){
            type = @"NSArray";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFNumber")]){
            type = @"int";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFDictionary")]){
            type = @"NSDictionary";
        }else if ([obj isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            type = @"BooL";
        }
        
        // 属性字符串
        NSString *str;
        if ([type containsString:@"NS"]) {
            str = [NSString stringWithFormat:@"@property (nonatomic, strong) %@ *%@;",type,key];
        }else{
            str = [NSString stringWithFormat:@"@property (nonatomic, assign) %@ %@;",type,key];
        }
        // 每生成属性字符串，就自动换行。
        return [strM appendFormat:@"\n%@\n",str];
    }];
    // 把拼接好的字符串打印出来，就好了。
    NSLog(@"%@",strM);
    return strM;

}
/*KVC弊端
 模型中属性必须和字典的key一致,否则就报错
 如果不一致,系统会调用setValue: forUndefinedKey:
 解决办法,只需要重写setValue: forUndefinedKey:即可*/
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end
