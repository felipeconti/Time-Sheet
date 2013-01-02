#import <Foundation/Foundation.h>
#import "USAdditions.h"
#import <libxml/tree.h>
#import "USGlobals.h"
@class API_TIMESHEET_GET_TS;
@class API_TIMESHEET_GET_TSRESPONSE;
@interface API_TIMESHEET_GET_TS : NSObject {
	
/* elements */
	NSString * CXML;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (API_TIMESHEET_GET_TS *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * CXML;
/* attributes */
- (NSDictionary *)attributes;
@end
@interface API_TIMESHEET_GET_TSRESPONSE : NSObject {
	
/* elements */
	NSString * GET_TSRESULT;
/* attributes */
}
- (NSString *)nsPrefix;
- (xmlNodePtr)xmlNodeForDoc:(xmlDocPtr)doc elementName:(NSString *)elName elementNSPrefix:(NSString *)elNSPrefix;
- (void)addAttributesToNode:(xmlNodePtr)node;
- (void)addElementsToNode:(xmlNodePtr)node;
+ (API_TIMESHEET_GET_TSRESPONSE *)deserializeNode:(xmlNodePtr)cur;
- (void)deserializeAttributesFromNode:(xmlNodePtr)cur;
- (void)deserializeElementsFromNode:(xmlNodePtr)cur;
/* elements */
@property (retain) NSString * GET_TSRESULT;
/* attributes */
- (NSDictionary *)attributes;
@end
/* Cookies handling provided by http://en.wikibooks.org/wiki/Programming:WebObjects/Web_Services/Web_Service_Provider */
#import <libxml/parser.h>
#import "xsd.h"
#import "API_TIMESHEET.h"
@class API_TIMESHEETSOAPBinding;
@interface API_TIMESHEET : NSObject {
	
}
+ (API_TIMESHEETSOAPBinding *)API_TIMESHEETSOAPBinding;
@end
@class API_TIMESHEETSOAPBindingResponse;
@class API_TIMESHEETSOAPBindingOperation;
@protocol API_TIMESHEETSOAPBindingResponseDelegate <NSObject>
- (void) operation:(API_TIMESHEETSOAPBindingOperation *)operation completedWithResponse:(API_TIMESHEETSOAPBindingResponse *)response;
@end
@interface API_TIMESHEETSOAPBinding : NSObject <API_TIMESHEETSOAPBindingResponseDelegate> {
	NSURL *address;
	NSTimeInterval defaultTimeout;
	NSMutableArray *cookies;
	BOOL logXMLInOut;
	BOOL synchronousOperationComplete;
	NSString *authUsername;
	NSString *authPassword;
}
@property (copy) NSURL *address;
@property (assign) BOOL logXMLInOut;
@property (assign) NSTimeInterval defaultTimeout;
@property (nonatomic, retain) NSMutableArray *cookies;
@property (nonatomic, retain) NSString *authUsername;
@property (nonatomic, retain) NSString *authPassword;
- (id)initWithAddress:(NSString *)anAddress;
- (void)sendHTTPCallUsingBody:(NSString *)body soapAction:(NSString *)soapAction forOperation:(API_TIMESHEETSOAPBindingOperation *)operation;
- (void)addCookie:(NSHTTPCookie *)toAdd;
- (API_TIMESHEETSOAPBindingResponse *)GET_TSUsingParameters:(API_TIMESHEET_GET_TS *)aParameters ;
- (void)GET_TSAsyncUsingParameters:(API_TIMESHEET_GET_TS *)aParameters  delegate:(id<API_TIMESHEETSOAPBindingResponseDelegate>)responseDelegate;
@end
@interface API_TIMESHEETSOAPBindingOperation : NSOperation {
	API_TIMESHEETSOAPBinding *binding;
	API_TIMESHEETSOAPBindingResponse *response;
	id<API_TIMESHEETSOAPBindingResponseDelegate> delegate;
	NSMutableData *responseData;
	NSURLConnection *urlConnection;
}
@property (retain) API_TIMESHEETSOAPBinding *binding;
@property (readonly) API_TIMESHEETSOAPBindingResponse *response;
@property (nonatomic, assign) id<API_TIMESHEETSOAPBindingResponseDelegate> delegate;
@property (nonatomic, retain) NSMutableData *responseData;
@property (nonatomic, retain) NSURLConnection *urlConnection;
- (id)initWithBinding:(API_TIMESHEETSOAPBinding *)aBinding delegate:(id<API_TIMESHEETSOAPBindingResponseDelegate>)aDelegate;
@end
@interface API_TIMESHEETSOAPBinding_GET_TS : API_TIMESHEETSOAPBindingOperation {
	API_TIMESHEET_GET_TS * parameters;
}
@property (retain) API_TIMESHEET_GET_TS * parameters;
- (id)initWithBinding:(API_TIMESHEETSOAPBinding *)aBinding delegate:(id<API_TIMESHEETSOAPBindingResponseDelegate>)aDelegate
	parameters:(API_TIMESHEET_GET_TS *)aParameters
;
@end
@interface API_TIMESHEETSOAPBinding_envelope : NSObject {
}
+ (API_TIMESHEETSOAPBinding_envelope *)sharedInstance;
- (NSString *)serializedFormUsingHeaderElements:(NSDictionary *)headerElements bodyElements:(NSDictionary *)bodyElements;
@end
@interface API_TIMESHEETSOAPBindingResponse : NSObject {
	NSArray *headers;
	NSArray *bodyParts;
	NSError *error;
}
@property (retain) NSArray *headers;
@property (retain) NSArray *bodyParts;
@property (retain) NSError *error;
@end
