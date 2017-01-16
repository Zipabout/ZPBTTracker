//
//  ZPBTEventManager.h
//  Zipp.to
//
//  Created by Siju Satheesachandran on 08/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZPBTEventManager : NSObject

@property (nonatomic, retain) NSTimer *timer;
- (void) trackEventInPage:(NSString *) pageName  customParameter: (NSDictionary *) parameter;
+ (instancetype)sharedInstance ;

@end
