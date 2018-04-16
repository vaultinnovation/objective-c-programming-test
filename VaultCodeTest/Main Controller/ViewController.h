//
//  ViewController.h
//  VaultCodeTest
//
//  Created by B H on 4/3/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// TODO: add additional layout constraints to UI elements for different screen sizes

@property (weak, nonatomic) IBOutlet UITextField *sourceTextField;
// FIME: Should destinationTextField be a UILable instead
@property (weak, nonatomic) IBOutlet UITextField *destinationTextField;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)reverseSourceString:(id)sender;
- (IBAction)loadImage:(id)sender;

@end

