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
    
//    self.httpClient = [[HTTPClient alloc] init];
    self.httpManager = [HTTPBinManager new];
    self.httpManager.delegate = self;

    [self setupUIElements];
//    [self fetchData];
//    [self fetchImage];
//    [self postCustomerName: @"kkbox"];
}

- (void)setupUIElements {
    
    [self addImageView];
    [self addExecuteButton];
    [self addProcessLabel];
}

- (void)addImageView {
    
    self.pigView = [UIImageView new];
    self.pigView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.pigView setBackgroundColor: [UIColor grayColor]];
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
                                                                     constant: 50]
     ];
    [self.executeButton addConstraint: [NSLayoutConstraint constraintWithItem: self.executeButton
                                                                    attribute: NSLayoutAttributeWidth
                                                                    relatedBy: NSLayoutRelationEqual
                                                                       toItem: nil
                                                                    attribute: 0
                                                                   multiplier: 1
                                                                     constant: 200]
     ];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.executeButton
                                                           attribute: NSLayoutAttributeCenterY
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute:NSLayoutAttributeCenterY
                                                          multiplier: 1.75
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
    [self.processLabel setText: @"0 %"];
    [self.view addSubview: self.processLabel];
    
    [self.processLabel addConstraint: [NSLayoutConstraint constraintWithItem: self.processLabel
                                                               attribute: NSLayoutAttributeHeight
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: 0
                                                              multiplier: 1
                                                                constant: 50]
     ];
    
    [self.processLabel addConstraint: [NSLayoutConstraint constraintWithItem: self.processLabel
                                                               attribute: NSLayoutAttributeWidth
                                                               relatedBy: NSLayoutRelationEqual
                                                                  toItem: nil
                                                               attribute: 0
                                                              multiplier: 1
                                                                constant: 50]
     ];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.processLabel
                                                           attribute: NSLayoutAttributeBottom
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.executeButton
                                                           attribute: NSLayoutAttributeTop
                                                          multiplier: 1
                                                            constant: 10]
     ];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: self.processLabel
                                                           attribute: NSLayoutAttributeCenterX
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.executeButton
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier: 1
                                                            constant: 0]
     ];
}

- (void)executeOperation: (UIButton *)sender {
    
    NSLog(@"Button Pressed!");
    [self.httpManager executeOperation];
}

- (void)fetchData {
    
    [self.httpClient fetchGetResponseWithCallback: ^(NSDictionary * dict, NSError * error)
     {
         if (error == nil) {
             NSLog(@"%@", dict);
             
         } else {
             NSLog(@"%@",error.localizedDescription);
         }
     }];
}

- (void)fetchImage {
    
    __weak typeof(self) weakSelf = self;
    [self.httpClient fetchImageWithCallback: ^(UIImage * image, NSError * error) {
        if (error == nil) {
            [weakSelf.pigView setImage: image];
            
        } else {
            NSLog(@"%@",error.localizedDescription);
        }
    }];
}

- (void)postCustomerName: (NSString *)name {
    
    [self.httpClient postCustomerName: name callback: ^(NSDictionary * dict, NSError * error) {
        if (error == nil) {
            NSString * custName = dict[@"form"];
            NSLog(@"%@", custName);
            
        } else {
            NSLog(@"%@",error.localizedDescription);
        }
    }];
}

- (void)didFail:(HTTPBinManager *)httpManager {
    
    // TODO: reset process bar
}

- (void)didSucceed:(HTTPBinManager *)httpManager withStatus:(int)number {
    
    switch (number) {
        case 1:
            self.processLabel.text = @"33 %";
            break;
            
        case 2:
            self.processLabel.text = @"66 %";
            break;
            
        case 3:
            self.processLabel.text = @"100 %";
            break;
            
        default:
            break;
    }
    // TODO:
    // 1. update process bar
    // 2. pass and show data
}

@end
