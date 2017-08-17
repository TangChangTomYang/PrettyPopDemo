//
//  YRHitViewController.m
//  PrettyPop
//
//  Created by 　yangrui on 2017/8/17.
//  Copyright © 2017年 TangchangTomYang. All rights reserved.
//

#import "YRHitViewController.h"
#import "POP.h"

@interface YRHitViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation YRHitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    POPSpringAnimation *springAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    
    CGPoint center = self.imageView.center;
    
    if (center.y > 136) {
        springAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(center.x, 136)];
    }
    else{
        springAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(center.x, 200)];
    }
    
    // 弹性值
    springAnim.springBounciness = 20;
    springAnim.springSpeed = 1;
    __weak typeof( self) weakSelf = self;
    springAnim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished == YES) {
            [weakSelf.imageView.layer pop_removeAnimationForKey:@"hit"];
        }
    };
    
    
    [self.imageView.layer pop_addAnimation:springAnim forKey:@"hit"];
    
    
}


@end
