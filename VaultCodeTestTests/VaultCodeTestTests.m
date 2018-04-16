//
//  VaultCodeTestTests.m
//  VaultCodeTestTests
//
//  Created by B H on 4/3/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+Additions.h"

@interface VaultCodeTestTests : XCTestCase

@end

@implementation VaultCodeTestTests

// Original test
- (void)testReverseString {
    
    NSString *sourceString = @"abc123";
    NSString *resultString = @"321cba";
    NSString *test = [sourceString reverse]; // Assign result of string reversal function here
    XCTAssertTrue([resultString isEqualToString:test]);
}

// Added additional test for other string reversal method
- (void)testCopyAndReverseString {
    
    NSString *sourceString = @"abc123";
    NSString *resultString = @"321cba";
    NSString *reversedString = [sourceString copyAndReverse]; // Assign result of string reversal function here
    XCTAssertEqualObjects(reversedString, resultString);
}

// Added additional test for other string reversal method
- (void)testReverseByEnumeratingString {
    
    NSString *sourceString = @"abc123";
    NSString *resultString = @"321cba";
    NSString *reversedString = [sourceString reverseByEnumerating]; // Assign result of string reversal function here
    XCTAssertEqualObjects(reversedString, resultString);
    
}
@end
