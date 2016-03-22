//
//  BlockTest.h
//  TestPrj
//
//  Created by hjs on 15/11/13.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlockTest : NSObject

typedef void (^TestBlock)();

@property (strong, nonatomic) TestBlock testBlock;

@end
