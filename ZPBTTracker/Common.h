//
//  Common.h
//  Zipp.to
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Common : NSObject

+ (void) setPageClickID:(NSString *)clickID forPage:(NSString *) pageName;
+ (NSString *) getClickIDForPage:(NSString *)pageName;
+ (NSString *) getLogDate;
+ (NSString *) getSessionURL;
+ (NSString *) getEventURL;
+ (NSString *) getTrackID;
+ (NSNumber *) automaticSessionTracking;
+ (void) showAlertWithTitle:(NSString *) title andMessage:(NSString *) message;
@end
