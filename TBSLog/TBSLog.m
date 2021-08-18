//
//  TBSLog.m
//  theBeastApp
//
//  Created by penghua fu on 2021/8/17.
//  Copyright © 2021 com.thebeastshop. All rights reserved.
//

#import "TBSLog.h"
#import "TBSLogMessage.h"
#import "TBSConsoleLogger.h"
@implementation TBSLog

+ (void)logWithFile:(const char *)file function:(const char *)function line:(NSUInteger)line context:(NSInteger)context format:(NSString *)format, ... {
    if (!format) {
        return;
    }

    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    [self message:message file:file function:function line:line context:context];

}

+ (void)message:(NSString *)message
       file:(const char *)file
   function:(const char *)function
       line:(NSUInteger)line
    context:(NSInteger)context {
    if (file == NULL || function == NULL) {
        return;
    }
    NSDate *timestamp = [NSDate date];
    TBSLogMessage *logMessage = [[TBSLogMessage alloc] initWithMessage:message file:[NSString stringWithUTF8String:file] function:[NSString stringWithUTF8String:function] line:line context:context timestamp:timestamp];
    @autoreleasepool {
        [TBSConsoleLogger logMessage:logMessage];
    }
}


@end
