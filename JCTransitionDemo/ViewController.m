//
//  ViewController.m
//  JCTransitionDemo
//
//  Created by zhengjiacheng on 2017/12/10.
//  Copyright © 2017年 zhengjiacheng. All rights reserved.
//

#import "ViewController.h"
#import "JCPresentVCL.h"
#import "JCImageListVCL.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.tableView reloadData];
}

- (NSArray *)dataArr{
    return @[@"底部弹出present",@"放大效果"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"normal" forIndexPath:indexPath];
    cell.textLabel.text = self.dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *vcl = nil;
    if (indexPath.row == 0) {
        vcl = [JCPresentVCL new];
    }else if (indexPath.row == 1){
        vcl = [JCImageListVCL new];
    }
    [self.navigationController pushViewController:vcl animated:YES];
}


@end
