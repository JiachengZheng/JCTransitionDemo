//
//  JCImageCollectionCell.m
//  JCTransitionDemo
//
//  Created by zhengjiacheng on 2017/12/10.
//  Copyright © 2017年 zhengjiacheng. All rights reserved.
//

#import "JCImageCollectionCell.h"

@interface JCImageCollectionCell()

@end

@implementation JCImageCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self.contentView addSubview:imageView];
        imageView.image = [UIImage imageNamed:@"golden"];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        self.contentView.clipsToBounds = YES;
        self.goldenImage = imageView;
    }
    return self;
}


@end
