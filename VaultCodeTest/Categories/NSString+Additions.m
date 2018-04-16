//
//  NSString+Additions.m
//  VaultCodeTest
//
//  Created by Aaron Crabtree on 4/16/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import "NSString+Additions.h"

@implementation NSString (Additions)


/**
 Creates a new NSString that has been reversed.
 
 If the original string is less than 2 charaters in length the original string is returned.
 
 @return Creates a new NSString from the original string with the characters in reverse order.
 */

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



/**
 Creates a new NSString that has been reversed.

 This method always returns a new copy of the original string.

 @return Creates a new NSString from the original string with the characters in reverse order.
 */

- (NSString *)copyAndReverse {
    
    // create a copy of the string
    NSString *input = [NSString stringWithString: self];
    int length = (int)input.length;
    
    // if the string has one character return a copy of the original string
    if (length < 2) {
        return input;
    }
    
    // create a mutable string the size of the original string
    NSMutableString *reversedString = [NSMutableString stringWithCapacity: length];
    for(int i = (length - 1); i >= 0; i--) {
        NSRange range = NSMakeRange(i, 1);
        NSString *substring = [input substringWithRange: range];
        [reversedString appendString: substring];
    }
    
    return reversedString;
}



/**
 Creates a new NSString that has been reversed.
 
 If the original string is less than 2 charaters in length the original string is returned.
 
 @return Creates a new NSString from the original string with the characters in reverse order.
 */

- (NSString *)reverseByEnumerating {
    
    // if string has one character return original string
    NSUInteger length = self.length;
    if (length < 2) {
        return self;
    }
    
    // create a mutable string the size of the original string
    NSMutableString *reversedString = [[NSMutableString alloc] initWithCapacity: length];
    NSRange range = NSMakeRange(0, length);
    
    // enumerate the original string and create a new string that is reversed
    [self enumerateSubstringsInRange:range
                             options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                          usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
                              [reversedString appendString:substring];
                          }];
    
    return reversedString;
}

@end
