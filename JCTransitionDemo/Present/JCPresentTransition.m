//
//  JCPresentTransition.m
//  JCTransitionDemo
//
//  Created by zhengjiacheng on 2017/12/10.
//  Copyright © 2017年 zhengjiacheng. All rights reserved.
//

#import "JCPresentTransition.h"

@interface JCPresentTransition()
@property (nonatomic, assign) JCPresentTransitionType type;
@end

@implementation JCPresentTransition

- (instancetype)initWithType:(JCPresentTransitionType)type{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (void)presentAnimateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVCL = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVCL = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    UIView *tempView = [fromVCL.view snapshotViewAfterScreenUpdates:NO];
    tempView.frame = fromVCL.view.bounds;
    fromVCL.view.hidden = YES;
    
    [containerView addSubview:tempView];
    [containerView addSubview:toVCL.view];
    
    toVCL.view.frame = CGRectMake(0, containerView.frame.size.height, containerView.frame.size.width, 400);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:0 animations:^{
        toVCL.view.transform = CGAffineTransformMakeTranslation(0, -400);
        tempView.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {
            fromVCL.view.hidden = NO;
            [tempView removeFromSuperview];
        }
    }];
    
}

- (void)dismissAnimateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    UIViewController *fromVCL = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVCL = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    NSArray *subviewsArray = containerView.subviews;
    UIView *tempView = subviewsArray[MIN(subviewsArray.count, MAX(0, subviewsArray.count - 2))];

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromVCL.view.transform = CGAffineTransformIdentity;
        tempView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        if ([transitionContext transitionWasCancelled]) {
            [transitionContext completeTransition:NO];
        }else{
            [transitionContext completeTransition:YES];
            toVCL.view.hidden = NO;
            [tempView removeFromSuperview];
        }
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    if (self.type == JCPresentTransitionTypePresent) {
        [self presentAnimateTransition:transitionContext];
    }else if (self.type == JCPresentTransitionTypeDismiss){
        [self dismissAnimateTransition:transitionContext];
    }
}
@end
