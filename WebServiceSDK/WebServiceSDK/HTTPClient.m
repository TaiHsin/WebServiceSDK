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
    NSURLRequest * request = [NSURLRequest requestWithURL: url];
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask * dataTask =
    [session dataTaskWithRequest: request
               completionHandler:^(NSData * _Nullable data,
                                   NSURLResponse * _Nullable response,
                                   NSError * _Nullable error) {
                   
                   dispatch_async(dispatch_get_main_queue(), ^{
                       
                       if (data != NULL) {
                           NSError * parseError;
                           NSDictionary * dict = [NSJSONSerialization JSONObjectWithData: data
                                                                                 options: 0
                                                                                   error: &parseError
                                                  ];
                           callback(dict, parseError);
                           
                       } else {
                           
                           callback(nil, error);
                       }
                   });
               }
     ];
    
    [dataTask resume];
}

- (void) postCustomerName: (NSString *)name callback: (void(^)(NSDictionary *, NSError *))callback {
    
}

- (void) fetchImageWithCallback: (void(^)(UIImage *, NSError *))callback {
    NSString * dataUrl = @"https://httpbin.org/image/png";
    NSURL * url = [NSURL URLWithString: dataUrl];
    NSURLRequest * request = [NSURLRequest requestWithURL: url];
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask * dataTask =
    [session dataTaskWithRequest: request
               completionHandler: ^(NSData * _Nullable data,
                                    NSURLResponse * _Nullable response,
                                    NSError * _Nullable error) {
                   
                   dispatch_async(dispatch_get_main_queue(), ^{
                       
                       if (data != NULL) {
                           UIImage * image = [UIImage imageWithData: data];
                           callback(image, nil);
                           
                       } else {
                           callback(nil, error);
                       }
                   });
               }
     ];
    
    [dataTask resume];
}

@end
