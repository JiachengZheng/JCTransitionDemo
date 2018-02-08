//
//  JCImageDetailVCL.m
//  JCTransitionDemo
//
//  Created by zhengjiacheng on 2017/12/10.
//  Copyright © 2017年 zhengjiacheng. All rights reserved.
//

#import "JCImageDetailVCL.h"
#import "JCPushTransition.h"
#import "JCInteractiveTransition.h"
@interface JCImageDetailVCL () <UINavigationControllerDelegate>
@property (nonatomic, strong) JCInteractiveTransition *popInteractiveTransition;
@end

@implementation JCImageDetailVCL

- (instancetype)initWithImage:(UIImage *)image{
    self = [super init];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _imageView = imageView;
        imageView.image = image;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Detail";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.imageView];
    
    self.imageView.frame = CGRectMake(0, 64, self.view.frame.size.width , 250*self.view.frame.size.width/((self.view.frame.size.width - 30)/2));
    JCInteractiveTransition *popInteractiveTransition = [[JCInteractiveTransition alloc] initWithTransitionType:JCInteractiveTransitionTypePop gestureDirection:JCInteractiveGestureDirectionDown];
    [popInteractiveTransition addPanGestureForViewController:self];
    self.popInteractiveTransition = popInteractiveTransition;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController NS_AVAILABLE_IOS(7_0){
    return self.popInteractiveTransition.isGestureInteration ? self.popInteractiveTransition : nil;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0){
    return [[JCPushTransition alloc]initWithType:operation == UINavigationControllerOperationPush ? JCPushTransitionTypePush : JCPushTransitionTypePop];
}


@end
