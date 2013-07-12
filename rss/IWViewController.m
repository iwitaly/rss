//
//  IWViewController.m
//  rss
//
//  Created by Виталий Давыдов on 10.07.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWViewController.h"
#import "IWMasterViewController.h"

@interface IWViewController ()

@property NSString *usersRssLink;

@end

@implementation IWViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.usersRssLink = self.linkAdress.text;
    NSLog(@"%@", self.usersRssLink);
    
    if ([self.usersRssLink isEqualToString:@""] || self.usersRssLink == nil) {
        self.usersRssLink = @"http://news.yandex.ru/music.rss";
    }
    
    [self.view endEditing:YES];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"goButton"]) {
        if ([self.usersRssLink isEqualToString:@""] || self.usersRssLink == nil) {
            self.usersRssLink = @"http://news.yandex.ru/music.rss";
        }
        NSLog(@"%@", self.usersRssLink);
        
        [[segue destinationViewController] setAdress:self.usersRssLink];
    }
}

@end
