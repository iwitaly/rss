//
//  IWDetailViewController.m
//  rss
//
//  Created by Виталий Давыдов on 08.07.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWDetailViewController.h"

@interface IWDetailViewController ()

@end

@implementation IWDetailViewController


- (void)check {
    for (int i = 0; i < self.url.length; ++i) {
        char c = [self.url characterAtIndex:i];
        printf("%c\n", c);
        if (c == ' ' || c == '\n') {
            printf("bad\n");
        }
    }
}

- (NSString *)correctString:(NSString *)string {
    NSMutableString *correctedString = [[NSMutableString alloc] init];
    
    for (int i = 0; i < [string length]; ++i) {
        char c = [string characterAtIndex:i];
        
        if (c != ' ' && c != '\n') {
            [correctedString appendFormat:@"%c", c];
        }
    }
    
    return correctedString;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    [self check];
    
    NSString *correctedString = [self correctString:self.url];
    
    NSURL *myURL = [NSURL URLWithString:[correctedString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    
//    NSURL *urll = [NSURL URLWithString:self.url];
    
    NSLog(@"link in additional controller: %@", myURL);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    
    [self.webView loadRequest:request];
//    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
