//
//  ZPBTEventManager.h
//  Zipp.to
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//


/*!
 @header ZPBTEventManager.h
 
 @brief ZPBTEventManager provides functionality to pass customParameter objects as a key value pairs, whenever defined events occur in the application
 
 ZPBTEventManager provides functionality to pass customParameter objects as a key value pairs, whenever defined events occur in the application. The examples below include sample customParameter objects, however the precise format of these objects will be defined and documented separately as part of the setup of your account with Zipabout.

 
 @author  Zipabout on 05/01/2017.
 @copyright  Copyright © 2017 Zipabout. All rights reserved.
 @version    1.0
 */

#import <Foundation/Foundation.h>

@interface ZPBTEventManager : NSObject

@property (nonatomic, retain) NSTimer *timer;
- (void) trackEventInPage:(NSString *) pageName  customParameter: (NSDictionary *) parameter;
+ (instancetype)sharedInstance ;

@end
