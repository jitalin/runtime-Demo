//
//  NSDictionary+Model.h
//  Rumtime的运用
//
//  Created by 高飞 on 16/11/8.
//  Copyright © 2016年 高飞. All rights reserved.
//

#import <Foundation/Foundation.h>
/*KVC字典转模型*/
@interface NSDictionary (Model)
+ (NSString*)makeDicToModel:(NSDictionary* )dic;
- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
@end
