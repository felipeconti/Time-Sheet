//
//  TSParser.m
//  Time Sheet
//
//  Created by Felipe Bonvicini Conti on 03/01/13.
//  Copyright (c) 2013 Felipe Bonvicini Conti. All rights reserved.
//

#import "TSParser.h"
#import "TS.h"

@implementation TSParser
+ (NSArray *)parserObject:(id)object
{
    NSMutableArray *TSs = [NSMutableArray array];
    for (NSDictionary *_ts in object) {
        TS *ts = [[TS alloc] init];
        ts.cod = [_ts objectForKey:@"NUMERO"];
//        ts.data = [self formatDate:[_ts objectForKey:@"data"]];
        ts.data = [_ts objectForKey:@"DATA"];
        ts.advogado = [_ts objectForKey:@"COD_ADVG"];
        ts.cliente = [_ts objectForKey:@"COD_CLIENTE"];
        ts.loja = [_ts objectForKey:@"ORGNCODIG"];
        ts.caso = [_ts objectForKey:@"PASTA"];
        ts.ut = [_ts objectForKey:@"TEMPO_REAL"];
        ts.complemento = [_ts objectForKey:@"COMPLEMENTO"];
        [TSs addObject:ts];
        ts = nil;
    }

    if (TSs.count == 0){
        [TSs addObject: [TS TSEmpty] ];
    }
    
    return TSs;
}

+ (NSString *)formatDate:(NSString*)stringDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSDate *date = [dateFormatter dateFromString:stringDate];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [calendar components:NSDayCalendarUnit|NSMonthCalendarUnit|NSYearCalendarUnit fromDate:date];
    
    NSString *formatedDate = [NSString stringWithFormat:@"%u/%u/%u", [dateComponents day], [dateComponents month], [dateComponents year]];
    
    return formatedDate;
}
@end
