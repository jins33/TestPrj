//
//  MJExtensionTestCtl.m
//  TestPrj
//
//  Created by F－03 on 16/4/26.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "MJExtensionTestCtl.h"
#import "PopCellObj.h"
#import <MJExtension.h>

@interface MJExtensionTestCtl ()

@end

@implementation MJExtensionTestCtl

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"ZTKJ" ofType:@"plist"];
    NSDictionary *pListData = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSDictionary *dict = [pListData objectForKey:@"Tel"];
    NSArray *dataArray = [PopCellObj mj_objectArrayWithKeyValuesArray:dict];
    for (PopCellObj *obj in dataArray) {
        NSLog(@"%@", obj.itemOne);
    }
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
