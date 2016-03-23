//
//  FileDownloads.h
//  aiugo
//
//  Created by hjs on 16/3/23.
//  Copyright © 2016年 IMJC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CHCSVParser.h"

typedef void (^SuccessBlock) (NSString *_Nullable filePath);
typedef void (^FailureBlock)(NSString *_Nullable failInfo);

@interface FileDownloads : NSObject<CHCSVParserDelegate>

+(nonnull instancetype)manager;

- (void)GET:(nonnull NSString *)URLString
                        parameters:(nullable id)parameters
                        progress:(nullable void (^)(NSProgress *_Nullable downloadProgress)) downloadProgress
                        success:(nullable SuccessBlock) success
                        failure:(nullable FailureBlock)failure;

@end
