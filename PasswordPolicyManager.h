//
//  PasswordPolicyManager.h
//  Password policy tool
//
//  Created by James Hickey on 1/23/13.
//  Copyright (c) 2013 Hickey, Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PasswordPolicyManager : NSObject
{
        NSTask *task;
        NSPipe *pipe;
        NSFileHandle *file;
}

-(NSString *) getPolicyWithUser:(NSString *)user;

@end
