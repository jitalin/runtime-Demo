//
//  NSArray+Name.h
//  Rumtime的运用
//
//  Created by 高飞 on 16/11/8.
//  Copyright © 2016年 高飞. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (Name)
/*在分类中添加新的属性（runtime)
 */
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *id;
// 如果该方法只有声明没有实现,会崩溃；添加动态方法的意义不大；
- (void)study;
@end
