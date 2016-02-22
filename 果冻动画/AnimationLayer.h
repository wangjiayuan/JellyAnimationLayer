//
//  AnimationLayer.h
//  果冻动画
//
//  Created by apple on 16/2/17.
//  Copyright © 2016年 cheniue. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface AnimationLayer : CALayer

@property(nonatomic,assign)NSNumber *shakePercent;
-(void)startAnimation;
@end
