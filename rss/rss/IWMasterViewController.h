//
//  IWMasterViewController.h
//  rss
//
//  Created by Виталий Давыдов on 08.07.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IWMasterViewController : UITableViewController <NSXMLParserDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSString *adress;

@end
