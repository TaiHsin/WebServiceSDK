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

@interface ViewController: UIViewController <HTTPProcessDelegate>

@property (nonatomic, strong) HTTPClient * httpClient;

@property (nonatomic, strong) HTTPBinManager * httpManager;

@property (nonatomic, strong) UILabel * processLabel;

@property (nonatomic, strong) UIButton * executeButton;

@property (nonatomic, strong) UIImageView * pigView;

@property (nonatomic, strong) UIView * statusView;

@property (nonatomic, strong) UIView * statusContentView;

@property (nonatomic, strong) NSLayoutConstraint * statusWidthConstraint;

@end

