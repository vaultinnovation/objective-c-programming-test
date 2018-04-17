//
//  ViewController.m
//  VaultCodeTest
//
//  Created by B H on 4/3/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFImageDownloader.h>

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)processString:(id)sender {
    // Reverse string in textSrc and assign to textDest here
    
    NSMutableString *textReversedString = [[NSMutableString alloc] init];
    
    [[_textSrc text] enumerateSubstringsInRange:NSMakeRange(0,[[_textSrc text] length])
                                       options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                                    usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                        [textReversedString appendString:substring];
    }];
    
    [_textDest setText:textReversedString];
}

- (IBAction)loadImageAction:(id)sender {
    
    AFImageDownloader* imageDownloader = [[AFImageDownloader alloc] init];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: @"https://thecatapi.com/api/images/get?format=src&type=png"]];
    
    [imageDownloader downloadImageForURLRequest:request success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
        NSLog(@"Success: Image downloaded.");
        CGRect lastFrame = [_loadImageButton frame];
        CGRect viewFrame = [[self view] frame];
        CGFloat offset = lastFrame.size.height;
        CGRect imageFrame = CGRectMake(viewFrame.origin.x, lastFrame.origin.y + offset, viewFrame.size.width, viewFrame.size.height - lastFrame.origin.y - offset);
        [_imageView setFrame: imageFrame];
        [_imageView setImage: responseObject];
        
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        NSLog(@"Failed to download image.");
    }];
}
@end
