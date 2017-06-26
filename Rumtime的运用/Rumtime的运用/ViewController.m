//
//  ViewController.m
//  Rumtime的运用
//
//  Created by 高飞 on 16/11/8.
//  Copyright © 2016年 高飞. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Name.h"
#import "UIImage+MethodExchange.h"
#import "NSDictionary+Model.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray* array = [[NSArray alloc]init];
    array.name = @"rerere";
    array.id = @"1";
    NSLog(@"%@",array.name);
    [array study];
    [UIImage imageNamed:@""];
    NSDictionary* dict = @{@"name":@"daniel",@"number":@1232};
    
    [NSDictionary makeDicToModel:dict];
    
   
}

@end
