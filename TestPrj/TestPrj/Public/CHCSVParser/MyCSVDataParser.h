//
//  MyCSVDataParser.h
//  TestPrj
//
//  Created by F－03 on 16/3/24.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCSVDataParser : NSObject

//将csv格式的二维数组转化为字典型数组
- (NSArray *)CSVArrToDicArr:(NSArray *)array;

+ (instancetype)manager;

@end
