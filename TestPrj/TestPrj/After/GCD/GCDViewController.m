//
//  GCDViewController.m
//  TestPrj
//
//  Created by F－03 on 16/5/6.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController{
    NSRecursiveLock *theLock;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    theLock = [[NSRecursiveLock alloc] init];
    self.votesNum = 200;
    dispatch_queue_t queue1 = dispatch_queue_create("myQueue1", NULL);
    dispatch_queue_t queue2 = dispatch_queue_create("myQueue2", NULL);
    dispatch_queue_t queue3 = dispatch_queue_create("myQueue3", NULL);
    dispatch_queue_t queue4 = dispatch_queue_create("myQueue4", NULL);
    dispatch_queue_t queue5 = dispatch_queue_create("myQueue5", NULL);
    dispatch_queue_t queue6 = dispatch_queue_create("myQueue6", NULL);
    dispatch_queue_t queue7 = dispatch_queue_create("myQueue7", NULL);
    dispatch_queue_t queue8 = dispatch_queue_create("myQueue8", NULL);
    dispatch_queue_t queue9 = dispatch_queue_create("myQueue9", NULL);
    dispatch_queue_t queue10 = dispatch_queue_create("myQueue10", NULL);
    dispatch_queue_t queue11 = dispatch_queue_create("myQueue11", NULL);
    
    dispatch_async(queue1, ^{
        for (int i=0; i<100; i++) {
            [self votesMinusWithQueueName:@"1"];
        }
    });
    dispatch_async(queue2, ^{
        for (int i=0; i<100; i++) {
            [self votesMinusWithQueueName:@"2"];
        }
    });
    dispatch_async(queue3, ^{
        for (int i=0; i<100; i++) {
            [self votesMinusWithQueueName:@"3"];
        }
    });
    dispatch_async(queue4, ^{
        for (int i=0; i<100; i++) {
            [self votesMinusWithQueueName:@"4"];
        }
    });
    dispatch_async(queue5, ^{
        for (int i=0; i<100; i++) {
            [self votesMinusWithQueueName:@"5"];
        }
    });
    dispatch_async(queue6, ^{
        for (int i=0; i<100; i++) {
            [self votesMinusWithQueueName:@"6"];
        }
    });
    dispatch_async(queue7, ^{
        for (int i=0; i<100; i++) {
            [self votesMinusWithQueueName:@"7"];
        }
    });
    dispatch_async(queue8, ^{
        for (int i=0; i<100; i++) {
            [self votesMinusWithQueueName:@"8"];
        }
    });
    dispatch_async(queue9, ^{
        for (int i=0; i<100; i++) {
            [self votesMinusWithQueueName:@"9"];
        }
    });
    dispatch_async(queue10, ^{
        for (int i=0; i<100; i++) {
            [self votesMinusWithQueueName:@"10"];
        }
    });
    dispatch_async(queue11, ^{
        for (int i=0; i<100; i++) {
            [self votesMinusWithQueueName:@"11"];
        }
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)votesMinusWithQueueName:(NSString *)name{
    [theLock lock];
    [theLock lock];
    if (self.votesNum > 0) {
        self.votesNum--;
        NSLog(@"name:%@ votesNum:%d", name, self.votesNum);
    }
    [theLock unlock];
    [theLock unlock];
}

@end
