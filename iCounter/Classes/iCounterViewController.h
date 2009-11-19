//
//  iCounterViewController.h
//  iCounter
//
//  Created by SagMor on 19-11-09.
//  Copyright inXiety 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iCounterViewController : UIViewController {
	int counter;
	UILabel *label;
}

@property(retain) IBOutlet UILabel *label;

-(IBAction)clickMe:(id)sender;

@end

