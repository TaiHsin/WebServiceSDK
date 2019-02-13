//
//  ViewController.h
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/1/31.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTPClient.h"
#import "HTTPBinManager.h"
#import "DisplayView.h"

@interface ViewController: UIViewController <ManagerDelegate>

@property (nonatomic, strong) HTTPClient * httpClient;
@property (nonatomic, strong) HTTPBinManager * httpManager;
@property (nonatomic, strong) DisplayView * displayView;

@end

