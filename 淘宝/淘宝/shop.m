//
//  shop.m
//  淘宝
//
//  Created by 李胜营 on 16/5/15.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "shop.h"

@implementation shop
+ (instancetype)shopWithDic:(NSDictionary *)dic
{
    shop * shop = [[self alloc] init];
    [shop setValuesForKeysWithDictionary:dic];
    
    return shop;

}
@end
