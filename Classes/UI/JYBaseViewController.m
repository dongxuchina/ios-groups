//
//  JYBaseViewController.m
//  ios-groups
//
//  Created by 董旭 on 17/2/16.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import "JYBaseViewController.h"

@interface JYBaseViewController ()

@end

@implementation JYBaseViewController

- (void)setNavigationTitle:(NSString *)navigationTitle{
    _navigationTitle = navigationTitle;
    
    self.navigationItem.title = _navigationTitle;
}

- (void)setRightBarButtons:(NSArray *)rightBarButtons{
    _rightBarButtons = rightBarButtons;
    
    NSMutableArray *rightBarButtonItems = [NSMutableArray array];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -10;
    
    for (int i=0,sizeI=(int)rightBarButtons.count; i<sizeI; i++) {
        if (i == 2) {
            break;
        }
        UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:[rightBarButtons jy_objectAtIndex:i]];
        [rightBarButtonItems jy_addObject:negativeSpacer];
        [rightBarButtonItems jy_addObject:item];
    }
    
    self.navigationItem.rightBarButtonItems = rightBarButtonItems;
}



- (void)loadView{
    [super loadView];
    
    //设置状态栏的字为高亮色
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    //设置所有页面的内容背景色
    self.view.backgroundColor = [UIColor jy_bgContentColor];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}




- (void)dealloc{
    
    JYLog(@"%@ is deallocated。",[self class]);
}



@end
