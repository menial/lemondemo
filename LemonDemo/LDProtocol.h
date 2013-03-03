//
//  LDProtocol.h
//  LemonDemo
//
//  Created by Ben Barnett on 30/01/2013.
//  Copyright (c) 2013 Menial. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDProtocol : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSMutableArray *additionalProtocols;

@property (strong, nonatomic) NSMutableArray *properties;

@end
