//
//  DisplayView.m
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/13.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DisplayView.h"

@implementation DisplayView

- (instancetype)initWithFrame: (CGRect)frame {
    
    self = [super initWithFrame: frame];
    
    if (self) {
        [self setupUIElements];
    }
    return self;
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
    [self addSubview: self.pigView];
    
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
    
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.pigView
                                                           attribute: NSLayoutAttributeCenterY
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self
                                                           attribute:NSLayoutAttributeCenterY
                                                          multiplier: 0.5
                                                            constant: 0]
     ];
    
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.pigView
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self
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
    [self.executeButton setTitle: @" " forState: UIControlStateHighlighted];
    [[self.executeButton layer] setCornerRadius: 5];
    [[self.executeButton layer] setShadowColor: [UIColor blueColor].CGColor];
    [[self.executeButton layer] setShadowOffset: CGSizeMake(0, 5)];
    [[self.executeButton layer] setShadowOpacity: 0.5];
    [self addSubview: self.executeButton];
    
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
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.executeButton
                                                           attribute: NSLayoutAttributeCenterY
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self
                                                           attribute: NSLayoutAttributeCenterY
                                                          multiplier: 1.5
                                                            constant: 0]
     ];
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.executeButton
                                                           attribute: NSLayoutAttributeCenterX
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self
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
    [self addSubview: self.processLabel];
    
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
    
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.processLabel
                                                           attribute: NSLayoutAttributeBottom
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.statusView
                                                           attribute: NSLayoutAttributeTop
                                                          multiplier: 1
                                                            constant: 0]
     ];
    
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.processLabel
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
    [self addSubview: self.statusView];
    
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
    
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.statusView
                                                           attribute: NSLayoutAttributeBottom
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.executeButton
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier: 1
                                                            constant: -10]
     ];
    
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.statusView
                                                           attribute: NSLayoutAttributeCenterX
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier: 1
                                                            constant: 0]
     ];
}

- (void)addStatusContentView {
    
    self.statusContentView = [UIView new];
    [self.statusContentView setTranslatesAutoresizingMaskIntoConstraints: NO];
    [self.statusContentView setBackgroundColor: [UIColor blueColor]];
    [self addSubview: self.statusContentView];
    
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
    [self addConstraint: self.statusWidthConstraint];
    
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.statusContentView
                                                           attribute: NSLayoutAttributeCenterY
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.statusView
                                                           attribute: NSLayoutAttributeCenterY
                                                          multiplier: 1
                                                            constant: 0]
     ];
    
    [self addConstraint: [NSLayoutConstraint constraintWithItem: self.statusContentView
                                                           attribute: NSLayoutAttributeLeft
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: self.statusView
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier: 1
                                                            constant: 0]
     ];
}

- (void)resetUIElements {
    
    self.processLabel.text = @"0";
    self.pigView.image = nil;
    self.statusWidthConstraint.constant = 0;
    [self layoutIfNeeded];
}

@end

