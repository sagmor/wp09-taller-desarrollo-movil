//
//  iCounterViewController.m
//  iCounter
//
//  Created by SagMor on 19-11-09.
//  Copyright inXiety 2009. All rights reserved.
//

#import "iCounterViewController.h"

@implementation iCounterViewController

@synthesize label;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	counter = 0;
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

-(IBAction)clickMe:(id)sender {
	counter++;
	label.text = [NSString stringWithFormat:@"%d", counter];
}


- (void)dealloc {
    [super dealloc];
	self.label = nil;
}

@end
