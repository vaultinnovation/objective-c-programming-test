//
//  NSString+NSString_Remove.m
//  VaultCodeTest
//
//  Created by Michael Steele on 4/17/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import "NSString+Remove.h"

@implementation NSString (Remove)

-(NSString *)reverse {
    NSMutableString *textReversedString = [[NSMutableString alloc] init];
    
    [self enumerateSubstringsInRange:NSMakeRange(0,[self length])
                                        options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                                     usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                         [textReversedString appendString:substring];
                                     }];
    return textReversedString;
}
@end
