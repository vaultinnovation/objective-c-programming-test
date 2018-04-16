//
//  ViewController.m
//  VaultCodeTest
//
//  Created by B H on 4/3/18.
//  Copyright © 2018 Vault. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Additions.h"
@import AFNetworking;

@interface ViewController ()

- (void)loadRemoteImage;
- (void)loadImageWithSessionDataTask;

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

- (IBAction)loadImage:(id)sender {
    
    [self loadRemoteImage];
    //[self loadImageWithSessionDataTask];
    
}






#pragma mark - Networking

- (void)loadRemoteImage {
    
    // Create the url
    NSURL *url = [[NSURL alloc] initWithString:@"http://thecatapi.com/api/images/get?format=src&type=jpg"];
    
    // Create the AFImageDownloader amd request
    AFImageDownloader *downloader = [AFImageDownloader new];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    
    UIApplication.sharedApplication.networkActivityIndicatorVisible = YES;
    [downloader downloadImageForURLRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *responseObject) {
        
        self.imageView.image = responseObject;
        UIApplication.sharedApplication.networkActivityIndicatorVisible = NO;
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"Error downloading image :: %@",[error localizedDescription]);
        UIApplication.sharedApplication.networkActivityIndicatorVisible = NO;
    }];
}

- (void)loadImageWithSessionDataTask {
    
    
    // I added this method to test image loading .. just for fun
    NSURL *url = [[NSURL alloc] initWithString:@"http://thecatapi.com/api/images/get?format=src&type=jpg"];
    
    UIApplication.sharedApplication.networkActivityIndicatorVisible = YES;
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if(error != nil) {
            NSLog(@"error :: %@",[error localizedDescription]);
        }
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if([httpResponse statusCode] == 200 && data != nil) {
                UIImage *image = [[UIImage alloc] initWithData: data];
                self.imageView.image = image;
            }
            UIApplication.sharedApplication.networkActivityIndicatorVisible = NO;
           
        });
        
    }];
    
    [task resume];
    
}


@end
