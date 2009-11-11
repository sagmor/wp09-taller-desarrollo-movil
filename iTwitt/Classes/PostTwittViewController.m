//
//  PostTwittViewController.m
//  iTwitt
//
//  Created by SagMor on 10-11-09.
//  Copyright 2009 SagMor. All rights reserved.
//

#import "PostTwittViewController.h"
#import "Twitt.h"

@implementation PostTwittViewController

@synthesize text;

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Post";
}

- (void)viewDidAppear:(BOOL)animated {
	[text becomeFirstResponder];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return YES;
}


- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	self.text = nil;
}


- (IBAction)postTwitt:(id)sender {
	Twitt *twitt = [Twitt twittWithText:text.text];
	
	if ([twitt postForUser:[[NSUserDefaults standardUserDefaults] valueForKey:@"username"] 
				  withPass:[[NSUserDefaults standardUserDefaults] valueForKey:@"password"]]) {
		[self.navigationController popToRootViewControllerAnimated:YES];
	} else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" 
														message:@"Failed to post twitt"
													   delegate:self 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}	
}

@end

