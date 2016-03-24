//
//  Whatnew+CoreDataProperties.h
//  TestPrj
//
//  Created by hjs on 16/3/24.
//  Copyright © 2016年 hjs. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Whatnew.h"

NS_ASSUME_NONNULL_BEGIN

@interface Whatnew (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *message;
@property (nullable, nonatomic, retain) NSString *tid;
@property (nullable, nonatomic, retain) NSString *title;

@end

NS_ASSUME_NONNULL_END
