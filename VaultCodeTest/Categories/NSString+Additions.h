//
//  NSString+Additions.h
//  VaultCodeTest
//
//  Created by Aaron Crabtree on 4/16/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)

- (NSString *)reverse;
- (NSString *)copyAndReverse;
- (NSString *)reverseByEnumerating;

@end
