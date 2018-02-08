//
//  JCInteractiveTransition.h
//  JCTransitionDemo
//
//  Created by zhengjiacheng on 2017/12/10.
//  Copyright © 2017年 zhengjiacheng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^JCPresentBlock)(void);
typedef void(^JCPushBlock)(void);

typedef NS_ENUM(NSUInteger,JCInteractiveGestureDirection) {
    JCInteractiveGestureDirectionLeft ,
    JCInteractiveGestureDirectionRight,
    JCInteractiveGestureDirectionUp,
    JCInteractiveGestureDirectionDown
};

typedef NS_ENUM(NSUInteger, JCInteractiveTransitionType) {
    JCInteractiveTransitionTypePresent ,
    JCInteractiveTransitionTypeDismiss,
    JCInteractiveTransitionTypePush,
    JCInteractiveTransitionTypePop,
};

@interface JCInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign) BOOL isGestureInteration;
@property (nonatomic, copy) JCPresentBlock presentBlock;
@property (nonatomic, copy) JCPushBlock pushBlock;

- (instancetype)initWithTransitionType:(JCInteractiveTransitionType)type gestureDirection:(JCInteractiveGestureDirection)direction;
- (void)addPanGestureForViewController:(UIViewController *)viewController;

@end
