//
//  Session.h
//  Zipp.to
//
//  Created by Siju Satheesachandran on 08/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Session : NSObject
/** This property is an array of PageSession Object. */
@property (nonatomic, strong) NSMutableArray *sessionArray;
/** This property is an array of Event Object. */
@property (nonatomic, strong) NSMutableArray *eventArray;
+(Session*) sharedInstance;

@end
