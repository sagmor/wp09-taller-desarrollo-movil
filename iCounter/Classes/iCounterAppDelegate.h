//
//  iCounterAppDelegate.h
//  iCounter
//
//  Created by SagMor on 19-11-09.
//  Copyright inXiety 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iCounterViewController;

@interface iCounterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    iCounterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet iCounterViewController *viewController;

@end

