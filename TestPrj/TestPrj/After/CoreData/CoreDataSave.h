//
//  CoreDataSave.h
//  TestPrj
//
//  Created by F－03 on 16/3/24.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataSave : NSObject

//将csv格式的二维数组转化为对象并存储到CoreData
- (void)SaveCSVData:(NSArray *)array entityName:(NSString*)entityName;
+ (instancetype)manager;

@end
