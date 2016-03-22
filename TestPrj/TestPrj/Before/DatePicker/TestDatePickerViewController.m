//
//  TestDatePickerViewController.m
//  TestPrj
//
//  Created by hjs on 15/12/3.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import "TestDatePickerViewController.h"

@interface TestDatePickerViewController ()

@end

@implementation TestDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shouDatePicker:(id)sender {
    MyDatePickerView *myDatePickerView = [[MyDatePickerView alloc]init];
    myDatePickerView.block = ^(MyDatePickerView *view, UIButton *btn, NSString *dateStr){
        _dateLabel.text = dateStr;
    };
    [myDatePickerView show];
}

@end
