//
//  WebViewController.m
//  TestAssessment
//
//  Created by Sherrie Jones on 3/13/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>

@property NSURL *url;
@property (strong, nonatomic) UIActivityIndicatorView *spinner;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView.delegate = self;

    if ([self.navigationItem.title  isEqual: @"Answer"]) {
        [self.navigationItem.title isEqual:self.totalValue];
    } else {
        [self.navigationItem.title isEqual: @"Answer"];
    }

    [self goToURLString:@"http://www.mobilemakers.co"];

}


# pragma mark - UIWebView

// while the webView is loading show the spinner
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [self.spinner startAnimating];
}

// when the webView finishes loading hide the spinner
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [self.spinner stopAnimating];
}


- (void)goToURLString:(NSString *)string {
    NSString *urlString = string;

    if ([urlString hasPrefix:@"http://"]) {
        self.url = [NSURL URLWithString:urlString];
    } else {
        self.url = [NSURL URLWithString:[NSString stringWithFormat:@"http://%@", urlString]];
    }

    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [self.webView loadRequest:request];
}





@end
