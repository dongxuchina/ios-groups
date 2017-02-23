//
//  JYLiveViewController.m
//  ios-groups
//
//  Created by 董旭 on 17/2/17.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import "JYLiveViewController.h"
#import "JYDemoViewController.h"

@interface JYLiveViewController ()

@end

@implementation JYLiveViewController

- (void)loadView{
    [super loadView];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [nextBtn setTitle:@"next" forState:UIControlStateNormal];
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextBtn.frame = CGRectMake(0, 0, 60, 40);
    [nextBtn addTarget:self action:@selector(nextAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithCustomView:nextBtn];
    self.navigationItem.rightBarButtonItem = next;
    
    
    //
    //    //自定义标题的视图
    //    //    UILabel *back = [[UILabel alloc] init];
    //    //    back.frame = CGRectMake(0, 0, 100, 44);
    //    //    back.backgroundColor = [UIColor blueColor];
    //    //    back.text = @"bbbb";
    //    //    self.navigationItem.titleView=back;
    //
    //
    //    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    btn.frame = CGRectMake(0, 0, 40, 40);
    //    [btn setTitle:@"主页" forState:UIControlStateNormal];
    //    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //
    //    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //    self.navigationItem.leftBarButtonItem = item;
    
    self.navigationItem.title = JYLocalizedString(@"module_live_title");
    
}


- (void)nextAction:(id)sender{
    JYDemoViewController *vc = [[JYDemoViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
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
