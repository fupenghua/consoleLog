//
//  TBSConsoleLogger.m
//  theBeastApp
//
//  Created by penghua fu on 2021/8/17.
//  Copyright © 2021 com.thebeastshop. All rights reserved.
//

#import "TBSConsoleLogger.h"
#import "TBSLogMessage.h"
#import "TBSLoggerConsoleFormatter.h"
#import <sys/uio.h>

@implementation TBSConsoleLogger

+ (void)logMessage:(TBSLogMessage *)logMessage {
    NSString *message = [TBSLoggerConsoleFormatter formattedLogMessage:logMessage];
    NSUInteger messageLength = [message lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    BOOL useStack = messageLength < 1024 * 4;
    char messageStack[useStack ? (messageLength + 1) : 1];
    char *msg = useStack ? messageStack : (char *)calloc(messageLength + 1, sizeof(char));
    
    if (msg == NULL) {
        return;
    }
    
    BOOL canBeConvertedToEncoding = [message getCString:msg maxLength:(messageLength + 1) encoding:NSUTF8StringEncoding];
    
    if (!canBeConvertedToEncoding) {
        // free memory if not use stack
        if (!useStack) {
            free(msg);
        }
        return;
    }
    
    struct iovec dataBuffer[1];
    dataBuffer[0].iov_base = msg;
    dataBuffer[0].iov_len = messageLength;
    writev(STDERR_FILENO, dataBuffer, 1);
    
    // free memory if not use stack
    if (!useStack) {
        free(msg);
    }
    
}
@end
