//
//  MesViewController.m
//  TimeSheet
//
//  Created by Felipe Bonvicini Conti on 27/12/12.
//  Copyright (c) 2012 Felipe Bonvicini Conti. All rights reserved.
//

#import "MesViewController.h"

@interface MesViewController ()

@end

@implementation MesViewController

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
    KalViewController *calendar = [[KalViewController alloc] init];
    calendar.title = @"Time Sheet";
//    [self.navigationController addChildViewController:calendar];
    [self.navigationController setViewControllers:@[calendar] animated:NO];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
