//
//  HTTPBinManagerOperation.m
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/11.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPBinManagerOperation.h"

@implementation HTTPBinManagerOperation

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.httpClient = [[HTTPClient alloc] init];
    }
    return self;
}

- (void)main {
    [super main];
    
//    [self.httpClient fetchGetResponseWithCallback: ^(NSDictionary *, NSError *) {
//        <#code#>
//    }]
}

@end
