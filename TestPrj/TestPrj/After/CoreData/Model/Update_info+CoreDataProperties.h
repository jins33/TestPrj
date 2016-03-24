//
//  Update_info+CoreDataProperties.h
//  TestPrj
//
//  Created by hjs on 16/3/24.
//  Copyright © 2016年 hjs. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Update_info.h"

NS_ASSUME_NONNULL_BEGIN

@interface Update_info (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *comments;
@property (nullable, nonatomic, retain) NSString *tid;
@property (nullable, nonatomic, retain) NSString *update;
@property (nullable, nonatomic, retain) NSString *url;

@end

NS_ASSUME_NONNULL_END
