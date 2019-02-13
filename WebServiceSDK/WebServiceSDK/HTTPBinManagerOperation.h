//
//  HTTPBinManagerOperation.h
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/11.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import "HTTPClient.h"

@class HTTPBinManagerOperation;

@protocol OperationDelegate <NSObject>

- (void)operation: (HTTPBinManagerOperation *)httpOperation willSuccessWithStatus: (NSString *)percent;
- (void)operation: (HTTPBinManagerOperation *)httpOperation willFailWithError: (NSString *)errorInfo;
- (void)operation: (HTTPBinManagerOperation *)httpOperation willSucceedWithFirstDict: (NSDictionary *)firstDict withSecondDict: (NSDictionary *)secondDict withImage: (UIImage *)image;

@end

@interface HTTPBinManagerOperation: NSOperation

@property (nonatomic, strong) HTTPClient * httpClient;
@property (nonatomic, strong) dispatch_semaphore_t semaphore;
@property (weak, nonatomic) id <OperationDelegate> delegate;

@end
