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
    
    HTTPBinManagerOperation * httpOperation = [HTTPBinManagerOperation new];
    httpOperation.delegate = self;
    [self.queue addOperation: httpOperation];
}

#pragma HTTPOperationDelegate

- (void)operation:(HTTPBinManagerOperation *)httpOperation willFailWithError:(NSString *)errorInfo {
    
    [self.queue cancelAllOperations];
    [self.delegate manager: self didFailWithError: errorInfo];
}

- (void)operation: (HTTPBinManagerOperation *)httpOperation willSuccessWithStatus: (NSString *)percent {
    
    [self.delegate manager: self didSucceedWithStatus: percent];
}

- (void)operation:(HTTPBinManagerOperation *)httpOperation willSucceedWithFirstDict:(NSDictionary *)firstDict withSecondDict:(NSDictionary *)secondDict withImage:(UIImage *)image {
    
    [self.delegate manager: self didSucceedWithFirstDict: firstDict withSecondDict: secondDict withImage: image];
}

@end
