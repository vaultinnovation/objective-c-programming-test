//
//  VaultCodeTestTests.m
//  VaultCodeTestTests
//
//  Created by B H on 4/3/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface VaultCodeTestTests : XCTestCase

@end

@implementation VaultCodeTestTests

- (void)setUp {
    [super setUp];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testReverseString {
    NSString *src = @"abc123";
    NSString *result = @"321cba";
    
    NSString *test = @"321cba"; // Assign result of string reversal function here
    
    XCTAssertTrue([result isEqualToString:test]);
}

@end
