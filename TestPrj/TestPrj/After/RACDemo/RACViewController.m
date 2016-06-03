//
//  RACViewController.m
//  TestPrj
//
//  Created by F－03 on 16/5/6.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "RACViewController.h"

@interface RACViewController ()

@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RAC(self, textStr) = self.myTextField.rac_textSignal;
    RAC(self.myTextField, text) = RACObserve(self, textStr);
    @weakify(self);
    [[self.textChangeBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        self.textStr = @"12345678";
    }];
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
