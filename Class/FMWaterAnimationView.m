//
//  WaterAnimationView.m
//  animation
//
//  Created by 周发明 on 17/5/23.
//  Copyright © 2017年 周发明. All rights reserved.
//

#import "FMWaterAnimationView.h"

@interface FMWaterAnimationView ()

@property (strong, nonatomic) CADisplayLink *waveDisplayLink;

@property(nonatomic, copy)NSArray<FMWaterAnimationItem *> *items;

@property(nonatomic, assign)BOOL isAnimation;

@end

@implementation FMWaterAnimationView

- (void)dealloc {
    [self.waveDisplayLink invalidate];
    self.waveDisplayLink = nil;
}

- (void)waveWithItems:(NSArray<FMWaterAnimationItem *> *)items{
    
    if (self.isAnimation) {
        return;
    }
    if (!items || items.count == 0) {
        return;
    }
    
    [self.items enumerateObjectsUsingBlock:^(FMWaterAnimationItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj.waveShapeLayer removeFromSuperlayer];
    }];

    self.items = items;
    
    [items enumerateObjectsUsingBlock:^(FMWaterAnimationItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CAShapeLayer *waveShapeLayer = [CAShapeLayer layer];
        waveShapeLayer.strokeColor = obj.waveLineColor.CGColor;
        waveShapeLayer.fillColor = obj.waveFillColor.CGColor;
        [self.layer addSublayer:waveShapeLayer];
        obj.waveShapeLayer = waveShapeLayer;
    }];
}

- (void)beginAnimation{
    
    if (!self.items || self.items.count == 0) {
        return;
    }
    
    self.waveDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(currentWave)];
    [self.waveDisplayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    self.isAnimation = YES;
    if (self.waveTime > 0.f) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.waveTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self stopAnimation];
        });
    }
}


- (void)currentWave {
    for (int i = 0; i < self.items.count; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            FMWaterAnimationItem *item = self.items[i];
            item.offsetX -= (item.waveSpeed * self.superview.frame.size.width / 320);
            CGFloat width = CGRectGetWidth(self.frame);
            CGFloat height = CGRectGetHeight(self.frame);
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathMoveToPoint(path, NULL, 0, height / 2);
            CGFloat y = 0.f;
            for (CGFloat x = 0.f; x <= width ; x++) {
                y = height * sin(0.01 * (item.angularSpeed * x + item.offsetX));
                CGPathAddLineToPoint(path, NULL, x, y);
            }
            CGPathAddLineToPoint(path, NULL, width, height);
            CGPathAddLineToPoint(path, NULL, 0, height);
            CGPathCloseSubpath(path);
            dispatch_async(dispatch_get_main_queue(), ^{
                item.waveShapeLayer.path = path;
                CGPathRelease(path);
            });
        });
    }
}

- (void)stopAnimation{
    [UIView animateWithDuration:1.f animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        self.isAnimation = NO;
        [self.waveDisplayLink invalidate];
        self.waveDisplayLink = nil;
        self.alpha = 1.f;
        [self.items enumerateObjectsUsingBlock:^(FMWaterAnimationItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.waveShapeLayer.path = nil;
            [obj.waveShapeLayer removeFromSuperlayer];
        }];
    }];
}

@end
