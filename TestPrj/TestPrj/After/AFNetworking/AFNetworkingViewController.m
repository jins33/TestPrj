//
//  AFNetworkingViewController.m
//  TestPrj
//
//  Created by hjs on 16/3/22.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "AFNetworkingViewController.h"
#import "PublicData.h"
#import "FileDownloads.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

#define CSV_URL_UPDATE @"http://www.aiu.co.jp/travel/spapp/update_info.csv"
#define CSV_URL_WHATNEW @"http://www.aiu.co.jp/travel/spapp/whatnew.csv"
#define CSV_URL_HOSPITALLIST @"http://www.aiu.co.jp/travel/spapp/hospitallist.csv"

@interface AFNetworkingViewController ()

@end

@implementation AFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __block int64_t preUnitCount = 0;
    __block int64_t increaseUnitCount = 0;
    
    [[FileDownloads manager] GET:CSV_URL_UPDATE parameters:nil progress:^(NSProgress * _Nullable downloadProgress) {
        //        NSLog(@"totalUnitCount %lld", downloadProgress.totalUnitCount);
        [RACObserve(downloadProgress, completedUnitCount) subscribeNext:^(id x) {
            int64_t currUnitCount = [x intValue];
            increaseUnitCount = currUnitCount - preUnitCount;
            preUnitCount = currUnitCount;
            if (increaseUnitCount != 0) {
                NSLog(@"x %@", x);
                NSLog(@"increaseUnitCount %lld", increaseUnitCount);
            }
        }];
    } success:^(NSString *filePath){
        NSLog(@"数据保存成功");
    } failure:^(NSString * _Nullable failInfo) {
        NSLog(@"%@", failInfo);
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
