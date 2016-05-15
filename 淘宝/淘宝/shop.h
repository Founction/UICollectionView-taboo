//
//  shop.h
//  淘宝
//
//  Created by 李胜营 on 16/5/15.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface shop : NSObject

/* image */
@property (strong, nonatomic) UIImage * image;
/* price */
@property (strong, nonatomic) NSString * price;
/* title */
@property (strong, nonatomic) NSString * title;
+ (instancetype)shopWithDic:(NSDictionary *)dic;
@end
