//
//  SemTableViewController.h
//  TimeSheet
//
//  Created by Felipe Bonvicini Conti on 28/12/12.
//  Copyright (c) 2012 Felipe Bonvicini Conti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SemTableViewController : UITableViewController <UITableViewDataSource, UITextFieldDelegate>
- (IBAction)insertTS:(id)sender;
- (IBAction)buttonRefresh:(id)sender;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
@property (weak, nonatomic) IBOutlet UITextField *server;

@end
