//
//  NSString+Custom.m
//  TestPrj
//
//  Created by F－03 on 16/3/24.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "NSString+Custom.h"

@implementation NSString (Custom)

//判断字串是否为空
-(BOOL)isEmpty{
    if (self == nil || [self isEqualToString:@""]) {
        return YES;
    }
    return NO;
}

- (void)addProperty{
    objc_setAssociatedObject(self, @"test", @"JustForTest, You know!", OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
