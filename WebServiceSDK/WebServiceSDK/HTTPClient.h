//
//  HTTPClient.h
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/1.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
//
//@class HTTPClient;
//
//typedef NS_ENUM: NSError {
//    ServerError,
//    
//};


@interface HTTPClient: NSObject

- (void) fetchGetResponseWithCallback: (void(^)(NSDictionary *, NSError *))callback;

- (void) postCustomerName: (NSString *)name callback:(void(^)(NSDictionary *, NSError *))callback;

- (void) fetchImageWithCallback: (void(^)(UIImage *, NSError *))callback;

@end
