//
//  DetailTSViewController.m
//  Time Sheet
//
//  Created by Felipe Bonvicini Conti on 03/09/13.
//  Copyright (c) 2013 Felipe Bonvicini Conti. All rights reserved.
//

#import "DetailTSViewController.h"

@interface DetailTSViewController ()

@end

@implementation DetailTSViewController

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
    self.cod.text = self.ts.cod;
    self.advogado.text = self.ts.advogado;
    self.data.text = self.ts.data;
    self.ut.text = self.ts.ut;
    self.complemento.text = self.ts.complemento;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
