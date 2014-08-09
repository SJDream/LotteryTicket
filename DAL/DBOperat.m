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

-(NSTableView*)Query
{
    NSTableView *returnTable = [[NSTableView alloc] init];
    
    //create columns for table
    NSTableColumn *colTKID = [[NSTableColumn alloc] initWithIdentifier:@"TKID"];
    NSTableColumn *colTKTerm = [[NSTableColumn alloc] initWithIdentifier:@"TKTerm"];
    NSTableColumn *colTKR1 = [[NSTableColumn alloc] initWithIdentifier:@"TKR1"];
    NSTableColumn *colTKR2 = [[NSTableColumn alloc] initWithIdentifier:@"TKR2"];
    NSTableColumn *colTKR3 = [[NSTableColumn alloc] initWithIdentifier:@"TKR3"];
    NSTableColumn *colTKR4 = [[NSTableColumn alloc] initWithIdentifier:@"TKR4"];
    NSTableColumn *colTKR5 = [[NSTableColumn alloc] initWithIdentifier:@"TKR5"];
    NSTableColumn *colTKR6 = [[NSTableColumn alloc] initWithIdentifier:@"TKR6"];
    NSTableColumn *colTKB1 = [[NSTableColumn alloc] initWithIdentifier:@"TKB1"];
    NSTableColumn *colCreateDate = [[NSTableColumn alloc] initWithIdentifier:@"createdate"];
    
    //read table
    NSString *sqlCommand = @"SELECT * FROM DoubleColorBall";
    sqlite3_stmt *statement;
    sqlite3 *database;
    self.databaseFilePath = @"/Users/SJLee/Documents/Code/Objective-C/LotteryTicket/LotteryTicket/Data/LotteryTicket.sqlite";
    if (sqlite3_open([self.databaseFilePath UTF8String], &database)!= SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"打开数据库失败！");
    }
    if (sqlite3_prepare(database, [sqlCommand UTF8String], -1, &statement, nil)) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int rowNum = sqlite3_column_int(statement, 0);
            char *rowData = (char *)sqlite3_column_text(statement, 1);
            NSString *debug = [[NSString alloc] initWithUTF8String:rowData];
        }
    }
    sqlite3_finalize(statement);
    sqlite3_close(database);
    
    [returnTable addTableColumn:colTKID];
    [returnTable addTableColumn:colTKTerm];
    [returnTable addTableColumn:colTKR1];
    [returnTable addTableColumn:colTKR2];
    [returnTable addTableColumn:colTKR3];
    [returnTable addTableColumn:colTKR4];
    [returnTable addTableColumn:colTKR5];
    [returnTable addTableColumn:colTKR6];
    [returnTable addTableColumn:colTKB1];
    [returnTable addTableColumn:colCreateDate];
    
    return returnTable;
}

@end
