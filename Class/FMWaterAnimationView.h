//
//  WaterAnimationView.h
//  animation
//
//  Created by 周发明 on 17/5/23.
//  Copyright © 2017年 周发明. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMWaterAnimationItem.h"

@interface FMWaterAnimationView : UIView

@property (assign, nonatomic) NSTimeInterval waveTime;

- (void)stopAnimation;

- (void)waveWithItems:(NSArray <FMWaterAnimationItem *>*)items;

- (void)beginAnimation;

@end


