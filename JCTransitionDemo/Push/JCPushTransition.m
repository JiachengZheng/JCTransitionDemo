//
//  JCPushTransition.m
//  JCTransitionDemo
//
//  Created by zhengjiacheng on 2017/12/10.
//  Copyright © 2017年 zhengjiacheng. All rights reserved.
//

#import "JCPushTransition.h"
#import "JCImageListVCL.h"
#import "JCImageDetailVCL.h"
#import "JCImageCollectionCell.h"
@interface JCPushTransition()
@property (nonatomic, assign) JCPushTransitionType type;
@end

@implementation JCPushTransition

- (instancetype)initWithType:(JCPushTransitionType)type{
    self = [super init];
    if (self) {
        _type = type;
    }
    return self;
}

- (void)pushAnimateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    JCImageListVCL *fromVCL = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    JCImageDetailVCL *toVCL = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    JCImageCollectionCell *cell = (JCImageCollectionCell *)[fromVCL.collectionView cellForItemAtIndexPath:fromVCL.currentIndexPath];
    UIView *tempView = [cell snapshotViewAfterScreenUpdates:NO];
    tempView.frame = [cell.goldenImage convertRect:cell.goldenImage.bounds toView: containerView];
    
    cell.goldenImage.hidden = YES;
    toVCL.view.alpha = 0;
    toVCL.imageView.hidden = YES;
    
    [containerView addSubview:toVCL.view];
    [containerView addSubview:tempView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        tempView.frame = [toVCL.imageView convertRect:toVCL.imageView.bounds toView:containerView];
        toVCL.view.alpha = 1;
    } completion:^(BOOL finished) {
        tempView.hidden = YES;
        toVCL.imageView.hidden = NO;
        [tempView removeFromSuperview];
        [transitionContext completeTransition:YES];
    }];
}

- (void)popAnimateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    JCImageDetailVCL *fromVCL = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    JCImageListVCL *toVCL = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    
    UIView *tempView = [fromVCL.imageView snapshotViewAfterScreenUpdates:NO];
    tempView.frame = [fromVCL.imageView convertRect:fromVCL.imageView.bounds toView:containerView];
    
    JCImageCollectionCell *cell = (JCImageCollectionCell *)[toVCL.collectionView cellForItemAtIndexPath:toVCL.currentIndexPath];
    cell.goldenImage.hidden = YES;
    
    [containerView addSubview:toVCL.view];
    [containerView addSubview:tempView];
  
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        tempView.frame = [cell.goldenImage convertRect:cell.goldenImage.frame toView:containerView];
        fromVCL.view.alpha = 0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        if ([transitionContext transitionWasCancelled]) {
            tempView.hidden = YES;
            fromVCL.imageView.hidden = NO;
        }else{
            cell.goldenImage.hidden = NO;
            [tempView removeFromSuperview];
        }
    }];
}

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.26;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    if (self.type == JCPushTransitionTypePush) {
        [self pushAnimateTransition:transitionContext];
    }else if (self.type == JCPushTransitionTypePop){
        [self popAnimateTransition:transitionContext];
    }
}


@end
