//
//  LDAppDelegate.m
//  LemonDemo
//
//  Created by Ben Barnett on 30/01/2013.
//  Copyright (c) 2013 Menial. All rights reserved.
//

#import "LDAppDelegate.h"
#import "LDParserIncludes.h"
#import "Grammar.h"				// This is created by Lemon
#import <ParseKit/ParseKit.h>


@implementation LDAppDelegate


- (IBAction)parseText:(id)sender
{
	// Prepare our tokenizer
	// We can ignore whitespace and comments
	// Also, make the @ symbol part of words
	PKTokenizer *tokenizer = [[PKTokenizer alloc] initWithString:[self.inputView string]];
	tokenizer.whitespaceState.reportsWhitespaceTokens = NO;
	tokenizer.commentState.reportsCommentTokens = NO;
	[tokenizer setTokenizerState:tokenizer.wordState from:'@' to:'@'];
	[tokenizer.wordState setWordChars:YES from:'@' to:'@'];
	
	PKToken *eofToken = [PKToken EOFToken];
	PKToken *currentToken = nil;
	
	
	// Our result object.
	// The protocol definition will be parsed into this
	LDProtocol *resultObject = [[LDProtocol alloc] init];
	
	
	// Allocate the parser
	void *parser = LDProtocolParserAlloc(malloc);
	
	// Iterate over the tokens
	while ((currentToken = [tokenizer nextToken]) != eofToken)
	{
		// Copy the text value of a PKToken into our lemon token type before passing it to the parser
		LDParserToken lemonToken;
		lemonToken.textValue = (__bridge_retained CFStringRef)[currentToken.stringValue copy];
		LDProtocolParser(parser, [self tokenCodeFromToken:currentToken], lemonToken, resultObject);
	}
	
	// When we've finished, free the parser
	LDProtocolParserFree(parser, free);
	
	// And output the result to the user
	[self.outputView setString:[resultObject description]];
}

- (int)tokenCodeFromToken:(PKToken *)token
{
	if ([token.stringValue caseInsensitiveCompare:@"@protocol"] == NSOrderedSame) {
		return LDTK_ATPROTOCOL;
	}
	else if ([token.stringValue caseInsensitiveCompare:@"@end"] == NSOrderedSame) {
		return LDTK_ATEND;
	}
	else if ([token.stringValue isEqualToString:@"<"]) {
		return LDTK_LEFTANGLE;
	}
	else if ([token.stringValue isEqualToString:@">"]) {
		return LDTK_RIGHTANGLE;
	}
	else if ([token.stringValue isEqualToString:@","]) {
		return LDTK_COMMA;
	}
	else if ([token.stringValue isEqualToString:@";"]) {
		return LDTK_SEMI;
	}
	else if ([token.stringValue isEqualToString:@"*"]) {
		return LDTK_STAR;
	}
	else if ([token.stringValue caseInsensitiveCompare:@"@property"] == NSOrderedSame) {
		return LDTK_ATPROPERTY;
	}
	else if ([token.stringValue isEqualToString:@"("]) {
		return LDTK_LEFTPAREN;
	}
	else if ([token.stringValue isEqualToString:@")"]) {
		return LDTK_RIGHTPAREN;
	}
	
	return LDTK_ID;
}

@end
