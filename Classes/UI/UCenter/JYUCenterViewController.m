//
//  JYUCenterViewController.m
//  ios-groups
//
//  Created by 董旭 on 17/2/17.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import "JYUCenterViewController.h"
#import "JYDemoViewController.h"

@interface JYUCenterViewController ()

@end

@implementation JYUCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextBtn setTitle:@"next" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextBtn.frame = CGRectMake(0, 0, 40, 40);
    [nextBtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithCustomView:nextBtn];
    self.navigationItem.rightBarButtonItem = next;
    
    self.navigationItem.title = JYLocalizedString(@"module_ucenter_title");
}

- (void)nextAction:(id)sender{
    JYDemoViewController *vc = [[JYDemoViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
