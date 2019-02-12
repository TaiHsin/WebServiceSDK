//
//  WebServiceSDKTests.m
//  WebServiceSDKTests
//
//  Created by Tsihsin Lee on 2019/1/31.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HTTPClient.h"

@interface HTTPClient (ForTesting)

- (void)getData: (NSString *)dataUrl callback: (void(^)(NSData *, NSError *))callback;

@end

@interface WebServiceSDKTests : XCTestCase

@end

@implementation WebServiceSDKTests

- (void)testGetDataSucceed {
    
    HTTPClient * httpClient = [HTTPClient new];
    XCTestExpectation * expecatation = [self expectationWithDescription: @"Query failed!"];
    NSString * dataUrl = @"https://httpbin.org/get";
    
    [httpClient getData: dataUrl callback: ^(NSData * data, NSError * error) {
        
        if (data != nil) {
            [expecatation fulfill];
        }
    }];
    
    [self waitForExpectationsWithTimeout: 2 handler: nil];
}

- (void)testGetDataFailed {
    
    HTTPClient * httpClient = [HTTPClient new];
    XCTestExpectation * expecatation = [self expectationWithDescription: @"Query failed!"];
    NSString * dataUrl = @"https://httpbin.org/gets";
    
    [httpClient getData: dataUrl callback: ^(NSData * data, NSError * error) {
        
        if (error != nil) {
            [expecatation fulfill];
        }
    }];
    
    [self waitForExpectationsWithTimeout: 2 handler: nil];
}

- (void)testFetchGetResponseWithCallbackSucceed {
    
    HTTPClient * httpClient = [HTTPClient new];
    XCTestExpectation * expecatation = [self expectationWithDescription: @"Query failed!"];
    NSString * url = @"https://httpbin.org/get";
    
    __block NSString * urlToCheck = [NSString new];
    [httpClient fetchGetResponseWithCallback: ^(NSDictionary * dict, NSError * error) {
        
        if (error == nil) {
            urlToCheck = dict[@"url"];
            [expecatation fulfill];
            
        } else {
            XCTFail(@"Response data failed");
        }
    }];
    
    [self waitForExpectationsWithTimeout: 2 handler: nil];
    XCTAssertTrue([url isEqualToString: urlToCheck]);
}

- (void)testFetchImageWithCallbackSucceed {
    
    HTTPClient * httpClient = [HTTPClient new];
    XCTestExpectation * expecatation = [self expectationWithDescription: @"Query failed!"];
    
    __block UIImage * imageHolder = [UIImage new];
    [httpClient fetchImageWithCallback: ^(UIImage * image, NSError * error) {
        
        if (error == nil) {
            imageHolder = image;
            [expecatation fulfill];
            
        } else {
            XCTFail(@"Response data failed");
        }
    }];
    
    [self waitForExpectationsWithTimeout: 2 handler: nil];
    XCTAssertTrue(imageHolder != nil);
}

- (void)testPostCustomerNameSucceed {
    
    HTTPClient * httpClient = [HTTPClient new];
    XCTestExpectation * expecatation = [self expectationWithDescription: @"Query failed!"];
    NSString * name = @"KKBOXTest";
    
    __block NSString * dictString = [NSString new];
    [httpClient postCustomerName: @"KKBOXTest" callback: ^(NSDictionary * dict, NSError * error) {
        
        if (error == nil) {
            dictString = dict[@"form"][@"custname"];
            [expecatation fulfill];
            
        } else {
            XCTFail(@"Response data failed");
        }
        
    }];
    [self waitForExpectationsWithTimeout: 2 handler: nil];
    XCTAssertTrue([name isEqualToString: dictString]);
}

@end
