//
//  JustTestViewController.m
//  TestPrj
//
//  Created by F－03 on 16/4/1.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "JustTestViewController.h"
#import "NSString+Custom.h"

@interface JustTestViewController ()

@end

@implementation JustTestViewController

- (void)viewDidLoad {
    NSString *str = @"123456";
    [str addProperty];
    NSString *testStr = objc_getAssociatedObject(str, @"test");
    NSLog(@"testStr %@", testStr);
}

@end
