//
//  HTTPBinManager.h
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/11.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

@interface HTTPBinManager: NSObject

+ (instancetype)sharedInstance;

- (void)executeOperation;

@end
