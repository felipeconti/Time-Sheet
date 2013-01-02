//
//  SemTableViewController.m
//  TimeSheet
//
//  Created by Felipe Bonvicini Conti on 28/12/12.
//  Copyright (c) 2012 Felipe Bonvicini Conti. All rights reserved.
//

#import "SemTableViewController.h"
#import "API_TIMESHEET.h"
#import "API_TIMESHEET.h"

@interface SemTableViewController (){
    NSArray *TSs;
}
- (void)fetchData;
- (void)RefreshData;
- (NSString*)Get_TS:(NSString*)cUser pass:(NSString*)cPass;
@end

@implementation SemTableViewController

#pragma mark - FetchData

- (void)fetchData{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];

    NSLog(@"%@", [self Get_TS:@"fbc" pass:@"123"]);
    
    [self.tableView reloadData];
    
    [self.refreshControl endRefreshing];
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (NSString*)Get_TS:(NSString*)cUser pass:(NSString*)cPass{
    
    API_TIMESHEETSOAPBinding *binding = [API_TIMESHEET API_TIMESHEETSOAPBinding];
    API_TIMESHEETSOAPBindingResponse *response;
    
    API_TIMESHEET_GET_TS *request = [[API_TIMESHEET_GET_TS alloc]init];
    
    request.CUSER = cUser;
    request.CPASS = cPass;
    
    response = [binding GET_TSUsingParameters:request];
    
    id bodyPart;
    @try{
        bodyPart = [response.bodyParts objectAtIndex:0]; // Assuming just 1 part in response which is fine
    }
    @catch (NSException* exception)
    {
        return @"Error while trying to process request";
    }
    
    if ([bodyPart isKindOfClass:[SOAPFault class]]) {
        
        NSString* errorMesg = ((SOAPFault *)bodyPart).simpleFaultString;
        return [@"Server Error: " stringByAppendingString:errorMesg];
    }
    else if([bodyPart isKindOfClass:[API_TIMESHEET_GET_TSRESPONSE class]]) {
        API_TIMESHEET_GET_TSRESPONSE* rateResponse = bodyPart;
        return rateResponse.GET_TSRESULT;
    }

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
