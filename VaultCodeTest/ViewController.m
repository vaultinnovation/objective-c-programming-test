//
//  ViewController.m
//  VaultCodeTest
//
//  Created by B H on 4/3/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize textSrc, textDest, imageView;
@synthesize captureCharacters;

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
    NSString *source = textSrc.text;
    NSString *reverse = [self reverseString:source];
    [textDest setText:reverse];
}

-(NSString *) reverseString:(NSString *)string {
    NSString *reverseString = [NSString new];
    for (NSInteger i = string.length-1; i>-1; i--) {
        reverseString = [reverseString stringByAppendingFormat:@"%c", [string characterAtIndex:i]];
    }
    return reverseString;
}
- (IBAction)loadImage:(id)sender {
    //create the session configuration
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    //create the afnetworking manager
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:config];
    //complete url to download image url
    NSURL *url = [NSURL URLWithString:@"http://thecatapi.com/api/images/get?format=src&results_per_page=20"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    //download task to retrieve image url from api
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:nil destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //get the response url for image
        NSURL *imageUrl = response.URL;
        //create instance of afnetworking image downloader
        AFImageDownloader *imageDownloader = [AFImageDownloader defaultInstance];
        //create the request for the image download
        NSURLRequest *request = [NSURLRequest requestWithURL:imageUrl];
        //download the image from the url returned by thecatapi
        [imageDownloader downloadImageForURLRequest:request success:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, UIImage * _Nonnull responseObject) {
            NSLog(@"Success");
            //on success, set the responseObject to the imageview
            [imageView setImage:responseObject];
            
        } failure:^(NSURLRequest * _Nonnull request, NSHTTPURLResponse * _Nullable response, NSError * _Nonnull error) {
            NSLog(@"Error");
        }];
      
        return imageUrl;
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"Image success");
        
    }];
    [downloadTask resume];
    
}

@end
