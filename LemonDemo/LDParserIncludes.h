//
//  LDParserIncludes.h
//  LemonDemo
//
//  Created by Ben Barnett on 30/01/2013.
//  Copyright 2013 Menial. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LDProtocol.h"
#import "LDProperty.h"

struct LDParserToken
{
	CFStringRef textValue;	/* Text of the token. */
};
typedef struct LDParserToken LDParserToken;

void LDProtocolParserTrace(FILE *TraceFILE, char *zTracePrompt);
void *LDProtocolParserAlloc(void *(*mallocProc)(size_t));
void LDProtocolParserFree(void *p, void (*freeProc)(void*));
void LDProtocolParser(void *yyp, int yymajor, LDParserToken yyminor, LDProtocol *parsedObject);
