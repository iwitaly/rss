//
//  IWMasterViewController.m
//  rss
//
//  Created by Виталий Давыдов on 08.07.13.
//  Copyright (c) 2013 Виталий Давыдов. All rights reserved.
//

#import "IWMasterViewController.h"

#import "IWDetailViewController.h"

@interface IWMasterViewController () {
    NSMutableArray *_objects;
    
    NSXMLParser *parser;
    NSMutableString *title;
    NSMutableString *link;
    NSString *element;
    
}
@end

@implementation IWMasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //make users input
    
    _objects = [[NSMutableArray alloc] init];
    
    NSURL *url = [NSURL URLWithString:self.adress];
    parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    [parser setShouldResolveExternalEntities:NO];
    parser.delegate = self;
    
    if ([parser parse]) {
//        NSLog(@"success parse");
    }
    else {
//        NSLog(@"shit happends");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    id object = _objects[indexPath.row];
    cell.textLabel.text = [object objectForKey: @"title"];
//    cell.textLabel.text = [object description];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        NSString *string = [_objects[indexPath.row] objectForKey: @"link"];
        
        NSLog(@"link in master view: %@", string);
        
        [[segue destinationViewController] setUrl:string];
    }
}

#pragma mark parser delegation
- (void)parserDidStartDocument:(NSXMLParser *)parser {
//    NSLog(@"star parsing");
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    
    element = elementName;
    
//    NSLog(@"%@", elementName);
    
    if ([elementName isEqual: @"item"]) {
        
        title   = [[NSMutableString alloc] init];
        link    = [[NSMutableString alloc] init];
    }
}
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    if ([element isEqualToString:@"title"]) {
        [title appendString:string];
//        NSLog(@"%@", string);
    }
    else {
        if([element isEqualToString:@"link"]) {
            if (![string isEqualToString:@""]) {
                [link appendString:string];
//                NSLog(@"%@", string);
            }
        }
    }
}
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"item"]) {
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:title, link, nil] forKeys:
                              [NSArray arrayWithObjects:@"title", @"link", nil]];
        
//        NSLog(@"%@", [dict objectForKey:@"link"]);
        
        [_objects addObject:dict];
    }
}
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    [self.tableView reloadData]; //update tableView
}


@end
