//
//  WPSFactory.m
//  MotherMoney
//
//  Created by WhisperRain on 16/7/7.
//  Copyright © 2016年 WhisperRain. All rights reserved.
//

#import "WPSFactory.h"

@implementation WPSFactory

//  颜色转换为背景图片
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
 
@end
