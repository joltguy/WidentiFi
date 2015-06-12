//
//  NetworkNotifierCallback.h
//  WidentiFi
//
//  Created by Jeff Marlow on 2015-06-11.
//  Copyright (c) 2015 Joltguy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkNotifierCallback : NSObject

+ (void(*)(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo))notifierProc;

@end
