//
//  Twitt.m
//  iTwitt
//
//  Created by SagMor on 10-11-09.
//  Copyright 2009 SagMor. All rights reserved.
//

#import "Twitt.h"
#import "JSON/JSON.h"


@implementation Twitt

@synthesize text;
@synthesize username;

+ (NSArray *)twittsForUser:(NSString *)user withPass:(NSString *)pass {
	NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@:%@@twitter.com/statuses/friends_timeline.json", user, pass]];
	NSString *json = [NSString stringWithContentsOfURL:url];
		
	
	NSError *error = nil;
	NSArray *data = [[[[SBJSON alloc] init] autorelease] objectWithString:json error:&error];
	
	if (error) return nil;
	
	NSMutableArray *twitts = [NSMutableArray arrayWithCapacity:[data count]];
	for (id t in data) {
		[twitts addObject:[Twitt twittWithContentOf:t]];
	}
		 
	return twitts;
}

+ (Twitt *)twittWithText:(NSString *)text {
	Twitt *t = [[Twitt alloc] init];
	t.text = text;
	
	return [t autorelease];
}

+ (Twitt *)twittWithContentOf:(NSDictionary *)dict {
	Twitt *t = [[Twitt alloc] init];
	
	t.text = [dict objectForKey:@"text"];
	t.username = [[dict objectForKey:@"user"] objectForKey:@"name"];
	
	return [t autorelease];
}

- (BOOL)postForUser:(NSString *)user withPass:(NSString *)pass {
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://%@:%@@twitter.com/statuses/update.json", user, pass]];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
	NSString *params = [NSString stringWithFormat:@"status=%@", 
						[self.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
	[request setHTTPBody:[params dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPMethod:@"POST"];
    [request setTimeoutInterval:90.0];
	
	NSURLResponse *response = nil;
    NSError *error = nil;
	
    NSData *theResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response 
                                                                error:&error];
	
	if (error) return NO;
	
	NSString *responseString = [[[NSString alloc] initWithData:theResponseData encoding:NSUTF8StringEncoding] autorelease];
	NSDictionary *dict = [[[[SBJSON alloc] init] autorelease] objectWithString:responseString error:&error];
	
	if (error) return NO;
	
	return YES;
}


@end
