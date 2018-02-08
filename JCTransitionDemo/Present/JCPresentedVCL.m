//
//  JCPresentedVCL.m
//  JCTransitionDemo
//
//  Created by zhengjiacheng on 2017/12/10.
//  Copyright © 2017年 zhengjiacheng. All rights reserved.
//

#import "JCPresentedVCL.h"
#import "JCPresentTransition.h"

@interface JCPresentedVCL ()<UIViewControllerTransitioningDelegate>
@property (nonatomic, strong) JCInteractiveTransition *dismissTransition;
@end

@implementation JCPresentedVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view.layer setCornerRadius:8];
    self.transitioningDelegate = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self addButton];
    JCInteractiveTransition *dismissTransition = [[JCInteractiveTransition alloc] initWithTransitionType:JCInteractiveTransitionTypeDismiss gestureDirection:JCInteractiveGestureDirectionDown];
    [dismissTransition addPanGestureForViewController:self];
    self.dismissTransition = dismissTransition;
}

- (void)addButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn setTitle:@"dismiss" forState:UIControlStateNormal];
    btn.frame = CGRectMake(self.view.frame.size.width/2 - 50, 100, 100, 100);
    [btn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
}

- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [[JCPresentTransition alloc]initWithType:JCPresentTransitionTypePresent];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [[JCPresentTransition alloc]initWithType:JCPresentTransitionTypeDismiss];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator{
    return self.dismissTransition.isGestureInteration ? self.dismissTransition : nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    return self.interactiveTransition.isGestureInteration ? self.interactiveTransition : nil;
}

@end
