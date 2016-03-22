//
//  AFNetworkingViewController.m
//  TestPrj
//
//  Created by hjs on 16/3/22.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "AFNetworkingViewController.h"
#import "PublicData.h"
#define CSV_URL_UPDATE @"http://www.aiu.co.jp/travel/spapp/update_info.csv"

@interface AFNetworkingViewController ()

@end

@implementation AFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //afnetworking
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    // 不加上这句话，会报“Request failed: unacceptable content-type: text/plain”错误
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    [manager GET:CSV_URL_UPDATE parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"progress");
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject){
        NSString *path = [[PublicData manage] documentsPath];
        NSLog(@"path %@", path);
        path = [path stringByAppendingString:@"/update_info.csv"];
        [[PublicData manage] writeData:responseObject withFilePath:path];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure");
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
