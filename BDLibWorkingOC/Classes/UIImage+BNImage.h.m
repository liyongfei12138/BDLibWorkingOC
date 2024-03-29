//
//  UIImage+QCKJImage.m
//  QCKJLib
//
//  Created by Bingo on 2019/1/4.
//  Copyright © 2019年 Bingo. All rights reserved.
//

#import "UIImage+BNImage.h"

@implementation UIImage (BNImage)
+ (UIImage *)imageWithOriginalRender:(NSString *)imageName{
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
    
+ (UIImage *)imageWithColor:(UIColor *)color{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}
    

@end
