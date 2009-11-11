//
//  RootViewController.m
//  iTwitt
//
//  Created by SagMor on 10-11-09.
//  Copyright inXiety 2009. All rights reserved.
//

#import "RootViewController.h"
#import "PostTwittViewController.h"
#import "Twitt.h"


@implementation RootViewController

@synthesize twitts;

- (void)viewDidLoad {
	self.title = @"My Timeline";
	self.toolbarItems = [NSArray arrayWithObjects:
		[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
													   target:self
													   action:@selector(reloadTwitts:)] autorelease],
		[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
														target:nil
														action:nil] autorelease],
		[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose
													   target:self
													   action:@selector(postTwittButton:)] autorelease],
		nil];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self.navigationController setToolbarHidden:NO animated:animated];
	[self reloadTwitts:self];
}

- (void)viewDidDisappear:(BOOL)animated {
	[self.navigationController setToolbarHidden:YES animated:animated];
    [super viewDidDisappear:animated];
}


- (void)viewDidUnload {
	self.twitts = nil;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return twitts ? [twitts count] : 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"TwittCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	Twitt *twitt = (Twitt *)[twitts objectAtIndex:indexPath.row];
	
	cell.textLabel.text = twitt.username;
	cell.detailTextLabel.text = twitt.text;

    return cell;
}

- (IBAction)reloadTwitts:(id)sender {
	self.twitts = [Twitt twittsForUser:[[NSUserDefaults standardUserDefaults] valueForKey:@"username"] 
							  withPass:[[NSUserDefaults standardUserDefaults] valueForKey:@"password"]];
	
	if (twitts) {
		[self.tableView reloadData];
	} else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" 
														message:@"Failed to load timeline"
													   delegate:self 
											  cancelButtonTitle:@"OK" 
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}
}

- (IBAction)postTwittButton:(id)sender {
	PostTwittViewController *post = [[PostTwittViewController alloc] initWithNibName:@"PostTwitt" bundle:nil];
	[self.navigationController pushViewController:post animated:YES];
	[post release];
}


@end

