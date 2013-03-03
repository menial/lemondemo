//
//  LDProperty.m
//  LemonDemo
//
//  Created by Ben Barnett on 31/01/2013.
//  Copyright (c) 2013 Menial. All rights reserved.
//

#import "LDProperty.h"

@implementation LDProperty

- (id)init
{
	self = [super init];
	if (self)
	{
		_modifiers = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (NSString *)description
{
	NSMutableString *formattedModifiers = [NSMutableString string];
	if ([self.modifiers count] > 0)
	{
		[formattedModifiers appendString:@" ("];
		for (NSInteger idx=0; idx<[self.modifiers count]; idx++)
		{
			if (idx > 0) {
				[formattedModifiers appendString:@", "];
			}
			[formattedModifiers appendString:[self.modifiers objectAtIndex:idx]];
		}
		[formattedModifiers appendString:@")"];
	}
	
	return [NSString stringWithFormat:@"%@ *%@%@", self.type, self.name, formattedModifiers];
}

@end
