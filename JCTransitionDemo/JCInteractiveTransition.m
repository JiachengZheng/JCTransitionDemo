//
//  JCInteractiveTransition.m
//  JCTransitionDemo
//
//  Created by zhengjiacheng on 2017/12/10.
//  Copyright © 2017年 zhengjiacheng. All rights reserved.
//

#import "JCInteractiveTransition.h"

@interface JCInteractiveTransition()
@property (nonatomic, weak) UIViewController *vc;
@property (nonatomic, assign) JCInteractiveGestureDirection direction;
@property (nonatomic, assign) JCInteractiveTransitionType type;
@end

@implementation JCInteractiveTransition

- (instancetype)initWithTransitionType:(JCInteractiveTransitionType)type gestureDirection:(JCInteractiveGestureDirection)direction{
    self = [super init];
    if (self) {
        _direction = direction;
        _type = type;
    }
    return self;
}

- (void)addPanGestureForViewController:(UIViewController *)viewController{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    self.vc = viewController;
    [viewController.view addGestureRecognizer:pan];
}

- (void)handleGesture:(UIPanGestureRecognizer *)panGesture{
    CGFloat persent = 0;
    switch (_direction) {
        case JCInteractiveGestureDirectionLeft:{
            CGFloat transitionX = -[panGesture translationInView:panGesture.view].x;
            persent = transitionX / panGesture.view.frame.size.width;
        }
            break;
        case JCInteractiveGestureDirectionRight:{
            CGFloat transitionX = [panGesture translationInView:panGesture.view].x;
            persent = transitionX / panGesture.view.frame.size.width;
        }
            break;
        case JCInteractiveGestureDirectionUp:{
            CGFloat transitionY = -[panGesture translationInView:panGesture.view].y;
            persent = transitionY / panGesture.view.frame.size.width;
        }
            break;
        case JCInteractiveGestureDirectionDown:{
            CGFloat transitionY = [panGesture translationInView:panGesture.view].y;
            persent = transitionY / panGesture.view.frame.size.width;
        }
            break;
    }
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
            self.isGestureInteration = YES;
            if (persent >0) {
                [self startGesture];
            }
            
            break;
        case UIGestureRecognizerStateChanged:{
            //手势过程中，通过updateInteractiveTransition设置pop过程进行的百分比
            
            [self updateInteractiveTransition:persent];
            break;
        }
        case UIGestureRecognizerStateEnded:{
            //手势完成后结束标记并且判断移动距离是否过半，过则finishInteractiveTransition完成转场操作，否者取消转场操作
            self.isGestureInteration = NO;
            if (persent > 0.5) {
                [self finishInteractiveTransition];
            }else{
                [self cancelInteractiveTransition];
            }
            break;
        }
        default:
            break;
    }
}

- (void)startGesture{
    switch (_type) {
        case JCInteractiveTransitionTypePresent:{
            if (_presentBlock) {
                _presentBlock();
            }
        }
        break;
            
        case JCInteractiveTransitionTypeDismiss:
            [_vc dismissViewControllerAnimated:YES completion:nil];
            break;
        case JCInteractiveTransitionTypePush:{
            if (_pushBlock) {
                _pushBlock();
            }
        }
        break;
        case JCInteractiveTransitionTypePop:
            [_vc.navigationController popViewControllerAnimated:YES];
            break;
    }
}

@end
