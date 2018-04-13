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
@property ViewController *vcTest;
@end

@implementation VaultCodeTestTests

- (void)setUp {
    [super setUp];
    _vcTest = [[ViewController alloc] init];
}

- (void)tearDown {
    _vcTest = nil;
    [super tearDown];
}

- (void)testReverseString {
    NSString *src = @"abc123";
    NSString *result = @"321cba";
    
    NSString *test = [_vcTest reverseString:src];   // Assign result of string reversal function here
    
    XCTAssertTrue([result isEqualToString:test]);
}

@end
