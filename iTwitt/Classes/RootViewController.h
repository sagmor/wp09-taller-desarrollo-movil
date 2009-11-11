//
//  RootViewController.h
//  iTwitt
//
//  Created by SagMor on 10-11-09.
//  Copyright inXiety 2009. All rights reserved.
//

@interface RootViewController : UITableViewController {
	NSArray *twitts;
}

@property(copy) NSArray *twitts;

- (IBAction)reloadTwitts:(id)sender;
- (IBAction)postTwittButton:(id)sender;

@end
