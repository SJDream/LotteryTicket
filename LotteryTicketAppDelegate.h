//
//  LotteryTicketAppDelegate.h
//  LotteryTicket
//
//  Created by 李顺杰 on 14-7-20.
//  Copyright (c) 2014年 SJ.Lee. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LotteryTicketAppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet NSTextField *textTerm;
    IBOutlet NSTextField *textR1;
    IBOutlet NSTextField *textR2;
    IBOutlet NSTextField *textR3;
    IBOutlet NSTextField *textR4;
    IBOutlet NSTextField *textR5;
    IBOutlet NSTextField *textR6;
    IBOutlet NSTextField *textB1;
    IBOutlet NSTableView *resultTable;
}

@property (assign) IBOutlet NSWindow *window;
@property (copy,nonatomic) NSString *databaseFilePath;

-(void)applicationWillResignActive:(NSNotification *)notification;
-(IBAction)Save:(id)sender;
-(IBAction)LoadData:(id)sender;

@end
