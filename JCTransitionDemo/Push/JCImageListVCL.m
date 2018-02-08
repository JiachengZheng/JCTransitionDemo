//
//  JCImageListVCL.m
//  JCTransitionDemo
//
//  Created by zhengjiacheng on 2017/12/10.
//  Copyright © 2017年 zhengjiacheng. All rights reserved.
//

#import "JCImageListVCL.h"
#import "JCImageCollectionCell.h"
#import "JCImageDetailVCL.h"
@interface JCImageListVCL ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation JCImageListVCL

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"List";
    self.view.backgroundColor = [UIColor whiteColor];
    [self addCollectionView];
    [self.collectionView reloadData];
}

- (void)addCollectionView{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((self.view.frame.size.width - 30)/2, 250);
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    layout.minimumInteritemSpacing = 10;
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:collectionView];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:[JCImageCollectionCell class] forCellWithReuseIdentifier:@"normal"];
    self.collectionView = collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    JCImageCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"normal" forIndexPath:indexPath];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    self.currentIndexPath = indexPath;
    JCImageCollectionCell *cell = (JCImageCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    JCImageDetailVCL *detailVCL = [[JCImageDetailVCL alloc]initWithImage:cell.goldenImage.image];
    self.navigationController.delegate = detailVCL;
    [self.navigationController pushViewController:detailVCL animated:YES];
}

@end
