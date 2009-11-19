//
//  iCounterAppDelegate.m
//  iCounter
//
//  Created by SagMor on 19-11-09.
//  Copyright inXiety 2009. All rights reserved.
//

#import "iCounterAppDelegate.h"
#import "iCounterViewController.h"

@implementation iCounterAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
