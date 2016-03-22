//
//  BlockModel.h
//  TestPrj
//
//  Created by hjs on 15/12/31.
//  Copyright © 2015年 hjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlockModel : NSObject

typedef void (^ReturnValueBlock) (id returnValue);

@property (strong, nonatomic) ReturnValueBlock testBlock;

-(void)run;

@end
