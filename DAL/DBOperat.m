//
//  DBOperat.m
//  LotteryTicket
//
//  Created by 李顺杰 on 14-7-20.
//  Copyright (c) 2014年 SJ.Lee. All rights reserved.
//

#import "DBOperat.h"
#import "sqlite3.h"
#define DataBaseName @"LotteryTicket.sqlite"

@implementation DBOperat
@synthesize databaseFilePath;
-(NSString*)Add:(NSInteger *)term andR1:(NSInteger *)R1 andR2:(NSInteger *)R2 andR3:(NSInteger *)R3 andR4:(NSInteger *)R4 andR5:(NSInteger *)R5 andR6:(NSInteger *)R6 andB1:(NSInteger *)B1
{
    NSArray *dbPath = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [dbPath objectAtIndex:0];
    self.databaseFilePath = @"/Users/SJLee/Documents/Code/Objective-C/LotteryTicket/LotteryTicket/Data/LotteryTicket.sqlite";
//    NSFileManager *fileManger = [NSFileManager defaultManager];
//    BOOL success = [fileManger fileExistsAtPath:self.databaseFilePath];
//    return success==true?@"文件路径正确":self.databaseFilePath;
    sqlite3 *lTicket;
    if (sqlite3_open([self.databaseFilePath UTF8String], &lTicket)!= SQLITE_OK) {
        sqlite3_close(lTicket);
        return @"打开数据库失败！";
    }
    //Insert
    NSString *sqlCommand = [[NSString alloc] initWithFormat: @"INSERT INTO DoubleColorBall(TKTERM,TKR1,TKR2,TKR3,TKR4,TKR5,TKR6,TKB1) VALUES(%d,%d,%d,%d,%d,%d,%d,%d);",                            &term,&R1,&R2,&R3,&R4,&R5,&R6,&B1];
    char *errorMsg;
    if (sqlite3_exec(lTicket, [sqlCommand UTF8String], NULL, NULL, &errorMsg) != SQLITE_OK) {
        sqlite3_close(lTicket);
        return [[NSString alloc] initWithFormat:@"新增发生异常，异常原因：%s",errorMsg];
    }
    sqlite3_close(lTicket);
    return @"新增成功!";
}

@end
