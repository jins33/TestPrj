//
//  PublicData.m
//  TestPrj
//
//  Created by hjs on 16/3/22.
//  Copyright © 2016年 hjs. All rights reserved.
//

#import "PublicData.h"

@implementation PublicData

+(instancetype)manage{
    
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc]init];
    });
    return sharedInstance;
}

-(NSString *)documentsPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return documentsDirectory;
}

- (void)writeData:(NSData *)data withFilePath:(NSString *)filePath{
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
                NSLog(@"保存成功.");
            }
            
            else{
                NSLog(@"保存失败.");
            }
        }
    }
}

@end
