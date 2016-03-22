//
//  PublicData.h
//  TestPrj
//
//  Created by hjs on 16/3/22.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PublicData : NSObject

+(instancetype)manage;

-(NSString *)documentsPath;

-(void)writeData:(NSData *)data withFilePath:(NSString *)filePath;

@end
