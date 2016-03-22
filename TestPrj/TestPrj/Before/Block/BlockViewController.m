//
//  BlockViewController.m
//  TestPrj
//
//  Created by hjs on 15/12/31.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "BlockViewController.h"

@interface BlockViewController ()

@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __block NSNumber *num = 0;
    BlockModel *blockModel = [BlockModel new];
    blockModel.testBlock = ^(id returnValue) {
        num = returnValue;
    };
    [blockModel run];
    NSLog(@"%d", [num intValue]);
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
