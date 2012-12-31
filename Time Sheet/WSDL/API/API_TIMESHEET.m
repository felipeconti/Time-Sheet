/*
	API_TIMESHEETAPI_TIMESHEETExample.m
	Provides example and test runs the service's proxy methods.
	Generated by SudzC.com
*/
#import "API_TIMESHEET.h"
#import "API_TIMESHEETAPI_TIMESHEET.h"

@implementation API_TIMESHEET

- (void)run {
	// Create the service
	API_TIMESHEETAPI_TIMESHEET* service = [API_TIMESHEETAPI_TIMESHEET service];
	service.logging = YES;
	// service.username = @"username";
	// service.password = @"password";
	

	// Returns NSString*. Busca TSs
	[service GET_TS:self action:@selector(GET_TSHandler:) CXML: @""];
    
    //Retornar um NSArry com as informações!
    
}

	

// Handle the response from GET_TS.
		
- (void) GET_TSHandler: (id) value {

	// Handle errors
	if([value isKindOfClass:[NSError class]]) {
		NSLog(@"%@", value);
		return;
	}

	// Handle faults
	if([value isKindOfClass:[SoapFault class]]) {
		NSLog(@"%@", value);
		return;
	}				
			

	// Do something with the NSString* result
		NSString* result = (NSString*)value;
	NSLog(@"GET_TS returned the value: %@", result);
			
}
	

@end
		