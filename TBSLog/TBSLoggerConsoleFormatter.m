//
//  TBSLoggerConsoleFormatter.m
//  theBeastApp
//
//  Created by penghua fu on 2021/8/17.
//  Copyright © 2021 com.thebeastshop. All rights reserved.
//

#import "TBSLoggerConsoleFormatter.h"
#import "TBSLogMessage.h"

@implementation TBSLoggerConsoleFormatter
+ (NSString *)formattedLogMessage:(TBSLogMessage *)logMessage {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss.SSSSSS";
    NSString *dateString = [dateFormatter stringFromDate:logMessage.timestamp];
    NSString *line = [NSString stringWithFormat:@"%lu", logMessage.line];
    NSString *output = [NSString stringWithFormat:@"%@ %@ %@ line:%@ \n%@\n", dateString, logMessage.fileName, logMessage.function, line, logMessage.message];
    return [self unicodeString:output];
}

+ (NSString *)unicodeString:(NSString *)string {
    if (!string) {return nil;}
    if ([string rangeOfString:@"\[uU][A-Fa-f0-9]{4}" options:NSRegularExpressionSearch].location == NSNotFound) {
        return string;
    }
    NSMutableString *mutableString = [NSMutableString stringWithString:string];
    [mutableString replaceOccurrencesOfString:@"\\u" withString:@"\\U" options:0 range:NSMakeRange(0, string.length)];
    [mutableString replaceOccurrencesOfString:@"\"" withString:@"\\\"" options:0 range:NSMakeRange(0, string.length)];
    [mutableString insertString:@"\"" atIndex:0];
    [mutableString appendString:@"\""];
    NSData *data = [mutableString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
    NSPropertyListFormat format = NSPropertyListOpenStepFormat;
    NSString *formatString = [NSPropertyListSerialization propertyListWithData:data options:NSPropertyListImmutable format:&format error:&error];
    return error ? string : [formatString stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}
@end
