//
//  HTTPBinManager.m
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/11.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPBinManager.h"

@implementation HTTPBinManager

+ (instancetype)sharedInstance {
    
    static HTTPBinManager * instance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [[HTTPBinManager alloc] init];
    });
                    
    return instance;
}

- (void)executeOperation {
    
    NSLog(@"------------------");
    NSLog(@"EXECUTE OPERATION!");
}

@end

