//
//  DFViewController.m
//  Parallax Effect
//
//  Created by Martin Bateson on 05/09/2014.
//  Copyright (c) 2014 DevFright.com. All rights reserved.
//

#import "DFViewController.h"

@interface DFViewController ()

@end

@implementation DFViewController

- (void)viewWillAppear:(BOOL)animated {
    [self backGroundMotion];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)backGroundMotion {
    CGFloat min = -20.0f;
    CGFloat max = 20.0f;
    
    // create the x axis motion
    UIInterpolatingMotionEffect *xAxis = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    
    xAxis.minimumRelativeValue = @(min);
    xAxis.maximumRelativeValue = @(max);
    
    // create the y axis motion
    UIInterpolatingMotionEffect *yAxis = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    
    yAxis.minimumRelativeValue = @(min);
    yAxis.maximumRelativeValue = @(max);
    
    // combine these is a group
    UIMotionEffectGroup *xyGroup = [[UIMotionEffectGroup alloc]init];
    xyGroup.motionEffects = @[xAxis, yAxis];
    
    //  apply what was created to the image
    [self.backGroundView addMotionEffect:xyGroup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
