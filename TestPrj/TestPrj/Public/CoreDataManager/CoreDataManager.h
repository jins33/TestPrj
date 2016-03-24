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

+(instancetype)manage;

- (void)initContext;

-(void)saveContext;

- (NSArray *)queryEntity:(NSString *) entityName withCondition:(NSString *) condition;

@end
