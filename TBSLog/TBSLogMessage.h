//
//  TBSLogMessage.h
//  theBeastApp
//
//  Created by penghua fu on 2021/8/17.
//  Copyright © 2021 com.thebeastshop. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBSLogMessage : NSObject
@property (nonatomic, copy, readonly) NSString *message;
@property (nonatomic, copy, readonly) NSString *file;
@property (nonatomic, copy, readonly) NSString *fileName;
@property (nonatomic, copy, readonly) NSString *function;
@property (nonatomic, assign, readonly) NSUInteger line;
@property (nonatomic, assign, readonly) NSInteger context;
@property (nonatomic, strong, readonly) NSDate *timestamp;

- (instancetype)init NS_UNAVAILABLE;

- (instancetype)initWithMessage:(NSString *)message
                           file:(NSString *)file
                       function:(NSString *)function
                           line:(NSUInteger)line
                        context:(NSInteger)context
                      timestamp:(NSDate *)timestamp NS_DESIGNATED_INITIALIZER;
@end
