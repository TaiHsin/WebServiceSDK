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
    
    self.httpManager = [HTTPBinManager new];
    self.httpManager.delegate = self;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    [self addDataDisplayView: screenRect];
}

- (void)addDataDisplayView: (CGRect) rect {

    self.displayView = [[DisplayView alloc] initWithFrame: rect];
    [self.view addSubview: self.displayView];
    
    [self.displayView.executeButton addTarget: self
                                       action: @selector(executeOperation:)
                             forControlEvents: UIControlEventTouchUpInside];
}

- (void)executeOperation: (UIButton *)sender {

    [self.displayView resetUIElements];
    [self.httpManager executeOperation];
}

#pragma HTTPProcessDelegate

- (void)manager:(HTTPBinManager *)httpManager didFailWithError:(NSError *)error {

    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (ino64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        
        // Pass whole NSError object instead of description in error.userInfo
        self.displayView.processLabel.text = error.userInfo[NSLocalizedDescriptionKey];
    });
}

- (void)manager: (HTTPBinManager *)httpManager didSucceedWithStatus: (NSString *)percent {
    
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (ino64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        self.displayView.processLabel.text = percent;
    });
    
    int intPercent = [percent intValue];
    self.displayView.statusWidthConstraint.constant = intPercent * 200 / 100 ;
    [UIView animateWithDuration: 0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)manager: (HTTPBinManager *)httpManager didSucceedWithFirstDict: (NSDictionary *)firstDict withSecondDict: (NSDictionary *)secondDict withImage: (UIImage *)image {
    
    NSLog(@"%@",firstDict);
    NSLog(@"%@",secondDict);

    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (ino64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        self.displayView.pigView.image = image;
    });
}

@end

