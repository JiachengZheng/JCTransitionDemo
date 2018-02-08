//
//  JCPushTransition.h
//  JCTransitionDemo
//
//  Created by zhengjiacheng on 2017/12/10.
//  Copyright © 2017年 zhengjiacheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef enum : NSUInteger {
    JCPushTransitionTypePush,
    JCPushTransitionTypePop,
} JCPushTransitionType;
@interface JCPushTransition : NSObject<UIViewControllerAnimatedTransitioning>

- (instancetype)initWithType:(JCPushTransitionType)type;

@end
