//
//  LDProperty.h
//  LemonDemo
//
//  Created by Ben Barnett on 31/01/2013.
//  Copyright (c) 2013 Menial. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LDProperty : NSObject

@property (strong, nonatomic) NSMutableArray *modifiers;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *name;

@end
