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

- (void)getData: (NSString *)dataUrl
        callback: (void(^)(NSData *, NSError *))callback {
    
    NSURL * url = [NSURL URLWithString: dataUrl];
    NSURLRequest * request = [NSURLRequest requestWithURL: url];
    
    // The task after network responsed will send to main thread.
    NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession * session = [NSURLSession sessionWithConfiguration: config delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask * dataTask =
    [session dataTaskWithRequest: request
               completionHandler: ^(NSData * _Nullable data,
                                    NSURLResponse * _Nullable response,
                                    NSError * _Nullable error) {
                   
                   if (error != nil) {
                       NSLog(@"dataTaskWithRequest error: %@", error);
                       return callback(nil, error);
                   }
                   
                   if ([response isKindOfClass: [NSHTTPURLResponse class]]) {
                       NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
                       
                       if (statusCode != 200) {
                           NSLog(@"dataTaskWithRequest HTTP status code: %ld", (long)statusCode);
                           
                           NSError * responseError = [[NSError alloc] initWithDomain: @"responseError.domain"
                                                                                code: 4444
                                                                            userInfo: @{NSLocalizedDescriptionKey:
                                                                                            @"ResponseError"
                                                                                        }];
                           
                           return callback(nil, responseError);
                       }
                   }
                   
                   return callback(data, nil);
               }
     ];
    [dataTask resume];
}

- (void)fetchGetResponseWithCallback: (void(^)(NSDictionary *, NSError *))callback {
    
    NSString * dataUrl = @"https://httpbin.org/get";
    [self getData: dataUrl
         callback:^(NSData * data, NSError * error) {
             
                 if (data != nil) {
                     NSError * parseError;
                     NSDictionary * dict = [NSJSONSerialization JSONObjectWithData: data
                                                                           options: 0
                                                                             error: &parseError];
                     
                     if (parseError) {
                         return callback(nil, parseError);
                     }
                     return callback(dict, nil);
                     
                 } else {
                     return callback(nil, error);
                 }
         }
     ];
}


- (void)fetchImageWithCallback: (void(^)(UIImage *, NSError *))callback {
    
    NSString * dataUrl = @"https://httpbin.org/image/png";
    [self getData: dataUrl
         callback: ^(NSData * data, NSError * error) {
             
                 if (data != nil) {
                     UIImage * image = [UIImage imageWithData: data];
                     return callback(image, nil);
                     
                 } else {
                     return callback(nil, error);
                 }
         }
     ];
}

- (void)postCustomerName: (NSString *)name
                 callback: (void(^)(NSDictionary *, NSError *))callback {
    
    NSString * dataUrl = @"https://httpbin.org/post";
    NSURL * url = [NSURL URLWithString: dataUrl];
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL: url];
    request.HTTPMethod = @"POST";
    NSString * args = [NSString stringWithFormat: @"custname=%@", name];
    request.HTTPBody = [args dataUsingEncoding: NSUTF8StringEncoding];
    
    NSURLSessionConfiguration * config = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession * session = [NSURLSession sessionWithConfiguration: config delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    NSURLSessionDataTask * dataTask =
    [session dataTaskWithRequest: request
               completionHandler: ^(NSData * _Nullable data,
                                    NSURLResponse * _Nullable response,
                                    NSError * _Nullable error) {
                   
                       if (error != nil) {
                           NSLog(@"dataTaskWithRequest error: %@", error);
                           return callback(nil, error);
                       }
                   

                       if ([response isKindOfClass: [NSHTTPURLResponse class]]) {
                           NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
                           
                           if (statusCode != 200) {
                               NSLog(@"dataTaskWithRequest HTTP status code: %ld", (long)statusCode);
                               
                               NSError * responseError = [[NSError alloc] initWithDomain: @"responseError.domain"
                                                                                    code: 4444
                                                                                userInfo: @{NSLocalizedDescriptionKey:
                                                                                                @"ResponseError"
                                                                                            }];
                               return callback(nil, responseError);

                           }
                       }
                       
                       if (data != nil) {
                           NSError * parseError;
                           NSDictionary * dict = [NSJSONSerialization JSONObjectWithData: data
                                                                                 options: 0
                                                                                   error: &parseError];
                           
                           if (parseError) {
                               return callback(nil, parseError);
                           }
                           return callback(dict, nil);
                       }
               }
     ];
    [dataTask resume];
}

@end
