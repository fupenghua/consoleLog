//
//  TBSLoggerConsoleFormatter.h
//  theBeastApp
//
//  Created by penghua fu on 2021/8/17.
//  Copyright © 2021 com.thebeastshop. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TBSLogMessage;
@interface TBSLoggerConsoleFormatter : NSObject
+ (NSString *)formattedLogMessage:(TBSLogMessage *)logMessage;

@end
