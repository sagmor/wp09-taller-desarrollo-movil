//
//  Twitt.h
//  iTwitt
//
//  Created by SagMor on 10-11-09.
//  Copyright 2009 SagMor. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Twitt : NSObject {
	NSString *username;
	NSString *text;
}
@property(copy) NSString *username;
@property(copy) NSString *text;

+ (NSArray *)twittsForUser:(NSString *)user withPass:(NSString *)pass;
+ (Twitt *)twittWithText:(NSString *)text;
+ (Twitt *)twittWithContentOf:(NSDictionary *)dict;
- (BOOL)postForUser:(NSString *)user withPass:(NSString *)pass;

@end
