//
//  FileDownloads.m
//  aiugo
//
//  Created by hjs on 16/3/23.
//  Copyright © 2016年 IMJC. All rights reserved.
//

#import "FileDownloads.h"
#import <AFNetworking/AFNetworking.h>
#import "CHCSVParser.h"

@implementation FileDownloads

+(instancetype)manager{
    static id shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (void)GET:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nullable))downloadProgress success:(SuccessBlock)success failure:(FailureBlock)failure{
    
    //用AFNetworking GET方法获取数据
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 不加上这句话，会报“Request failed: unacceptable content-type: text/plain”错误
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull dp) {
        downloadProgress(dp);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *fileName = [URLString lastPathComponent];
        NSString *filePath = [[self documentsPath] stringByAppendingString:[NSString stringWithFormat:@"/%@", fileName]];
        NSLog(@"下载成功 %@", filePath);
        //将数据写到本地文件
        [self writeData:responseObject withFilePath:filePath success:success failure:failure];
        //解析CSV
        [self parseCSV:filePath];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(@"下载失败");
    }];
    
}

- (void)writeData:(NSData *)data withFilePath:(NSString *)filePath success:(SuccessBlock)successBlock failure:(FailureBlock)failureBlock{
    //创建文件
    NSFileManager *fm = [NSFileManager defaultManager];
    BOOL success = [fm createFileAtPath:filePath contents:nil attributes:nil];
    if (success) {
        //写入文件
        NSFileHandle *myHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
        if (myHandle != nil) {
            [myHandle writeData:data];
            [myHandle closeFile];
            NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
            NSUInteger length = 0;
            if (readHandle != nil) {
                length = [[readHandle availableData] length]; //获取数据长度
            }
            if (length > 0) {
                successBlock(filePath);
            }
            else{
                NSString *fileName = [filePath lastPathComponent];
                failureBlock([NSString stringWithFormat:@"%@文件保存失败", fileName]);
            }
        }
    }
}

-(NSString *)documentsPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

- (void)parseCSV:(NSString *)filePath{
    NSURL *inputFileURL = [NSURL fileURLWithPath:filePath];
   [NSArray arrayWithContentsOfCSVURL:inputFileURL];
    
}

@end
