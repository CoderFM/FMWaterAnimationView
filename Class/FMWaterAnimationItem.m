//
//  WaterAnimationItem.m
//  animation
//
//  Created by 周发明 on 17/5/23.
//  Copyright © 2017年 周发明. All rights reserved.
//

#import "FMWaterAnimationItem.h"

@implementation FMWaterAnimationItem

+ (instancetype)animationItemWithAngularSpeed:(CGFloat)angularSpeed waveSpeed:(CGFloat)waveSpeed waveLineColor:(UIColor *)waveLineColor waveFillColor:(UIColor *)waveFillColor offsetX:(CGFloat)offsetX{
    FMWaterAnimationItem *item = [[FMWaterAnimationItem alloc] init];
    item.angularSpeed = angularSpeed;
    item.waveSpeed = waveSpeed;
    item.waveLineColor = waveLineColor;
    item.waveFillColor = waveFillColor;
    item.offsetX = offsetX;
    return item;
}

@end
