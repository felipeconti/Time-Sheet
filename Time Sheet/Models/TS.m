//
//  TS.m
//  Time Sheet
//
//  Created by Felipe Bonvicini Conti on 02/01/13.
//  Copyright (c) 2013 Felipe Bonvicini Conti. All rights reserved.
//

#import "TS.h"

@implementation TS
+ (TS *)TSEmpty{
    
    TS *ts = [[TS alloc] init];
    ts.cod = @"";
    ts.data = @"";
    ts.advogado = @"";
    ts.cliente = @"";
    ts.loja = @"";
    ts.caso = @"";
    ts.ut = @"";
    ts.complemento = @"Vazio";

    return ts;
}
@end
