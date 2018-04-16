//
//  NSString+Additions.m
//  VaultCodeTest
//
//  Created by Aaron Crabtree on 4/16/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)


- (NSString *)reverse {
    
    // if string has one character return original string
    NSUInteger length = self.length;
    if (length < 2) {
        return self;
    }
    
    // create a mutable string the size of the original string
    NSMutableString *reversedString = [[NSMutableString alloc] initWithCapacity: length];
    for (NSUInteger i = length; i > 0; i--) {
        NSUInteger index = i - 1;
        NSRange range = NSMakeRange(index, 1);
        NSString *substring = [self substringWithRange: range];
        [reversedString appendString: substring];
    }
    
    return reversedString;

}

- (NSString *)copyAndReverse {
    
    // create a copy of the string
    
    // if the string has one character return a copy of the original string
    
    // create a mutable string the size of the original string
    
    // loop over the range of the string and create a new string that is reversed
    
    
    return nil;
}

- (NSString *)reverseByEnumerating {
    
    // if string has one character return original string
    
    // create a mutable string the size of the original string
    
    // enumerate the string and create a new string that is reversed
    
    return nil;
}

@end
