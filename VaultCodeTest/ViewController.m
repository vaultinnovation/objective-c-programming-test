//
//  ViewController.m
//  VaultCodeTest
//
//  Created by B H on 4/3/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "AFImageDownloader.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textSrc, textDest, imageView;

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
    textDest.text = [self reverseString:textSrc.text];
}

- (IBAction)getCat {
    NSDate *now = [NSDate date];
    NSString *catImageStr = [NSString stringWithFormat:@"http://thecatapi.com/api/images/get?format=src&type=gif&timeindex=%f", now.timeIntervalSince1970]; // providing a time index ensures we get a new kitty each time the button is pressed, not one from a cached request.
    
    AFImageDownloader *downloader = [AFImageDownloader defaultInstance];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: catImageStr]];
    
    [downloader downloadImageForURLRequest:request success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
        [imageView setImage:responseObject];
        
    } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
        [self alertForCatDownloadError];
    }];
}

- (NSString *)reverseString:(NSString *)string {
    NSMutableString *reversedText = [[NSMutableString alloc] initWithCapacity:string.length];
    for (NSInteger i = string.length - 1;  i > -1;  i--) {
        [reversedText appendString:[string substringWithRange:NSMakeRange(i, 1)]];
    }
    return reversedText;
}

- (void)alertForCatDownloadError {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Problem getting kitty" message:@"Sorry, we were unable to retrieve a kitty from thecatapi.com site. Please try again in a moment." preferredStyle:UIAlertControllerStyleAlert];
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    [self presentViewController:actionSheet animated:YES completion:nil];
}

@end

