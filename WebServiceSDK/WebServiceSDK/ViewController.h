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

@interface ViewController : UIViewController <HTTPProcessDelegate>

@property HTTPClient * httpClient;
@property HTTPBinManager * httpManager;
@property UILabel * processLabel;
@property UIButton * executeButton;
@property UIImageView * pigView;

@end

