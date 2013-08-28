//
//  TS.h
//  Time Sheet
//
//  Created by Felipe Bonvicini Conti on 02/01/13.
//  Copyright (c) 2013 Felipe Bonvicini Conti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TS : NSObject

@property (nonatomic, strong) NSString *cod;
@property (nonatomic, strong) NSString *data;
@property (nonatomic, strong) NSString *part;
@property (nonatomic, strong) NSString *cliente;
@property (nonatomic, strong) NSString *loja;
@property (nonatomic, strong) NSString *caso;
@property (nonatomic, strong) NSString *ut;
@property (nonatomic, strong) NSString *complemento;

@end
