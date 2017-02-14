//
//  ZPBTCallMethod.h
//  ZPBTTracker
//
//  Created by Zipabout on 13/02/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//


/*!
 @header ZPBTCallMethod.h
 
 @brief ZPBTCallMethod provides functionality to pass method name and the parameter to retrive the JSON Object corresponding to the method.
 @author  Zipabout on 05/01/2017.
 @copyright  Copyright © 2017 Zipabout. All rights reserved.
 @version    1.0
 */

#import <Foundation/Foundation.h>
typedef void (^JSONObject)(id object,  NSInteger responseCode, NSError *error);
@interface ZPBTCallMethod : NSObject


- (void) callMethodName:(NSString *) methodName andParameterString:(NSString *) paramStr success:(JSONObject)success;
+ (instancetype)sharedInstance ;
@end
