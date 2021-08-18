//
//  TBSLog.h
//  theBeastApp
//
//  Created by penghua fu on 2021/8/17.
//  Copyright © 2021 com.thebeastshop. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TBSLogDebug(frmt, ...) \
[TBSLog logWithFile:__FILE__ \
           function:__PRETTY_FUNCTION__ \
               line:__LINE__ \
            context:0 \
             format:(frmt), ##__VA_ARGS__]


@interface TBSLog : NSObject

+ (void)logWithFile:(const char *)file
           function:(const char *)function
               line:(NSUInteger)line
            context:(NSInteger)context
             format:(NSString *)format, ... NS_FORMAT_FUNCTION(5, 6);

@end
