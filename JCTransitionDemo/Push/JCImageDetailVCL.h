//
//  JCImageDetailVCL.h
//  JCTransitionDemo
//
//  Created by zhengjiacheng on 2017/12/10.
//  Copyright © 2017年 zhengjiacheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCImageDetailVCL : UIViewController
@property (nonatomic, strong) UIImageView* imageView;
- (instancetype)initWithImage:(UIImage *)image;
@end
