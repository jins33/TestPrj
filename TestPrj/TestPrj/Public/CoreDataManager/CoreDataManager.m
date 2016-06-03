//
//  CoreDataManager.m
//  CoreDataTest
//
//  Created by hjs on 16/3/20.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "CoreDataManager.h"
#define MODELNAME @"TestPrj"

@implementation CoreDataManager

+ (instancetype)manager{
    static id sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

//搭建上下文环境
- (void)initContext{
    // 初始化模型文件
    if(_managedObjectModel == nil){
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:MODELNAME withExtension:@"momd"];
        _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    // 传入模型对象，初始化NSPersistentStoreCoordinator
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_managedObjectModel];
    
    // 构建SQLite数据库文件的路径
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSURL *url = [NSURL fileURLWithPath:[resourcePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite", MODELNAME]]];
    NSLog(@"path: %@", [url relativeString]);
    
    // 添加持久化存储库，这里使用SQLite作为存储库
    NSError *error = nil;
    NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    if (store == nil) {// 直接抛异常
        [NSException raise:@"数据库创建出错" format:@"%@", [error localizedDescription]];
    }
    // 初始化上下文，设置persistentStoreCoordinator属性
    _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    _context.persistentStoreCoordinator = psc;
}

// 利用上下文对象，将数据同步到持久化存储库
-(void)saveContext{
    NSError *error = nil;
    if (_context != nil) {
        if ([_context hasChanges] && ![_context save:&error]) {
            [NSException raise:@"访问数据库错误" format:@"%@", [error localizedDescription]];
        }
    }
}

//清空实体表内容
- (void)clearEntityTable:(NSString *)entityName{
    NSArray *entityArray = [self queryEntityName:entityName withCondition:@""];
    for (NSManagedObject *obj in entityArray) {
        [_context deleteObject:obj];
    }
    [self saveContext];
}

//按条件查询
- (NSArray *)queryEntityName:(NSString *)entityName withCondition:(NSString *)condition{
    
    NSError *error = nil;
    
    // 初始化一个查询请求
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    // 设置要查询的实体
    request.entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:_context];
    
//    // 设置排序（按照age降序）
//    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:NO];
//    request.sortDescriptors = [NSArray arrayWithObject:sort];
    
    if (condition != nil && ![condition isEqualToString:@""]) {
        //设置条件过滤(搜索name中包含字符串"Itcast-1"的记录，注意：设置条件过滤时，数据库SQL语句中的%要用*来代替，所以%MJ%应该写成*MJ*)
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%@", condition];
        request.predicate = predicate;
    }
    return [_context executeFetchRequest:request error:&error];
}

@end
