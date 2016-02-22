//
//  AnimationLayer.m
//  果冻动画
//
//  Created by apple on 16/2/17.
//  Copyright © 2016年 cheniue. All rights reserved.
//

#import "AnimationLayer.h"

@implementation AnimationLayer
//通过这个方法可以让layer支持更多的动画属性
+(BOOL)needsDisplayForKey:(NSString *)key
{
    if ([key isEqualToString:@"shakePercent"])
    {
        return YES;
    }
    return [super needsDisplayForKey:key];
}
//每次动画都会执行这个绘制函数
-(void)drawInContext:(CGContextRef)ctx
{
    // Drawing code
    CGContextRef context = ctx;
    CGFloat backgroundRadius = MIN(self.bounds.size.width, self.bounds.size.height)/2.0f;
    CGContextClearRect(context, self.bounds);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextAddArc(context, self.bounds.size.width/2.0f, self.bounds.size.height/2.0f, backgroundRadius, 0.0f, M_PI, NO);
    CGContextFillPath(context);
    CGFloat dx = backgroundRadius/(1.8f);
    CGFloat sx = backgroundRadius*[self.shakePercent floatValue];
    CGContextSetStrokeColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextSetLineWidth(context, 2.0f);
    
    
    CGContextMoveToPoint(context, self.bounds.size.width/2.0f-backgroundRadius, self.bounds.size.height/2.0f);
    CGContextAddCurveToPoint(context, self.bounds.size.width/2.0f-backgroundRadius, self.bounds.size.height/2.0f-dx, self.bounds.size.width/2.0f-dx+sx, self.bounds.size.height/2.0f-backgroundRadius, self.bounds.size.width/2.0f, self.bounds.size.height/2.0f-backgroundRadius);
    CGContextFillPath(context);
    
    CGContextMoveToPoint(context, self.bounds.size.width/2.0f, self.bounds.size.height/2.0f-backgroundRadius);
    CGContextAddCurveToPoint(context,  self.bounds.size.width/2.0f+dx+sx, self.bounds.size.height/2.0f-backgroundRadius,self.bounds.size.width/2.0f+backgroundRadius, self.bounds.size.height/2.0f-dx, self.bounds.size.width/2.0f+backgroundRadius, self.bounds.size.height/2.0f);
    CGContextFillPath(context);
    
    CGContextMoveToPoint(context, self.bounds.size.width/2.0f-backgroundRadius, self.bounds.size.height/2.0f);
    CGContextAddLineToPoint(context,self.bounds.size.width/2.0f, self.bounds.size.height/2.0f-backgroundRadius);
    CGContextAddLineToPoint(context,self.bounds.size.width/2.0f+backgroundRadius, self.bounds.size.height/2.0f);
    CGContextClosePath(context);
    CGContextFillPath(context);
}
-(void)startAnimation
{
    [self removeAnimationForKey:@"shakePercent"];
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"shakePercent"];
    NSMutableArray *valuesArray = [NSMutableArray arrayWithObject:@0.3f];
    CGFloat fp = 0.3f;
    while(ABS(fp)>=0.08f)
    {
        fp = -fp*0.9f;
        [valuesArray addObject:@(fp)];
    }
    [valuesArray addObject:@0.0f];
    animation.values = valuesArray;
    animation.duration = 3.0f;
    animation.removedOnCompletion = YES;
    animation.autoreverses = NO;
    animation.repeatCount = HUGE_VALF;
    [self addAnimation:animation forKey:@"shakePercent"];
}
@end
