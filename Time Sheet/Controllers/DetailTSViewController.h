//
//  DetailTSViewController.h
//  Time Sheet
//
//  Created by Felipe Bonvicini Conti on 03/09/13.
//  Copyright (c) 2013 Felipe Bonvicini Conti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TS.h"

@interface DetailTSViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *cod;
@property (weak, nonatomic) IBOutlet UITextField *advogado;
@property (weak, nonatomic) IBOutlet UITextField *data;
@property (weak, nonatomic) IBOutlet UITextField *ut;
@property (weak, nonatomic) IBOutlet UITextView *complemento;
@property (strong) TS *ts;

@end
