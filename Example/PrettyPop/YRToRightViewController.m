//
//  YRToRightViewController.m
//  PrettyPop
//
//  Created by 　yangrui on 2017/8/17.
//  Copyright © 2017年 TangchangTomYang. All rights reserved.
//

#import "YRToRightViewController.h"
#import "POP.h"


@interface YRToRightViewController ()

@property(nonatomic, strong)UIView *redView;
@property(nonatomic, strong)UIView *blueView;
@property(nonatomic, strong)UIView *greenView;
@property(nonatomic, strong)UIView *orangeView;

@end

@implementation YRToRightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(10, 100, 100, 30)];
    redView.backgroundColor = [UIColor redColor];
    //    redView.layer.anchorPoint = CGPointMake(0, 0.5);
    [self.view addSubview:redView];
    self.redView = redView;
    
    
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(10, 150, 160, 30)];
    blueView.backgroundColor = [UIColor blueColor];
    //    blueView.layer.anchorPoint = CGPointMake(0, 0.5);
    [self.view addSubview:blueView];
    self.blueView = blueView;
    
    UIView *greenView = [[UIView alloc]initWithFrame:CGRectMake(10, 200, 60, 30)];
    greenView.backgroundColor = [UIColor greenColor];
    //    greenView.layer.anchorPoint = CGPointMake(0, 0.5);
    [self.view addSubview:greenView];
    self.greenView = greenView;
    
    UIView *orangeView = [[UIView alloc]initWithFrame:CGRectMake(10, 250, 100, 30)];
    orangeView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:orangeView];
    self.orangeView = orangeView;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self springAnimationForView:self.redView];
    
}



-(void)springAnimationForView:(UIView *)view  {
    
    NSLog(@"---> start");
    
    CGFloat offsetX = 150;
    
    POPSpringAnimation *springAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX
                                           ];
    
    CGRect frame = view.frame;
    frame.origin.x += offsetX + frame.size.width *0.5;
    springAnimation.toValue = @(frame.origin.x);
    
//    springAnimation.beginTime = CACurrentMediaTime() + 1.0f;
    springAnimation.springBounciness = 13.0f;
    [view pop_addAnimation:springAnimation  forKey:@"position"];
    
    
    springAnimation.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        NSLog(@"---> end");
    } ;
    
    
}



@end
