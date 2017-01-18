//
//  ZPBTEventManager.h
//  Zipp.to
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPBTEventManager : NSObject

@property (nonatomic, retain) NSTimer *timer;
- (void) trackEventInPage:(NSString *) pageName  customParameter: (NSDictionary *) parameter;
+ (instancetype)sharedInstance ;

@end
