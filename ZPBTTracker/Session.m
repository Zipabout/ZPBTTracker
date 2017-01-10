//
//  Session.m
//  Zipp.to
//
//  Created by Siju Satheesachandran on 08/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
//

#import "Session.h"

@implementation Session
/*!
 @brief Creating a single instance of Session.
 
 @discussion Creating a single instance for the session. Each PageSession and event stored in array before sending to service
 
 To use it, simply call @c[Session sharedInstance];
 
 @return Session Instance of Session.
 */
+ (instancetype)sharedInstance {
    static Session *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Session alloc] init];
        sharedInstance.sessionArray = [[NSMutableArray alloc] init];
        sharedInstance.eventArray = [[NSMutableArray alloc] init];
     
    });
    return sharedInstance;
}


@end
