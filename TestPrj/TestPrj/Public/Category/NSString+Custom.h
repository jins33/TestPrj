//
//  NSString+Custom.h
//  TestPrj
//
//  Created by F－03 on 16/3/24.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSString (Custom)

//判断字串是否为空
-(BOOL)isEmpty;

- (void)addProperty;

@end
