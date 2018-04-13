//
//  ViewController.m
//  VaultCodeTest
//
//  Created by B H on 4/3/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import "ViewController.h"
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
    _textDest.text = [self reverseString:_textSrc.text];
}

- (IBAction)loadImage:(id)sender {
    [self downloadImage];
}


- (NSString *)reverseString:(NSString *)input {
    NSMutableString *reversed = [NSMutableString stringWithCapacity:[input length]];
    [input enumerateSubstringsInRange:NSMakeRange(0, input.length) options:NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        [reversed appendString:substring];
    }];
    
    return reversed;
}


- (void)downloadImage {
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://thecatapi.com/api/images/get?results_per_page=1"]];
    
    AFImageDownloader *loader = [[AFImageDownloader alloc] init];
    //AFImageDownloader *loader = [AFImageDownloader defaultInstance];
    
    [loader downloadImageForURLRequest:request success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
        _imageView.image = responseObject;
        
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        
    }];
}


@end
