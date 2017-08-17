//
//  YRBouncyViewController.m
//  PrettyPop
//
//  Created by 　yangrui on 2017/8/17.
//  Copyright © 2017年 TangchangTomYang. All rights reserved.
//

#import "YRBouncyViewController.h"
#import "POP.h"

@interface YRBouncyViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UITextField *bounceField;
@property (weak, nonatomic) IBOutlet UITextField *speedField;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *x_c;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *y_c;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *width_c;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *height_c;
@end

@implementation YRBouncyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加手势
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureAction:)];
   
    
    [self.view addGestureRecognizer:tapGesture];
   
}



// 经过测试发现  使用POPSpringAnimation 的弹性动画后 视图的frame 会改变,但是约束不会变 ,也就是说 约束对动画效果不会产生影响
-(void)tapGestureAction:(UITapGestureRecognizer *)tapGesture{
    
    [self.view endEditing:YES];
    
    // 使用PopSpringAnimation  使 imgView 实现弹性放大缩小的效果
    POPSpringAnimation *springAnima = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    
    CGRect frame = self.imgView.frame;
    
    if (frame.size.width == 100) {
        springAnima.toValue = [NSValue valueWithCGSize:CGSizeMake(200, 200)];
    }
    else{
        springAnima.toValue =[NSValue valueWithCGSize:CGSizeMake(100, 100)];
    }
    
//    // 与“springSpeed”结合使用，以改变动画效果。值被转换为相应的动态常量。较高的值增加了弹簧运动的范围，导致了更多的振荡和弹性。定义为在0，20，范围内的值。默认为4
//    springAnima.springBounciness = 20.0; // 控制弹簧效果 越大越弹
//    // 使用“springbounc活泼”来改变动画效果。值被转换为相应的动态常量。较高的值增加了弹簧的阻尼力，导致了更快的初始速度和更快速的反弹减速。定义为在0，20，范围内的值。默认为12。
//    springAnima.springSpeed = 20.0;  // 控制阻尼,数字越大阻尼越大 (阻尼越大 阻尼加速度就越大)
    
    
    springAnima.springBounciness = [self.bounceField.text floatValue];
    springAnima.springSpeed = [self.speedField.text floatValue];
    
    __weak typeof(self) weakSelf = self;
    springAnima.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        
        
        if (finished == YES) {
            [weakSelf.imgView.layer pop_removeAnimationForKey:@"bouncy"];
            
        }
    };
    
    
    [self.imgView.layer pop_addAnimation:springAnima forKey:@"bouncy"];
}

- (IBAction)rightBtnClick:(id)sender {
    
     NSLog(@" ==>> frame: %@, center: %@",NSStringFromCGRect(self.imgView.frame),NSStringFromCGPoint(self.imgView.center));
    
     NSLog(@"constraint --- x: %f,  y: %f,w: %f,  h: %f",self.x_c.constant,self.y_c.constant, self.height_c.constant,self.width_c.constant);
}


@end

































