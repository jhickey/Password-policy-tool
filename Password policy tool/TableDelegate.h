//
//  TableDelegate.h
//  Password policy tool
//
//  Created by James Hickey on 1/23/13.
//  Copyright (c) 2013 Hickey, Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableDelegate : NSObject
@property (strong) NSMutableArray *userNames;
@property (weak) IBOutlet NSTextField *outputBox;
@property (weak) IBOutlet NSTableView *tableView;
@end
