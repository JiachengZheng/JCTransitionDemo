//
//  JCPresentTransition.h
//  JCTransitionDemo
//
//  Created by zhengjiacheng on 2017/12/10.
//  Copyright © 2017年 zhengjiacheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    JCPresentTransitionTypePresent,
    JCPresentTransitionTypeDismiss,
} JCPresentTransitionType;

@interface JCPresentTransition : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithType:(JCPresentTransitionType)type;
@end
