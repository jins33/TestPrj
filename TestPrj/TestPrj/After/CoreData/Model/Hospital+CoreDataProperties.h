//
//  Hospital+CoreDataProperties.h
//  TestPrj
//
//  Created by hjs on 16/3/24.
//  Copyright © 2016年 hjs. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Hospital.h"

NS_ASSUME_NONNULL_BEGIN

@interface Hospital (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSString *area;
@property (nullable, nonatomic, retain) NSString *comments;
@property (nullable, nonatomic, retain) NSString *country;
@property (nullable, nonatomic, retain) NSString *hospital;
@property (nullable, nonatomic, retain) NSString *map_flag;
@property (nullable, nonatomic, retain) NSString *opendate;
@property (nullable, nonatomic, retain) NSString *phone1;
@property (nullable, nonatomic, retain) NSString *phone2;
@property (nullable, nonatomic, retain) NSString *state_city;

@end

NS_ASSUME_NONNULL_END
