//
//  HTTPBinManagerOperation.h
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/11.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import "HTTPClient.h"

@class HTTPBinManagerOperation;

@protocol HTTPOperationProcessDelegate <NSObject>

- (void)didRequestSucceed: (HTTPBinManagerOperation *)httpOperation withStatus: (int)number;

- (void)didRequestFail: (HTTPBinManagerOperation *)httpOperation;

@end

@interface HTTPBinManagerOperation: NSOperation

@property HTTPClient * httpClient;

@property (weak, nonatomic) id <HTTPOperationProcessDelegate> delegate;

@end
