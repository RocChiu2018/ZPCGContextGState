//
//  ZPView.m
//  图形上下文栈
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPView.h"

@implementation ZPView

- (void)drawRect:(CGRect)rect
{
    //获得图形上下文：
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /**
     下面代码的意思是将最开始的图形上下文复制一份，然后放到图形上下文栈中，所以说栈中的图形上下文是最初的、全新的那个；
     下面设置线段的各种属性都会存在图形上下文栈外面的那个图形上下文中；
     画线的时候先会画在图形上下文中，然后再渲染到对应的View上面。
     */
    CGContextSaveGState(context);
    
    //设置线的宽度：
    CGContextSetLineWidth(context, 10);
    
    //设置线的颜色：
    [[UIColor redColor] set];
    
    //设置线的两端的样式：
    CGContextSetLineCap(context, kCGLineCapRound);
    
    //画线：
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddLineToPoint(context, 120, 190);
    
    //渲染图形上下文：
    CGContextStrokePath(context);
    
    /**
     将图形上下文栈中栈顶的那个图形上下文出栈，替换当前的图形上下文，所以当前的图形上下文是最初的，最干净的那个。
     */
    CGContextRestoreGState(context);
    
    //再画线：
    CGContextMoveToPoint(context, 160, 50);
    CGContextAddLineToPoint(context, 220, 290);
    
    //再渲染图形上下文：
    CGContextStrokePath(context);
    
    //同上一句代码的效果相同
//    CGContextDrawPath(context, kCGPathStroke);
}

@end
