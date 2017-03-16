//
//  JYDemoViewController.m
//  ios-groups
//
//  Created by 董旭 on 17/2/20.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import "JYDemoViewController.h"

@interface JYDemoViewController ()

@end

@implementation JYDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationTitle = @"hahaha";
    
    UIButton *btn = [UIButton jy_buttonBack];
    [btn addTarget:self action:@selector(onhaha) forControlEvents:UIControlEventTouchUpInside];
    
    self.rightBarButtons = @[btn];
    
}

- (void)onhaha{
    JYLog(@"hahahaha");
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
