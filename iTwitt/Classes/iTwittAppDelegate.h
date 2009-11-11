//
//  iTwittAppDelegate.h
//  iTwitt
//
//  Created by SagMor on 10-11-09.
//  Copyright inXiety 2009. All rights reserved.
//

@interface iTwittAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

