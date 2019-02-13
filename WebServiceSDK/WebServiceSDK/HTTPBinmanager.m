//
//  HTTPBinManager.m
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/11.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPBinManager.h"

@implementation HTTPBinManager

+ (instancetype)sharedInstance {
    
    static HTTPBinManager * instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[HTTPBinManager alloc] init];
    });
                    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.queue = [NSOperationQueue new];
        [self.queue setMaxConcurrentOperationCount: 1];
    }
    return self;
}

- (void)executeOperation {
    
    [self.queue cancelAllOperations];
    [self.delegate didFail: self];
    
    HTTPBinManagerOperation * httpOperation = [HTTPBinManagerOperation new];
    httpOperation.delegate = self;
    [self.queue addOperation: httpOperation];
}

#pragma HTTPOperationDelegate

- (void)didRequestFail: (HTTPBinManagerOperation *)httpOperation {
    
//    [self.queue cancelAllOperations];
    [self.delegate didFail: self];
}

- (void)didRequestSucceed: (HTTPBinManagerOperation *)httpOperation
               withStatus: (NSString *)percent {
    NSLog(@"%@", percent);
    [self.delegate didSucceed: self withStatus: percent];
}

- (void)didRecieveData: (HTTPBinManagerOperation *)httpOperation
         withFirstDict: (NSDictionary *)firstDict
        withSecondDict: (NSDictionary *)secondDict
             withImage: (UIImage *)image {
    
    [self.delegate didPassData: self
                    withFirstDict: firstDict
                   withSecondDict: secondDict
                        withImage: image];
}

@end
