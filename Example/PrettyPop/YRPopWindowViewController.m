//
//  YRPopWindowViewController.m
//  PrettyPop
//
//  Created by 　yangrui on 2017/8/17.
//  Copyright © 2017年 TangchangTomYang. All rights reserved.
//

#import "YRPopWindowViewController.h"
#import "POP.h"


#define offsetX  5

#define Width  122
#define Height  133

@interface YRPopWindowViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *popMenu;

@property(nonatomic, assign)BOOL isShowing;

@end

@implementation YRPopWindowViewController
- (IBAction)popBtnClick:(id)sender {
    
    self.isShowing = !self.isShowing;
    if (self.isShowing == YES) {
        
        [self showPop];
    }else{
    
        [self hidePop];
    }
    
}

-(void)hidePop{
    [self showPopFromFrame:[self showPosition] toFrame:[self hidePosition]];

}

-(void)showPop{
    [self showPopFromFrame:[self hidePosition] toFrame: [self showPosition] ];

}



-(void)showPopFromFrame:(CGRect)fromFrame toFrame:(CGRect)toFrame{

    POPSpringAnimation *springAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewFrame];
   
    springAnim.fromValue = [NSValue valueWithCGRect:fromFrame];
    springAnim.toValue = [NSValue valueWithCGRect:toFrame];
    
    springAnim.springBounciness = 10;
    springAnim.springSpeed = 10;
    __weak typeof( self) weakSelf = self;
    springAnim.completionBlock = ^(POPAnimation *anim, BOOL finished) {
        if (finished == YES) {
            [weakSelf.popMenu.layer pop_removeAnimationForKey:@"popWindow"];
        }
    };
    [self.popMenu.layer pop_addAnimation:springAnim forKey:@"popWindow"];
    
    
}


-(CGRect)showPosition{

  return   CGRectMake(self.view.frame.size.width - Width- offsetX, 69, Width, Height);
}


-(CGRect)hidePosition{

    return   CGRectMake(self.view.frame.size.width + offsetX, 69, 0, 0);
}
@end
