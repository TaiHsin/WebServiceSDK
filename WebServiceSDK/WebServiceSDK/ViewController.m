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
    [self fetchImage];
    [self postCustomerName: @"kkbox"];
}

- (void) addImageView: (UIImage *)image {
    
    UIImageView * pigView = [UIImageView new];
    pigView.translatesAutoresizingMaskIntoConstraints = NO;
    pigView.backgroundColor = [UIColor blueColor];
    pigView.image = image;
    [self.view addSubview: pigView];
    
    [pigView addConstraint: [NSLayoutConstraint constraintWithItem: pigView
                                                         attribute: NSLayoutAttributeHeight
                                                         relatedBy: NSLayoutRelationEqual
                                                            toItem: nil
                                                         attribute: 0
                                                        multiplier: 1
                                                          constant: 100]
     ];
    
    [pigView addConstraint: [NSLayoutConstraint constraintWithItem: pigView
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy: NSLayoutRelationEqual
                                                            toItem: nil
                                                         attribute: 0
                                                        multiplier: 1
                                                          constant: 100]
     ];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: pigView
                                                           attribute: NSLayoutAttributeCenterY
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute:NSLayoutAttributeCenterY
                                                          multiplier: 0.5
                                                            constant: 0]
     ];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: pigView
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute: NSLayoutAttributeCenterX
                                                          multiplier: 1 constant: 0]
     ];
}

- (void) fetchData {
    
    [self.httpClient fetchGetResponseWithCallback: ^(NSDictionary * dict, NSError * error)
     {
         if (error == NULL) {
             NSLog(@"%@", dict);
             
         } else {
             NSLog(@"%@",error.localizedDescription);
         }
     }];
}

- (void) fetchImage {
    
    //    __weak typeof(self) weakSelf;
    [self.httpClient fetchImageWithCallback: ^(UIImage * image, NSError * error) {
        if (error == NULL) {
            [self addImageView: image];
            
        } else {
            NSLog(@"%@",error.localizedDescription);
        }
    }];
}

- (void) postCustomerName: (NSString *)name {
    
    [self.httpClient postCustomerName: name callback: ^(NSDictionary * dict, NSError * error) {
        if (error == NULL) {
            NSString * custName = dict[@"form"];
            NSLog(@"%@", custName);
            
        } else {
            NSLog(@"%@",error.localizedDescription);
        }
    }];
}

@end
