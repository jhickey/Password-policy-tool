//
//  PasswordPolicyManager.m
//  Password policy tool
//
//  Created by James Hickey on 1/23/13.
//  Copyright (c) 2013 Hickey, Jimmy. All rights reserved.
//

#import "PasswordPolicyManager.h"

@implementation PasswordPolicyManager
-(id)init
{
    self = [super init];
    if (self)
    {
        task = [[NSTask alloc] init];
        [task setLaunchPath: @"/usr/bin/pwpolicy"];

        pipe = [NSPipe pipe];
        [task setStandardOutput: pipe];
        
        file = [pipe fileHandleForReading];
    }
    return self;
}
-(NSString *)getPolicyWithUser:(NSString *)user
{

    NSArray *arguments;
    arguments = [NSArray arrayWithObjects: @"-u", user, @"--get-effective-policy", nil];
    [task setArguments: arguments];
    
    [task launch];
    
    NSData *data;
    data = [file readDataToEndOfFile];
    
    NSString *result = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];

    return result;
}
@end
