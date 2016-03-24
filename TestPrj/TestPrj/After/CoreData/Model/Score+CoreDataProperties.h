//
//  Score+CoreDataProperties.h
//  TestPrj
//
//  Created by F－03 on 16/3/24.
//  Copyright © 2016年 hjs. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Score.h"

NS_ASSUME_NONNULL_BEGIN

@interface Score (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *chinese;
@property (nullable, nonatomic, retain) NSNumber *english;
@property (nullable, nonatomic, retain) NSNumber *math;
@property (nullable, nonatomic, retain) Person *person;

@end

NS_ASSUME_NONNULL_END
