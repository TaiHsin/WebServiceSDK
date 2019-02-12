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
    
    dispatch_semaphore_t mySemaphore = dispatch_semaphore_create(0);
    
    [self.httpClient fetchGetResponseWithCallback: ^(NSDictionary * dict, NSError * error) {
        
        if (error == nil) {
            NSLog(@"%@", dict);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate didRequestSucceed: self withStatus: 1];
            });
            
        } else {
            NSLog(@"%@",error.localizedDescription);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate didRequestFail: self];
            });
        }
        
        dispatch_semaphore_signal(mySemaphore);
    }];
    
    dispatch_semaphore_wait(mySemaphore, DISPATCH_TIME_FOREVER);
    [self.httpClient fetchImageWithCallback: ^(UIImage * image, NSError * error) {
        
        if (error == nil) {
//            [weakSelf.pigView setImage: image];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate didRequestSucceed: self withStatus: 2];
            });
            
        } else {
            NSLog(@"%@",error.localizedDescription);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate didRequestFail: self];
            });
        }
        
        dispatch_semaphore_signal(mySemaphore);
    }];
    
    dispatch_semaphore_wait(mySemaphore, DISPATCH_TIME_FOREVER);
    [self.httpClient postCustomerName: @"KKBOX" callback: ^(NSDictionary * dict, NSError * error) {
        
        if (error == nil) {
            NSString * custName = dict[@"form"];
            NSLog(@"%@", custName);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate didRequestSucceed: self withStatus: 3];
            });
            
        } else {
            NSLog(@"%@",error.localizedDescription);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate didRequestFail: self];
            });
        }
        
        dispatch_semaphore_signal(mySemaphore);
    }];
    
    dispatch_semaphore_wait(mySemaphore, DISPATCH_TIME_FOREVER);
    
    // TODO: pass data
}

- (void)cancel {
    [super cancel];
}

@end
