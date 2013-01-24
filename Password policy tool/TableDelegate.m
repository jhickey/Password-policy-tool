//
//  TableDelegate.m
//  Password policy tool
//
//  Created by James Hickey on 1/23/13.
//  Copyright (c) 2013 Hickey, Jimmy. All rights reserved.
//

#import "TableDelegate.h"
#import "PasswordPolicyManager.h"
@implementation TableDelegate
@synthesize userNames = _userNames;

-(id)init
{
    self = [super init];
    if (self)
    {
        _userNames = [[NSMutableArray alloc] init];
        NSFileManager *filemgr;
        filemgr = [NSFileManager defaultManager];
        NSURL * selectedFolderURL = [NSURL fileURLWithPath:@"/Users/"];
        NSArray *tempArray = [filemgr contentsOfDirectoryAtURL:selectedFolderURL
                            includingPropertiesForKeys:[NSArray arrayWithObject:NSURLNameKey]
                                               options:NSDirectoryEnumerationSkipsHiddenFiles
                                                  error: nil];
        for (NSString *items in tempArray)
        {
            NSString *lastComponent = [items lastPathComponent];
            
            if ([lastComponent isNotEqualTo:@"Guest"] && [lastComponent isNotEqualTo:@"Shared"])
            {
                [_userNames addObject:lastComponent];
            }
        }
    }
    return self;
}
-(NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    NSInteger *c = [_userNames count];
    return c;
}
-(id)tableView:aTableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString *v = [_userNames objectAtIndex:row];
    return v;
}
-(void)tableViewSelectionDidChange:(NSNotification *)notification
{
    
    NSInteger row = [_tableView selectedRow];
    if (row == -1){
        return;
    }
    NSString *selectedUser = [_userNames objectAtIndex:row];
    
    PasswordPolicyManager *myPolicy = [[PasswordPolicyManager alloc] init];
    NSString *policyResult = [myPolicy getPolicyWithUser:selectedUser];
    
    [_outputBox setStringValue:policyResult];
}
@end
