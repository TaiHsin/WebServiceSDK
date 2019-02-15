//
//  HTTPBinManagerOperation.m
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/11.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPBinManagerOperation.h"

@implementation HTTPBinManagerOperation

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.httpClient = [[HTTPClient alloc] init];
    }
    return self;
}

- (void)main {
    [super main];
    
    __block NSDictionary * firstDict = [NSDictionary new];
    __block NSDictionary * secondDict = [NSDictionary new];
    __block UIImage * pigImage = [UIImage new];
    
    self.semaphore = dispatch_semaphore_create(0);
    
    [self.httpClient fetchGetResponseWithCallback: ^(NSDictionary * dict, NSError * error) {
        
        if (error == nil) {
            firstDict = dict;
            [self.delegate operation: self willSuccessWithStatus: @"33"];
            
        } else {
            NSLog(@"%@",error.localizedDescription);

            [self.delegate operation: self willFailWithError: error];
        }
        
        dispatch_semaphore_signal(self.semaphore);
    }];
    
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    
    if (self.cancelled) {
        return;
    }

    [self.httpClient postCustomerName: @"KKBOX" callback: ^(NSDictionary * dict, NSError * error) {
        
        if (error == nil) {
            secondDict = dict[@"form"];
            
            [self.delegate operation: self willSuccessWithStatus: @"66"];
            
        } else {
            NSLog(@"%@",error.localizedDescription);
           
            [self.delegate operation: self willFailWithError: error];
        }
        
        dispatch_semaphore_signal(self.semaphore);
    }];
    
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    
    if (self.cancelled) {
        return;
    }
    
    [self.httpClient fetchImageWithCallback: ^(UIImage * image, NSError * error) {
        
        if (error == nil) {
            pigImage = image;
            
            [self.delegate operation: self willSuccessWithStatus: @"100"];
            
        } else {
            NSLog(@"%@",error.localizedDescription);
            
            [self.delegate operation: self willFailWithError: error];
        }
        
        dispatch_semaphore_signal(self.semaphore);
    }];
    
    dispatch_semaphore_wait(self.semaphore, DISPATCH_TIME_FOREVER);
    
    // Pass data after all request succeed.
    
    [self.delegate operation: self willSucceedWithFirstDict: firstDict withSecondDict: secondDict withImage: pigImage];
}

- (void)cancel {
    [super cancel];
    
    if (self.semaphore) {
        dispatch_semaphore_signal(self.semaphore);
    }
}

@end
