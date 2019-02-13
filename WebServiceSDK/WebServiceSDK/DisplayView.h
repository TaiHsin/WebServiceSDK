//
//  DisplayView.h
//  WebServiceSDK
//
//  Created by Tsihsin Lee on 2019/2/13.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayView: UIView

@property (nonatomic, strong) UILabel * processLabel;
@property (nonatomic, strong) UIButton * executeButton;
@property (nonatomic, strong) UIImageView * pigView;
@property (nonatomic, strong) UIView * statusView;
@property (nonatomic, strong) UIView * statusContentView;
@property (nonatomic, strong) NSLayoutConstraint * statusWidthConstraint;

- (void)resetUIElements;

@end
