//
//  ViewController.m
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/1/31.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.httpClient = [[HTTPClient alloc] init];
    
    [self fetchData];
}

- (void) fetchData {
    
    [self.httpClient fetchGetResponseWithCallback:^(NSDictionary * dict, NSError * error) {
        if (error == NULL) {
            NSLog(@"%@", dict);
        } else {
            NSLog(@"%@",error.localizedDescription);
        }
    }];
}


@end
