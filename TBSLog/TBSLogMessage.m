//
//  TBSLogMessage.m
//  theBeastApp
//
//  Created by penghua fu on 2021/8/17.
//  Copyright © 2021 com.thebeastshop. All rights reserved.
//

#import "TBSLogMessage.h"

@implementation TBSLogMessage
- (instancetype)initWithMessage:(NSString *)message file:(NSString *)file function:(NSString *)function line:(NSUInteger)line context:(NSInteger)context timestamp:(NSDate *)timestamp {
    if (self = [super init]) {
        _message = message;
        _file = file;
        _function = function;
        _line = line;
        _context = context;
        _timestamp = timestamp;
        _fileName = file.lastPathComponent;
    }
    return self;
}
@end
