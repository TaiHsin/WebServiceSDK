//
//  HTTPClient.m
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/1.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPClient.h"

@implementation HTTPClient

- (void) fetchGetResponseWithCallback: (void(^)(NSDictionary *, NSError *))callback {
    NSString * dataUrl = @"https://httpbin.org/get";
    NSURL * url = [NSURL URLWithString: dataUrl];
    
    NSURLSessionDataTask * downloadTask = [[NSURLSession sharedSession] dataTaskWithURL: url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != NULL) {
            NSError * parsError;
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData: data options: 0 error: &parsError];
            callback(dict, parsError);
            
        } else {
            
            callback(nil, error);
        }
    }];
    
    [downloadTask resume];
}

- (void) postCustomerName: (NSString *)name callback:(void(^)(NSDictionary *, NSError *))callback {
    
}

- (void) fetchImageWithCallback: (void(^)(UIImage *, NSError *))callback {
    
}

@end
