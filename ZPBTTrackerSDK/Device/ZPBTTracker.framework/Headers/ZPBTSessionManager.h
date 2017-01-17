//
//  ZpbtGetSession.h
//  Zipp.to
//
//  Created by Siju Satheesachandran on 06/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPBTSessionManager : NSObject

@property (nonatomic, retain) NSTimer *timer;

+ (instancetype)sharedInstance;
-(void) trackSessionInPage:(NSString *) pageName;


@end
