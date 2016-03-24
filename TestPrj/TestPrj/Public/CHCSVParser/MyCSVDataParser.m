//
//  MyCSVDataParser.m
//  TestPrj
//
//  Created by F－03 on 16/3/24.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "MyCSVDataParser.h"
#import "NSString+Custom.h"

@implementation MyCSVDataParser

+ (instancetype)manager{
    static id shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

//将csv格式的二维数组转化为字典型数组
- (NSArray *)CSVArrToDicArr:(NSArray *)array{
    NSMutableArray *resArray = [NSMutableArray array];
    NSDictionary *noForkeyDic, *keyForValueDic;
    //遍历二维数组
    for (int i = 0; i < array.count; i++) {
        //用于存储属性和属性值键值对的字典
        //该行为第一行或者键值对的数量不等于列数时进行列数和属性键值对的初始化操作
        if (i == 0 || [noForkeyDic allKeys].count != [array[i-1] count]) {
            noForkeyDic = [self noForKeyDicWithArray:array[i]];
        }else{
            keyForValueDic = [self keyForValueDicWithArray:array[i] noForKeyDic:noForkeyDic];
            [resArray addObject:keyForValueDic];
        }
    }
    return resArray;
}

//返回用与存储列数和属性键值对的字典
- (NSDictionary *)noForKeyDicWithArray:(NSArray *)array{
    NSMutableDictionary *noForKeyDic = [NSMutableDictionary new];
    for (int i = 0; i < array.count; i++) {
        if (![array[i] isEmpty]) {
            [noForKeyDic setObject:array[i] forKey:@(i)];
        }
    }
    return noForKeyDic;
}

//返回用于存储属性和属性值键值对的字典
- (NSDictionary *)keyForValueDicWithArray:(NSArray *)array noForKeyDic:(NSDictionary *)noForKeyDic{
    NSMutableDictionary *keyForValueDic = [NSMutableDictionary new];
    NSString *key;
    for (int i = 0 ; i < array.count; i++) {
        key = [noForKeyDic objectForKey:@(i)];
        [keyForValueDic setObject:array[i] forKey:key];
    }
    return keyForValueDic;
}

@end
