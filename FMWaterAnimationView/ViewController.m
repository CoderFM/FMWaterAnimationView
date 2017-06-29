//
//  ViewController.m
//  animation
//
//  Created by 周发明 on 17/5/23.
//  Copyright © 2017年 周发明. All rights reserved.
//

#import "ViewController.h"
#import "FMWaterAnimationView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet FMWaterAnimationView *waterView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.waterView.waveTime = 5;
    
    NSMutableArray *arrM = [NSMutableArray array];
    [arrM addObject:[FMWaterAnimationItem animationItemWithAngularSpeed:2 waveSpeed:3 waveLineColor:[UIColor blueColor] waveFillColor:[UIColor colorWithRed:0.1 green:0.5 blue:0.8 alpha:0.5] offsetX:20]];
    [arrM addObject:[FMWaterAnimationItem animationItemWithAngularSpeed:1 waveSpeed:5 waveLineColor:[UIColor redColor] waveFillColor:[UIColor colorWithRed:0.8 green:0.5 blue:0.4 alpha:0.5] offsetX:50]];
    [arrM addObject:[FMWaterAnimationItem animationItemWithAngularSpeed:3 waveSpeed:7 waveLineColor:[UIColor orangeColor] waveFillColor:[UIColor colorWithRed:0.3 green:0.9 blue:0.6 alpha:0.5] offsetX:100]];
    
    [self.waterView waveWithItems:arrM];
    
    [self.waterView beginAnimation];
}


@end
