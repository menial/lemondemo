//
//  LDAppDelegate.h
//  LemonDemo
//
//  Created by Ben Barnett on 30/01/2013.
//  Copyright (c) 2013 Menial. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface LDAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextView *inputView;
@property (assign) IBOutlet NSTextView *outputView;

- (IBAction)parseText:(id)sender;

@end
