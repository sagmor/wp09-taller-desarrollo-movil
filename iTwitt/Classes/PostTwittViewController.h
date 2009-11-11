//
//  PostTwittViewController.h
//  iTwitt
//
//  Created by SagMor on 10-11-09.
//  Copyright 2009 SagMor. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PostTwittViewController : UIViewController {
	UITextView *text;
}
@property(retain) IBOutlet UITextView *text;

- (IBAction)postTwitt:(id)sender;

@end
