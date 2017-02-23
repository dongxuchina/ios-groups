//
//  JYHomeViewController.m
//  ios-groups
//
//  Created by 董旭 on 17/2/14.
//  Copyright © 2017年 董旭. All rights reserved.
//

#import "JYHomeViewController.h"
#import "JYLiveViewController.h"
#import "JYUCenterViewController.h"
#import "JYNavigationController.h"

@implementation JYHomeViewController

- (void)loadView{
    [super loadView];
    
    //直播
    JYLiveViewController *live = [[JYLiveViewController alloc] init];
    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTitle:JYLocalizedString(@"home_tab_live_title") image:[[UIImage imageNamed:@"btn_home_box"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] tag:1];
    live.tabBarItem = firstItem;
    JYNavigationController *firstNav = [[JYNavigationController alloc] initWithRootViewController:live];
    
    //用户中心
    JYUCenterViewController *uCenter = [[JYUCenterViewController alloc] init];
    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTitle:JYLocalizedString(@"home_tab_ucenter_title") image:[[UIImage imageNamed:@"btn_home_ucenter"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] tag:2];
    uCenter.tabBarItem = secondItem;
    JYNavigationController *secondNav = [[JYNavigationController alloc] initWithRootViewController:uCenter];
    
    self.viewControllers = @[firstNav, secondNav];
    
    //设置选择tab的色值
    self.tabBar.tintColor = [UIColor jy_primaryColor];

    //设置tabbar的背景色值
//    self.tabBar.barTintColor = [UIColor whiteColor];
    
    [[UITabBarItem appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:[UIColor jy_primaryColor],
      NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];

    [self test16];
}

-(void)test16{
    
    
    
    
    
    [[[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"send A");
        [subscriber sendNext:@"1"];
        [subscriber sendNext:@"2"];
        [subscriber sendNext:@"3"];
        [subscriber sendNext:@"4"];
        [subscriber sendNext:@"5"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"signal1 dispose");
        }];;
    }] takeUntil:[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"send B");
//            [subscriber sendCompleted];
//        });
        NSLog(@"send B");
        [subscriber sendNext:@"B"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"signal2 dispose");
        }];;
    }]] subscribeNext:^(id x) {
        NSLog(@"S: %@", x);
    } completed:^{
        NSLog(@"S: Completed");
    }];
    
}

-(void)test15{
    
    NSObject *o = [[NSObject alloc] init];
    
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber)
                          {
                              NSLog(@"send A");
                              [subscriber sendNext:@"A"];
                              [subscriber sendNext:@"A"];
                              [subscriber sendNext:@"C"];
                              [subscriber sendCompleted];
                              return [RACDisposable disposableWithBlock:^{
                              }];
                          }];
    
    RACSignal *signalB = [signalA distinctUntilChanged];
    
    [signalB subscribeNext:^(id x) {
        NSLog(@"S: %@", x);
    }];
    
}

-(void)test14{
//    [[RACSignal interval:2 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(id x) {
//        NSLog(@"hahaha");
//    }];
    
//    [[RACSignal interval:2 onScheduler:[RACScheduler mainThreadScheduler] withLeeway:10] subscribeNext:^(id x) {
//        NSLog(@"hehehehe");
//    }];
    
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber)
                          {
                              NSLog(@"send A");
                              [subscriber sendNext:@"A"];
                              [subscriber sendNext:@"B"];
                              [subscriber sendNext:@"C"];
//                              [subscriber sendCompleted];
                              return [RACDisposable disposableWithBlock:^{
                              }];
                          }];
    
    [[signalA ignoreValues] subscribeNext:^(id x) {
        NSLog(@"S: %@", x);
    } completed:^{
        NSLog(@"Comletion");
    }];
    
//    [signalA ignoreValues];
    
//    [[signalA filter:^BOOL(id value) {
//        return [value hasPrefix:@"B"];
//    }] subscribeNext:^(id x) {
//        NSLog(@"hehehehe===%@", x);
//    }];
    
}



-(void)test13{

    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber)
                          {
                              NSLog(@"send A");
                              [subscriber sendNext:@"A"];
                              [subscriber sendNext:@"B"];
                              [subscriber sendNext:@"C"];
                              return [RACDisposable disposableWithBlock:^{
                              }];
                          }];
    
    
   RACSignal *signalB = [signalA delay:3];
    NSLog(@"hahahah");
    
    [signalB subscribeNext:^(id x) {
        NSLog(@"S: %@", x);
    }];

}

-(void)test12{
    RACSignal *signal = [RACSignal createSignal:
                         ^RACDisposable *(id<RACSubscriber> subscriber)
                         {
                             [subscriber sendNext:@"A"];
                             [subscriber sendNext:@"B"];
                             [subscriber sendNext:@"C"];
                             [subscriber sendCompleted];
                             return [RACDisposable disposableWithBlock:^{
                                 NSLog(@"signal1 dispose");
                             }];
                         }];
    
    
    RACSignal *signals = [RACSignal createSignal:
                          ^RACDisposable *(id<RACSubscriber> subscriber)
                          {
                              [subscriber sendNext:@"1"];
                              [subscriber sendNext:@"2"];
                              [subscriber sendNext:@"3"];
                              [subscriber sendNext:@"4"];
                              [subscriber sendCompleted];
                              return [RACDisposable disposableWithBlock:^{
                                  NSLog(@"signal2 dispose");
                              }];
                          }];
    
    RACSignal *concatSignal = [signal zipWith:signals];
    
    [concatSignal subscribeNext:^(id x) {
        NSLog(@"S: %@", x);
    }];
}

-(void)test11{
    RACSignal *signal = [RACSignal createSignal:
                         ^RACDisposable *(id<RACSubscriber> subscriber)
                         {
                             [subscriber sendNext:@"A"];
                             [subscriber sendCompleted];
                             return [RACDisposable disposableWithBlock:^{
                                 NSLog(@"signal dispose");
                             }];
                         }];
    
    
    RACSignal *signals = [RACSignal createSignal:
                          ^RACDisposable *(id<RACSubscriber> subscriber)
                          {
                              [subscriber sendNext:@"B"];
                              [subscriber sendNext:@"C"];
                              [subscriber sendNext:@"D"];
                              [subscriber sendCompleted];
                              return [RACDisposable disposableWithBlock:^{
                                  NSLog(@"signal dispose");
                              }];
                          }];
    
    RACSignal *concatSignal = [signal concat:signals];
    
    [concatSignal subscribeNext:^(id x) {
        NSLog(@"S: %@", x);
    }];
}

- (void) test10{
        RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            sleep(3);
            [subscriber sendNext:@"B"];
            [subscriber sendCompleted];
            return nil;
        }];
    
    
        RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@"A"];
            return nil;
        }];
    
    
//    RACSignal *combined = [RACSignal combineLatest:@[signalA, signalB]];
    
    RACSignal *combined = [RACSignal combineLatest:@[signalA, signalB] reduce:^(NSString *a, NSString *b){
        return [a stringByAppendingString:b];
    }];
    
        [combined subscribeNext:^(id x) {
            NSLog(@"S: %@",x);
        }];

}

- (void) test9{
    
    
    
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];
    RACSignal *signalOfSignals = [RACSignal createSignal:^ RACDisposable * (id<RACSubscriber> subscriber) {
        [subscriber sendNext:letters];
        [subscriber sendNext:numbers];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *flattened = [signalOfSignals flatten];
    
    // Outputs: A 1 B C 2
    [flattened subscribeNext:^(NSString *x) {
        NSLog(@"%@", x);
    }];
    
    [letters sendNext:@"A"];
    [numbers sendNext:@"1"];
    [letters sendNext:@"B"];
    [letters sendNext:@"C"];
    [numbers sendNext:@"2"];

}

- (void) test8{
    
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"A"];
        return nil;
    }];
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"B"];
        return nil;
    }];
    RACSignal *mergeSignal = [signalA merge:signalB];
    [mergeSignal subscribeNext:^(id x) {
        NSLog(@"S: %@",x);
    }];
}

-(void)test7{
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSLog(@"send A");
        [subscriber sendNext:@"A"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"Original Signal Dispose.");
        }];
    }];
    
    RACSignal *hotSignal = [signal replay];
//    RACSignal *hotSignal = [signal replayLast];
//    RACSignal *hotSignal = [signal replayLazily];
    
    [hotSignal subscribeNext:^(id x) {
        NSLog(@"S1: %@", x);
    }];
    [hotSignal subscribeNext:^(id x) {
        NSLog(@"S2: %@", x);
    }];
}

-(void)test6{
    
    RACSubject *sub = [RACSubject subject];
    RACSignal *reqlaylastSignal = [sub replayLazily];
    
    NSLog(@"send A");
    [sub sendNext:@"A"];
    [reqlaylastSignal subscribeNext:^(id x) {
        NSLog(@"S1: %@", x);
    }];
    
    NSLog(@"send B");
    [sub sendNext:@"B"];
    [reqlaylastSignal subscribeNext:^(id x) {
        NSLog(@"S2: %@", x);
    }];
    
    NSLog(@"send C");
    [sub sendNext:@"C"];
    [reqlaylastSignal subscribeNext:^(id x) {
        NSLog(@"S3: %@", x);
    }];
}

- (void)test5{
    RACSubject *subject = [RACSubject subject];
    
    [subject subscribeNext:^(id x) {
        NSLog(@"S1: %@",x);
    }];
    NSLog(@"send A");
    [subject sendNext:@"A"];
}

//热信号
- (void)test4{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"send A");
        [subscriber sendNext:@"A"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            JYLog(@"Original Signal Dispose.");
        }];
    }];
    RACSignal *hotSignal = [signal replay];
    
    NSLog(@"create Subscriber S1");
    [hotSignal subscribeNext:^(id x) {
        NSLog(@"S1: %@",x);
    }];
    NSLog(@"create Subscriber S2");
    [hotSignal subscribeNext:^(id x) {
        NSLog(@"S2: %@",x);
    }];
}

//冷信号
- (void)test1{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        NSLog(@"send A");
        [subscriber sendNext:@"A"];
        [subscriber sendCompleted];
        return [RACDisposable disposableWithBlock:^{
            JYLog(@"Original Signal Dispose.");
        }];
    }];
    NSLog(@"create Subscriber S1");
    [signal subscribeNext:^(id x) {
        NSLog(@"S1 recveive: %@", x);
    }];
    NSLog(@"create Subscriber S2");
    [signal subscribeNext:^(id x) {
        NSLog(@"S2 recveive: %@", x);
    }];
}


//热信号 1对多监听
-(void)test2{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"发送请求啦");
        [subscriber sendNext:@"ws"];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"释放了");
        }];
    }];
    
    
    
    
    RACSubject *sub = [RACSubject subject];
    
    RACSignal *reqlaylastSignal = [sub replay];
    
    NSLog(@"send zl");
    [sub sendNext:@"zl"];
    [reqlaylastSignal subscribeNext:^(id x) {
        NSLog(@"S1: %@", x);
    }];
    
    NSLog(@"send dx");
    [sub sendNext:@"dx"];
    [reqlaylastSignal subscribeNext:^(id x) {
        NSLog(@"S2: %@", x);
    }];
    
    NSLog(@"send ly");
    [sub sendNext:@"ly"];
    [reqlaylastSignal subscribeNext:^(id x) {
        NSLog(@"S3 %@", x);
    }];
    
    return;
    
    RACSignal *reqlaySignal = [signal replay];
    [reqlaySignal subscribeNext:^(id x) {
        NSLog(@"replay %@", x);
    }];
    
    [reqlaySignal subscribeNext:^(id x) {
        NSLog(@"replay %@", x);
    }];
    
    return;
    
    //2. 创建连接类
    RACMulticastConnection *connection = [signal publish];
    
    
    [connection.signal subscribeNext:^(id x) {
        NSLog(@"1%@", x);
    }];
    [connection.signal subscribeNext:^(id x) {
        NSLog(@"2%@", x);
    }];
    [connection.signal subscribeNext:^(id x) {
        NSLog(@"3%@", x);
    }];
    //3. 连接。只有连接了才会把信号源变为热信号
    [connection connect];
    
    
    
    RACSubject *letters = [RACSubject subject];
    // Outputs: A B
    [letters subscribeNext:^(id x) {
        NSLog(@"%@ ", x);
    }];
    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    
    
    RACSubject *replaySub = [RACReplaySubject subject];
    // Outputs: A B
    
    [replaySub sendNext:@"AA"];
    [replaySub sendNext:@"BB"];
    
    [replaySub subscribeNext:^(id x) {

        NSLog(@"%@ ", x);
    }];


    
    RACMulticastConnection *connection2 = [signal multicast:[RACReplaySubject subject]];
    
    [connection2 connect];
    
    [connection2.signal subscribeNext:^(id x) {
        NSLog(@"relaySubject %@", x);
    }];
    
    

}


//信号传递
- (void)test{
    
    
    // return + bind
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@"dongxu"];
//        [subscriber sendNext:@"2"];
        [subscriber sendCompleted];

        return [RACDisposable disposableWithBlock:^{
            JYLog(@"Original Signal Dispose.");
        }];
    }];
    
    
    RACSignal *bindSignal = [signal bind:^RACStreamBindBlock{
        return ^(NSString *value, BOOL *stop) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                JYLog(@"Original Signal value = %@",value);
                NSString *bindValue = [NSString stringWithFormat:@"%@ love %@",value, @"xuling"];
                JYLog(@"Binding Signal value = %@",bindValue);
                [subscriber sendNext:bindValue];
                [subscriber sendCompleted];
                return [RACDisposable disposableWithBlock:^{
                    JYLog(@"Binding Signal Dispose.");
                }];
            }];
//            return [RACSignal return:[NSString stringWithFormat:@"new %@",value]];
        };
    }];
    
    
    [signal subscribeNext:^(id x) {
        JYLog(@"%@",x);
    }];
    
    [bindSignal subscribeNext:^(id  _Nullable x) {
        JYLog(@"bindSignal: %@", x);
    }];
    
//    RACSignal *returnSignal = [RACSignal return:@"88"];
//    [returnSignal subscribeNext:^(id x) {
//        JYLog(@"returnSignal: %@", x);
//    }];
//    
//    
//    //error
//    
//    RACSignal *errorSignal = [RACSignal error:nil];
//    [errorSignal subscribeNext:^(id x) {
//        JYLog(@"errorSignal: %@", x);
//    } error:^(NSError *error) {
//        JYLog(@"errorSignal error");
//    }];
    
    
    
    
    
    
    
}


- (void)viewDidLoad{
    

}

@end
