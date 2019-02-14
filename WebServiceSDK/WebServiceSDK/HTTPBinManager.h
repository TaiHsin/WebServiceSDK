//
//  HTTPBinManager.h
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/11.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import "HTTPBinManagerOperation.h"

@class HTTPBinManager;

@protocol ManagerDelegate <NSObject>

- (void)manager: (HTTPBinManager *)httpManager didSucceedWithStatus: (NSString *)percent;
- (void)manager: (HTTPBinManager *)httpManager didFailWithError: (NSError *)error;
- (void)manager: (HTTPBinManager *)httpManager didSucceedWithFirstDict: (NSDictionary *)firstDict withSecondDict: (NSDictionary *)secondDict withImage: (UIImage *)image;

@end

@interface HTTPBinManager: NSObject <OperationDelegate>

@property (nonatomic, strong) NSOperationQueue * queue;
@property (weak, nonatomic) id <ManagerDelegate> delegate;

+ (instancetype)sharedInstance;
- (void)executeOperation;

@end
