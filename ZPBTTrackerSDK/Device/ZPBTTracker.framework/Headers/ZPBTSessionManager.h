//
//  ZpbtGetSession.h
//  Zipp.to
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPBTSessionManager : NSObject

@property (nonatomic, retain) NSTimer *timer;

+ (instancetype)sharedInstance;
-(void) trackSessionInPage:(NSString *) pageName;


@end
