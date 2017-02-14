//
//  ZPBTSessionManager.h
//  Zipp.to
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

/*!
 @header ZPBTSessionManager.h
 
 @brief  ZPBTSessionManager provides basic SDK functionality and should be instantiated on every View Controller within your application.
 
ZPBTSessionManager provides basic SDK functionality and should be instantiated on every View Controller within your application. If you have configured ‘AutomaticTracking’ in your configuration (.plist) file, you will not need to make any changes to your Application code.
 If ‘AutomaticTracking’ is set to 0 (manual tracking), you will need to include the following code in each View’s default viewWillAppear method.
 
 @author  Zipabout on 05/01/2017.
 @copyright  Copyright © 2017 Zipabout. All rights reserved.
 @version    1.0
 */

#import <Foundation/Foundation.h>

@interface ZPBTSessionManager : NSObject

@property (nonatomic, retain) NSTimer *timer;

+ (instancetype)sharedInstance;
-(void) trackSessionInPage:(NSString *) pageName;


@end
