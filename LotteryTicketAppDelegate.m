//
//  LotteryTicketAppDelegate.m
//  LotteryTicket
//
//  Created by 李顺杰 on 14-7-20.
//  Copyright (c) 2014年 SJ.Lee. All rights reserved.
//

#import "LotteryTicketAppDelegate.h"
#import "DAL/DBOperat.h"
#define DataBaseName @"LotteryTicket.sqlite"

@implementation LotteryTicketAppDelegate
@synthesize databaseFilePath;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your applicat
}

-(IBAction)Save:(id)sender
{
//    if ([[textTerm stringValue] length]==0 || [[textR1 stringValue] length] ==0
//        || [[textR2 stringValue] length] == 0 || [[textR3 stringValue] length] == 0
//        || [[textR4 stringValue] length] == 0 || [[textR5 stringValue] length] == 0
//        || [[textR6 stringValue] length] == 0 || [[textB1 stringValue] length] == 0) {
//        //验证文本框
//        NSAlert* alert = [NSAlert alertWithMessageText:@"请全部填写！" defaultButton:@"好的" alternateButton:nil otherButton:nil informativeTextWithFormat:@"警告" ];
//        
//        [alert beginSheetModalForWindow:nil modalDelegate:nil didEndSelector:nil contextInfo:nil];
//        return;
//    }
    NSInteger intTerm = [textTerm.stringValue integerValue];
    NSInteger intR1 = [textR1.stringValue integerValue];
    NSInteger intR2 = [textR2.stringValue integerValue];
    NSInteger intR3 = [textR3.stringValue integerValue];
    NSInteger intR4 = [textR4.stringValue integerValue];
    NSInteger intR5 = [textR5.stringValue integerValue];
    NSInteger intR6 = [textR6.stringValue integerValue];
    NSInteger intB1 = [textB1.stringValue integerValue];
    DBOperat *add = [[DBOperat alloc] init];
    NSString *test = [add Add:&intTerm andR1:&intR1 andR2:&intR2 andR3:&intR3 andR4:&intR4 andR5:&intR5 andR6:&intR6 andB1:&intB1];
    NSAlert* alert = [NSAlert alertWithMessageText:@"警告" defaultButton:@"好的" alternateButton:nil otherButton:nil informativeTextWithFormat:test ];
    
    [alert beginSheetModalForWindow:nil modalDelegate:nil didEndSelector:nil contextInfo:nil];
}

-(IBAction)LoadData:(id)sender
{
    DBOperat *query = [[DBOperat alloc] init];
    resultTable = query.Query;
    
    // create a table view and a scroll view
//    NSScrollView * tableContainer = [[NSScrollView alloc] initWithFrame:NSMakeRect(10, 10, 380, 200)];
//    NSTableView * tableView = [[NSTableView alloc] initWithFrame:NSMakeRect(0, 0, 364, 200)];
//    // create columns for our table
//    NSTableColumn * column1 = [[NSTableColumn alloc] initWithIdentifier:@"Col1"];
//    NSTableColumn * column2 = [[NSTableColumn alloc] initWithIdentifier:@"Col2"];
//    [column1 setWidth:252];
//    [column2 setWidth:198];
//    // generally you want to add at least one column to the table view.
//    [tableView addTableColumn:column1];
//    [tableView addTableColumn:column2];
//    [tableView setDelegate:self];
//    [tableView setDataSource:self];
//    [tableView reloadData];
//    // embed the table view in the scroll view, and add the scroll view to our window.
//    [tableContainer setDocumentView:tableView];
//    [tableContainer setHasVerticalScroller:YES];
//    [[self contentView] addSubview:tableContainer];
//    [tableContainer release];
//    [tableView release];
//    [column1 release];
//    [column2 release];
}

@end
