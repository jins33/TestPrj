//
//  Ad+CoreDataProperties.h
//  TestPrj
//
//  Created by hjs on 16/3/24.
//  Copyright © 2016年 hjs. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Ad.h"

NS_ASSUME_NONNULL_BEGIN

@interface Ad (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *adtext;
@property (nullable, nonatomic, retain) NSString *adtype;

@end

NS_ASSUME_NONNULL_END
