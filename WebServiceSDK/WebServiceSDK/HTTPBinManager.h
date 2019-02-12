//
//  HTTPBinManager.h
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/11.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import "HTTPBinManagerOperation.h"

@class HTTPBinManager;

@protocol HTTPProcessDelegate <NSObject>

- (void)didSucceed: (HTTPBinManager *)httpManager withStatus: (int)number;

- (void)didFail: (HTTPBinManager *)httpManager;

@end

@interface HTTPBinManager: NSObject <HTTPOperationProcessDelegate>

@property HTTPBinManagerOperation * httpOperation;

@property NSOperationQueue * queue;

@property (weak, nonatomic) id <HTTPProcessDelegate> delegate;

+ (instancetype)sharedInstance;

- (void)executeOperation;

@end
