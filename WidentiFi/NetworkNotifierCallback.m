//
//  NetworkNotifierCallback.m
//  WidentiFi
//
//  Created by Jeff Marlow on 2015-06-11.
//  Copyright (c) 2015 Joltguy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkNotifierCallback.h"

static void networkChanged(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo)
{
	// NSLog(@"Network changed.");
	[[NSNotificationCenter defaultCenter] postNotificationName:@"network.changed" object:nil];
}

@implementation NetworkNotifierCallback

+ (void(*)(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo))notifierProc
{
	return networkChanged;
}

@end
