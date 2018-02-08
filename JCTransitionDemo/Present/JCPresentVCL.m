//
//  JCPresentVCL.m
//  JCTransitionDemo
//
//  Created by zhengjiacheng on 2017/12/10.
//  Copyright © 2017年 zhengjiacheng. All rights reserved.
//

#import "JCPresentVCL.h"
#import "JCPresentedVCL.h"
#import "JCInteractiveTransition.h"
@interface JCPresentVCL ()
@property (nonatomic, strong) JCInteractiveTransition *interactiveTransition;
@end

@implementation JCPresentVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Present";
    self.view.backgroundColor = [UIColor whiteColor];
    [self addButton];
    
    JCInteractiveTransition *interactiveTransition = [[JCInteractiveTransition alloc] initWithTransitionType:JCInteractiveTransitionTypePresent gestureDirection:JCInteractiveGestureDirectionUp];
    typeof(self)weakSelf = self;
    interactiveTransition.presentBlock = ^(){
        [weakSelf present];
    };
    [interactiveTransition addPanGestureForViewController:self.navigationController];
    self.interactiveTransition = interactiveTransition;
}

- (void)addButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn setTitle:@"present" forState:UIControlStateNormal];
    btn.frame = CGRectMake(self.view.frame.size.width/2 - 50, 200, 100, 100);
    [btn addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
}

- (void)present{
    JCPresentedVCL *vcl = [JCPresentedVCL new];
    vcl.interactiveTransition = self.interactiveTransition;
    [self presentViewController:vcl animated:YES completion:^{
        
    }];
}

@end
