//
//  VaultCodeTestUITests.m
//  VaultCodeTestUITests
//
//  Created by B H on 4/3/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface VaultCodeTestUITests : XCTestCase
@property XCUIApplication *app;
@end

@implementation VaultCodeTestUITests

- (void)setUp {
    [super setUp];
    
    self.continueAfterFailure = NO;

    self.app = [[XCUIApplication alloc] init];
    [self.app launch];
}

- (void)tearDown {
    [super tearDown];
}

- (void)testReverseString {
    [[self.app.textFields elementBoundByIndex:0] tap];
    [[self.app.textFields elementBoundByIndex:0] typeText:@"abc"];
    [[self.app.buttons elementBoundByIndex:0] tap];
    XCTAssertTrue([@"cba" isEqualToString:[[self.app.textFields elementBoundByIndex:1] value]]);

}

- (void)testLoadImageButton {
    [[self.app.buttons elementBoundByIndex:1] tap];
    XCTAssertTrue([[self.app.images element] exists]);
}

@end
