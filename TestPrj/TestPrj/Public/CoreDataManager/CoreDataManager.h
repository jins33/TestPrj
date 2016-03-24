//
//  CoreDataManager.h
//  CoreDataTest
//
//  Created by hjs on 16/3/20.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataManager : NSObject


@property NSManagedObjectContext *context;
@property NSManagedObjectModel *managedObjectModel;

+(instancetype)manager;

- (void)initContext;

-(void)saveContext;

//按条件查询
- (NSArray *)queryEntityName:(NSString *)entityName withCondition:(NSString *)condition;

//清空实体表内容
- (void)clearEntityTable:(NSString *)entityName;

@end
