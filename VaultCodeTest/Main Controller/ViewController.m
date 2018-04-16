//
//  ViewController.m
//  VaultCodeTest
//
//  Created by B H on 4/3/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Additions.h"

@interface ViewController ()

@end

@implementation ViewController





#pragma mark - UIViewController Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

}





#pragma mark - IBActions
- (IBAction)reverseSourceString:(id)sender {
    
    // Reverse string in sourceTextField and assign to textDest here
    
    // Test if sourceTextField text has a value
    if (!self.sourceTextField.hasText) {
        // TODO: disable 'Reverse String' button if the textField's text property is empty
        // TODO: test if textField's text is whitespace ... if so return
        return;
    }
    
    // Reverse the string and set the destinationTextField text property
    NSString *reverseString = [self.sourceTextField.text copyAndReverse];
    self.destinationTextField.text = reverseString;
    
}



@end
