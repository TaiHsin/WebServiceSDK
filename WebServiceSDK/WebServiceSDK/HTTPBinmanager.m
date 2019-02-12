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

- (void)executeOperation {
    
    // Cancel all operation
    // TODO
    
    // Add operation
    HTTPBinManagerOperation * httpOperation = [HTTPBinManagerOperation new];
    httpOperation.delegate = self;
    
    self.queue = [NSOperationQueue new];
    [self.queue setMaxConcurrentOperationCount: 1];
    [self.queue addOperation: httpOperation];
    
    NSLog(@"------------------");
    NSLog(@"EXECUTE OPERATION!");
}

#pragma HTTPOperationDelegate

- (void)didRequestFail:(HTTPBinManagerOperation *)httpOperation {
    
    [self.delegate didFail: self];
}

- (void)didRequestSucceed:(HTTPBinManagerOperation *)httpOperation withStatus:(int)number {
    
    [self.delegate didSucceed: self withStatus: number];
}

@end

