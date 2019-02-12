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
    
    dispatch_semaphore_t mySemaphore = dispatch_semaphore_create(0);
    
    [self.httpClient fetchGetResponseWithCallback: ^(NSDictionary * dict, NSError * error) {
        
        if (error == nil) {
            
            firstDict = dict;
            [self.delegate didRequestSucceed: self withStatus: @"33"];
            
        } else {
            NSLog(@"%@",error.localizedDescription);
            
            [self.delegate didRequestFail: self];
        }
        
        dispatch_semaphore_signal(mySemaphore);
    }];
    
    if (self.cancelled) {
        
        [self.delegate didRequestFail: self];
        
        return;
    }
    
    dispatch_semaphore_wait(mySemaphore, DISPATCH_TIME_FOREVER);
    [self.httpClient fetchImageWithCallback: ^(UIImage * image, NSError * error) {
        
        if (error == nil) {
            pigImage = image;
            [self.delegate didRequestSucceed: self withStatus: @"66"];
            
        } else {
            NSLog(@"%@",error.localizedDescription);
            
            [self.delegate didRequestFail: self];
        }
        
        dispatch_semaphore_signal(mySemaphore);
    }];
    
    if (self.cancelled) {

        [self.delegate didRequestFail: self];
        
        return;
    }
    
    dispatch_semaphore_wait(mySemaphore, DISPATCH_TIME_FOREVER);
    [self.httpClient postCustomerName: @"KKBOX" callback: ^(NSDictionary * dict, NSError * error) {
        
        if (error == nil) {
            //            NSString * custName = dict[@"form"];
            //            NSLog(@"%@", custName);
            secondDict = dict[@"form"];
            
            [self.delegate didRequestSucceed: self withStatus: @"100"];
            
        } else {
            NSLog(@"%@",error.localizedDescription);
            
            [self.delegate didRequestFail: self];
        }
        
        dispatch_semaphore_signal(mySemaphore);
    }];
    
    dispatch_semaphore_wait(mySemaphore, DISPATCH_TIME_FOREVER);
    
    // Pass data after all request succeed.
    
//    [self.delegate didRecieveData: self
//                    withFirstDict: firstDict
//                   withSecondDict: secondDict
//                        withImage: pigImage];
}

@end
