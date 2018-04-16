//
//  ViewController.h
//  VaultCodeTest
//
//  Created by B H on 4/3/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


- (IBAction)processString:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textSrc;
@property (weak, nonatomic) IBOutlet UITextField *textDest;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

