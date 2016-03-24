//
//  CoreDataSave.m
//  TestPrj
//
//  Created by F－03 on 16/3/24.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "CoreDataSave.h"
#import "NSString+Custom.h"
#import "CoreDataManager.h"
@import CoreData;

@implementation CoreDataSave{
    CoreDataManager *coreDataManager;
}

+ (instancetype)manager{
    static id shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

//将csv格式的二维数组转化为对象并存储到CoreData
- (void)SaveCSVData:(NSArray *)array entityName:(NSString*)entityName{
    coreDataManager = [CoreDataManager manager];
    NSDictionary *noForkeyDic;
    //遍历二维数组
    for (int i = 0; i < array.count; i++) {
        //用于存储属性和属性值键值对的字典
        //该行为第一行或者键值对的数量不等于列数时进行列数和属性键值对的初始化操作
        if (i == 0 || [noForkeyDic allKeys].count != [array[i-1] count]) {
            noForkeyDic = [self noForKeyDicWithArray:array[i]];
        }else{
            [self addEntityIntoCtx:array[i] noForKeyDic:noForkeyDic entityName:entityName];
        }
    }
    //将coreDataManager.context里的数据保存到coreData中
    [coreDataManager saveContext];
}

//返回用与存储列数和属性键值对的字典
- (NSDictionary *)noForKeyDicWithArray:(NSArray *)array{
    NSString *tmpKey;
    NSMutableDictionary *noForKeyDic = [NSMutableDictionary new];
    for (int i = 0; i < array.count; i++) {
        if (![array[i] isEmpty]) {
            //值为id时将tmpValue值设为tid避免与关键字id重复
            if ([array[i] isEqualToString:@"id"]) {
                tmpKey = @"tid";
            }else{
                //取array[i]的小写，coreData属性值皆为小写
                tmpKey = [array[i] lowercaseString];
            }
            [noForKeyDic setObject:tmpKey forKey:@(i)];
        }
    }
    return noForKeyDic;
}

//将数据加入到coreDataManager.context中
- (void)addEntityIntoCtx:(NSArray *)array noForKeyDic:(NSDictionary *)noForKeyDic entityName:(NSString*)entityName{
    NSString *key;
    NSManagedObject *obj = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:coreDataManager.context];
    for (int i = 0 ; i < array.count; i++) {
        key = [noForKeyDic objectForKey:@(i)];
        [obj setValue:array[i] forKey:key];
    }
}

@end
