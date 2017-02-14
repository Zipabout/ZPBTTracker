//
//  Session.h
//  Zipp.to
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Session : NSObject
/** This property is an array of PageSession Object. */
@property (nonatomic, strong) NSMutableArray *sessionArray;
/** This property is an array of Event Object. */
@property (nonatomic, strong) NSMutableArray *eventArray;
/** This property is an array of Event Object. */
@property (nonatomic, strong) NSMutableArray *methodArray;
+(Session*) sharedInstance;

@end
