//
//  HTTPBinManagerOperation.h
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/11.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import "HTTPClient.h"

@class HTTPBinManagerOperation;

@protocol HTTPProcessDelegate <NSObject>

- (void)isRequestSucceed: (HTTPBinManagerOperation *)httpOperation;

- (void)isRequestFailed: (HTTPBinManagerOperation *)httpOperation;

@end

@interface HTTPBinManagerOperation: NSOperation

@property HTTPClient * httpClient;

@property (weak, nonatomic) id <HTTPProcessDelegate> delegate;

@end
