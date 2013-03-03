//
//  LDProtocol.m
//  LemonDemo
//
//  Created by Ben Barnett on 30/01/2013.
//  Copyright (c) 2013 Menial. All rights reserved.
//

#import "LDProtocol.h"

@implementation LDProtocol

- (id)init
{
	self = [super init];
	if (self)
	{
		_additionalProtocols = [[NSMutableArray alloc] init];
		_properties = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"Name: %@\n\nConforms to: %@\n\nProperties: %@", self.name, self.additionalProtocols, self.properties];
}

@end
