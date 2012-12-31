//
//  SemTableViewController.m
//  TimeSheet
//
//  Created by Felipe Bonvicini Conti on 28/12/12.
//  Copyright (c) 2012 Felipe Bonvicini Conti. All rights reserved.
//

#import "SemTableViewController.h"
#import "API_TIMESHEET.h"

@interface SemTableViewController (){
    NSArray *TSs;
}
- (void)fetchData;
- (NSString *) montaXML:(NSString*)tipo Data:(NSString*)data;
- (void)RefreshData;
@end

@implementation SemTableViewController

#pragma mark - FetchData

- (void)fetchData{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    NSString *cXML = [NSString stringWithFormat:@"%@", [self montaXML:@"1" Data:@"31/12/12"]];

    API_TIMESHEET *Call = [[API_TIMESHEET alloc] init];
    //TSs = [Call run:cXML];
    [Call run:cXML];

    [self.tableView reloadData];
    
    [self.refreshControl endRefreshing];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

#pragma mark - montaXML

- (NSString *) montaXML:(NSString*)tipo Data:(NSString*)data{

    NSMutableString* s = [NSMutableString string];
	[s appendString: @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"];
	[s appendString: @"<response>"];
    
	[s appendFormat: @"<tipo>%@</tipo>", tipo];
	[s appendFormat: @"<data>%@</data>", data];

	[s appendString: @"</response>"];

    return s;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    TSs = @[@"Oi",@"Oii",@"Oiii"];
    [self fetchData];
    [super viewDidLoad];

    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    //refreshControl.tintColor = [UIColormagentaColor];
    [refreshControl addTarget:self action:@selector(RefreshData) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return TSs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.detailTextLabel.text = [TSs objectAtIndex:indexPath.row];
    cell.textLabel.text = [TSs objectAtIndex:indexPath.row];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (void)RefreshData {
    [self performSelector:@selector(fetchData) withObject:nil afterDelay:0];
}

@end
