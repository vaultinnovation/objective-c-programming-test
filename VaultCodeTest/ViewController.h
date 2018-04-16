//
//  ViewController.h
//  VaultCodeTest
//
//  Created by B H on 4/3/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import <AFImageDownloader.h>


@interface ViewController : UIViewController <NSXMLParserDelegate>


- (IBAction)processString:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *textSrc;
@property (weak, nonatomic) IBOutlet UITextField *textDest;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSMutableString *xmlString;
@property (nonatomic) BOOL captureCharacters;

@end

