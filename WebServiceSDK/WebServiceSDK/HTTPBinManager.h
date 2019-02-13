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

- (void)didSucceed: (HTTPBinManager *)httpManager withStatus: (NSString *)percent;

- (void)didFail: (HTTPBinManager *)httpManager;

- (void)didPassData: (HTTPBinManager *)httpManager withFirstDict: (NSDictionary *)firstDict withSecondDict: (NSDictionary *)secondDict withImage: (UIImage *)image;

@end

@interface HTTPBinManager: NSObject <HTTPOperationProcessDelegate>

@property (nonatomic, strong) NSOperationQueue * queue;

@property (weak, nonatomic) id <HTTPProcessDelegate> delegate;

+ (instancetype)sharedInstance;

- (void)executeOperation;

@end
