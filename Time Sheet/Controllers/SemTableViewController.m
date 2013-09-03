//
//  SemTableViewController.m
//  TimeSheet
//
//  Created by Felipe Bonvicini Conti on 28/12/12.
//  Copyright (c) 2012 Felipe Bonvicini Conti. All rights reserved.
//

#import "DiaViewController.h"
#import "SemTableViewController.h"
#import "DetailTSViewController.h"
#import "TS.h"
#import "TSParser.h"
#import "AFJSONRequestOperation.h"
#import "AFHTTPClient.h"

@interface SemTableViewController (){
    NSArray *TSs;
}
- (void)fetchData;
- (void)RefreshData;
@end

@implementation SemTableViewController

#pragma mark - FetchData

- (void)fetchData
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    TSs = @[];
    [self.tableView reloadData];

    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"http://%@/", self.server.text] ];
    
    AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    [httpClient setParameterEncoding:AFJSONParameterEncoding];

    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST"
                                                            path:@"/sisjuri/get_sync?client_key=123456789"
                                                      parameters:@{@"USER":@"RCR",
                                                                   @"PASS":@"BCS",
                                                                   @"TABLE":@"RCR.TIME_SHEET",
                                                                   @"DATE_CREATE":@"20130829",
                                                                   @"AMOUNT":@"2"
                                                                   }];

    [request setTimeoutInterval:10];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON)
    {
        TSs = [TSParser parserObject:JSON];
        [self.tableView reloadData];

    }
    failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON)
    {
        NSLog(@"ERRO na conexão = %@", [error description]);
        [[[UIAlertView alloc] initWithTitle:@"No connect" message:@"Connection not established" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }
    ];

    [self.refreshControl endRefreshing];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

    [operation start];
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
    
    TS *Ts = [TSs objectAtIndex:indexPath.row];

    //cell.detailTextLabel.text = Ts.cod;
    //cell.textLabel.text = Ts.complemento;
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cód: %@", Ts.cod];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"UTs: %@", Ts.ut];

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

#pragma mark - UIStoryBoardSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
        DetailTSViewController *detailTsViewController = (DetailTSViewController *)segue.destinationViewController;

        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];

        TS *ts = [TSs objectAtIndex:indexPath.row];
        detailTsViewController.ts = ts;

    }
}

- (void)RefreshData {
    //[self performSelector:@selector(fetchData) withObject:nil afterDelay:100];
    [self performSelector:@selector(fetchData)];
}

- (IBAction)insertTS:(id)sender {
    
}

- (IBAction)buttonRefresh:(id)sender {
    [self RefreshData];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self RefreshData];
    [textField resignFirstResponder];
    return TRUE;
}

@end
