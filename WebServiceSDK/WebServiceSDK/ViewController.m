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
    
    [self setupUIElements];
}

- (void)setupUIElements {
    
    [self addPigView];
    [self addExecuteButton];
    [self addStatusView];
    [self addStatusContentView];
    [self addProcessLabel];
}

- (void)addPigView {
    
    self.pigView = [UIImageView new];
    self.pigView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: self.pigView];
    
    [self.pigView addConstraint: [NSLayoutConstraint constraintWithItem: self.pigView
                                                         attribute: NSLayoutAttributeHeight
                                                         relatedBy: NSLayoutRelationEqual
                                                            toItem: nil
                                                         attribute: 0
                                                        multiplier: 1
                                                          constant: 100]
     ];
    
    [self.pigView addConstraint: [NSLayoutConstraint constraintWithItem: self.pigView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy: NSLayoutRelationEqual
                                                            toItem: nil
                                                         attribute: 0
                                                        multiplier: 1
                                                          constant: 100]
     ];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.pigView
                                                           attribute: NSLayoutAttributeCenterY
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute:NSLayoutAttributeCenterY
                                                          multiplier: 0.5
                                                            constant: 0]
     ];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.pigView
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute: NSLayoutAttributeCenterX
                                                          multiplier: 1
                                                            constant: 0]
     ];
}

- (void)addExecuteButton {
    
    self.executeButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.executeButton setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.executeButton setBackgroundColor: [UIColor blueColor]];
    [self.executeButton setTitle: @"EXECUTE" forState: UIControlStateNormal];
    [self.executeButton addTarget: self
                           action: @selector(executeOperation:)
                 forControlEvents: UIControlEventTouchUpInside];
    [[self.executeButton layer] setCornerRadius: 5];
    [self.view addSubview: self.executeButton];
    
    [self.executeButton addConstraint: [NSLayoutConstraint constraintWithItem: self.executeButton
                                                                    attribute: NSLayoutAttributeHeight
                                                                    relatedBy: NSLayoutRelationEqual
                                                                       toItem: nil
                                                                    attribute: 0
                                                                   multiplier: 1
                                                                     constant: 30]
     ];
    [self.executeButton addConstraint: [NSLayoutConstraint constraintWithItem: self.executeButton
                                                                    attribute: NSLayoutAttributeWidth
                                                                    relatedBy: NSLayoutRelationEqual
                                                                       toItem: nil
                                                                    attribute: 0
                                                                   multiplier: 1
                                                                     constant: 100]
     ];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.executeButton
                                                           attribute: NSLayoutAttributeCenterY
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute: NSLayoutAttributeCenterY
                                                          multiplier: 1.5
                                                            constant: 0]
     ];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.executeButton
                                                           attribute: NSLayoutAttributeCenterX
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier: 1
                                                            constant: 0]
     ];
}

- (void)addProcessLabel {
    self.processLabel = [UILabel new];
    [self.processLabel setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.processLabel setTintColor: [UIColor grayColor]];
    [self.processLabel setTextAlignment: NSTextAlignmentCenter];
    [self.processLabel setText: @"0"];
    [self.view addSubview: self.processLabel];
    
    [self.processLabel addConstraint: [NSLayoutConstraint constraintWithItem: self.processLabel
                                                               attribute: NSLayoutAttributeHeight
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: 0
                                                              multiplier: 1
                                                                constant: 30]
     ];
    
    [self.processLabel addConstraint: [NSLayoutConstraint constraintWithItem: self.processLabel
                                                               attribute: NSLayoutAttributeWidth
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: 0
                                                              multiplier: 1
                                                                constant: 150]
     ];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.processLabel
                                                           attribute: NSLayoutAttributeBottom
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.statusView
                                                           attribute: NSLayoutAttributeTop
                                                          multiplier: 1
                                                            constant: 0]
     ];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.processLabel
                                                           attribute: NSLayoutAttributeCenterX
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.statusView
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier: 1
                                                            constant: 0]
     ];
}

- (void)addStatusView {
    
    self.statusView = [UIView new];
    [self.statusView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.statusView.layer setBorderWidth: 2];
    [self.statusView.layer setBorderColor: [UIColor blueColor].CGColor];
    [self.view addSubview: self.statusView];
    
    [self.statusView addConstraint: [NSLayoutConstraint constraintWithItem: self.statusView
                                                                 attribute: NSLayoutAttributeHeight
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: nil
                                                                 attribute: 0
                                                                multiplier: 1
                                                                  constant: 20]
     ];
    
    [self.statusView addConstraint: [NSLayoutConstraint constraintWithItem: self.statusView
                                                                 attribute: NSLayoutAttributeWidth
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: nil
                                                                 attribute: 0
                                                                multiplier: 1
                                                                  constant: 150]
     ];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.statusView
                                                           attribute: NSLayoutAttributeBottom
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.executeButton
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier: 1
                                                            constant: -10]
     ];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.statusView
                                                           attribute: NSLayoutAttributeCenterX
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier: 1
                                                            constant: 0]
     ];
}

- (void)addStatusContentView {
    
    self.statusContentView = [UIView new];
    [self.statusContentView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.statusContentView setBackgroundColor: [UIColor blueColor]];
    [self.view addSubview: self.statusContentView];
    
    [self.statusContentView addConstraint: [NSLayoutConstraint constraintWithItem: self.statusContentView
                                                                 attribute: NSLayoutAttributeHeight
                                                                 relatedBy: NSLayoutRelationEqual
                                                                    toItem: nil
                                                                 attribute: 0
                                                                multiplier: 1
                                                                  constant: 20]
     ];
    
    self.statusWidthConstraint = [NSLayoutConstraint constraintWithItem: self.statusContentView
                                                              attribute: NSLayoutAttributeWidth
                                                              relatedBy: NSLayoutRelationEqual
                                                                 toItem: nil
                                                              attribute: 0
                                                             multiplier: 1
                                                               constant: 0];
    [self.view addConstraint: self.statusWidthConstraint];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.statusContentView
                                                           attribute: NSLayoutAttributeCenterY
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.statusView
                                                           attribute: NSLayoutAttributeCenterY
                                                          multiplier: 1
                                                            constant: 0]
     ];

    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.statusContentView
                                                           attribute: NSLayoutAttributeLeft
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.statusView
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier: 1
                                                            constant: 0]
     ];
}

- (void)executeOperation: (UIButton *)sender {

    self.processLabel.text = @"0";
    self.pigView.image = nil;
    self.statusWidthConstraint.constant = 0;
    [self.view layoutIfNeeded];
    
    [self.httpManager executeOperation];
}

#pragma HTTPProcessDelegate

- (void)manager:(HTTPBinManager *)httpManager didFailWithError:(NSString *)errorInfo {

    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (ino64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        self.processLabel.text = errorInfo;
    });
}

- (void)manager: (HTTPBinManager *)httpManager didSucceedWithStatus: (NSString *)percent {
    
    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (ino64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        self.processLabel.text = percent;
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        int intPercent = [percent intValue];
        self.statusWidthConstraint.constant = intPercent * 150 / 100 ;
        [UIView animateWithDuration: 0.3 animations:^{
            [self.view layoutIfNeeded];
        }];
    });
}

- (void)manager: (HTTPBinManager *)httpManager didSucceedWithFirstDict: (NSDictionary *)firstDict withSecondDict: (NSDictionary *)secondDict withImage: (UIImage *)image {
    
    NSLog(@"%@",firstDict);
    NSLog(@"%@",secondDict);

    double delayInSeconds = 0.3;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (ino64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        self.pigView.image = image;
    });
}

@end

