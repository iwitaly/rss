//
//  IWDetailViewController.h
//  rss
//
//  Created by Виталий Давыдов on 08.07.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IWDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (copy, nonatomic) NSString *url;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
