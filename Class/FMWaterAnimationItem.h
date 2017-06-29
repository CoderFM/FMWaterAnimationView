//
//  WaterAnimationItem.h
//  animation
//
//  Created by 周发明 on 17/5/23.
//  Copyright © 2017年 周发明. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FMWaterAnimationItem : NSObject
/**
 控制角度大小 --> 蜂的多少
 */
@property (assign, nonatomic) CGFloat angularSpeed;
/**
 每一帧 移动速度
 */
@property (assign, nonatomic) CGFloat waveSpeed;
/**
 路劲线的颜色
 */
@property (strong, nonatomic) UIColor *waveLineColor;

/**
 路劲填充颜色
 */
@property (strong, nonatomic) UIColor *waveFillColor;

/**
 动画的视图层
 */
@property (weak, nonatomic) CAShapeLayer *waveShapeLayer;

/**
 初始偏移量
 */
@property(nonatomic, assign)CGFloat offsetX;

+ (instancetype)animationItemWithAngularSpeed:(CGFloat)angularSpeed waveSpeed:(CGFloat)waveSpeed waveLineColor:(UIColor *)waveLineColor waveFillColor:(UIColor *)waveFillColor offsetX:(CGFloat)offsetX;

@end
