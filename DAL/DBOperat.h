//
//  DBOperat.h
//  LotteryTicket
//
//  Created by 李顺杰 on 14-7-20.
//  Copyright (c) 2014年 SJ.Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBOperat : NSObject
{
    
}

@property (copy,nonatomic) NSString *databaseFilePath;

-(NSString*)Add:(NSInteger *)term andR1:(NSInteger *) R1 andR2:(NSInteger *) R2 andR3:(NSInteger *) R3
          andR4:(NSInteger *)R4 andR5:(NSInteger *)R5 andR6:(NSInteger *)R6 andB1:(NSInteger *)B1;
-(IBAction)Query:(id)sender;

@end
