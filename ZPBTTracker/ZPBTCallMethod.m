//
//  ZPBTCallMethod.m
//  ZPBTTracker
//
//  Created by Zipabout on 13/02/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import "ZPBTCallMethod.h"
#import "Webservice.h"
#import "Common.h"
#import "Parameter.h"


@implementation ZPBTCallMethod

+ (instancetype)sharedInstance {
    static ZPBTCallMethod *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ZPBTCallMethod alloc] init];
    });
    return sharedInstance;
}



/*!
 @brief calling method to retrive the JSON Object corresponding to the method
 
 @param methodName Name of the method.
 @param paramStr Parameter for the call methods e: {param1:'test'}.
 @param success Callback method return success/fail response as Object.
 
 @code
 ZPBTCallMethod *callMethod = [ZPBTCallMethod sharedInstance];
 
 [callMethod callMethodName:@"getSurveyQuestion" andParameterString:@"{param1:'test'}" success:^(id object,  NSInteger responseCode , NSError* error) {
 }
 @endcode
 
 */


- (void) callMethodName:(NSString *) methodName andParameterString:(NSString *) paramStr success:(JSONObject)success{
    
    if(methodName != nil) {
        NSString *trackID = [Common getTrackID];
        NSString *userID = [Common userID];
        NSString *paramURL = [Common getParameterURL];
        
        
        if(trackID != nil) {
            
            Parameter *param = [[Parameter alloc] initParameterGUID:userID cID:trackID customParameter:paramStr methodName:methodName];
            NSString * postString = [self generateEventsPostString:param];
            Webservice *service = [Webservice sharedInstance];
            
            [service  sendRequestToURL:paramURL withData:postString session:nil success: ^(NSData *data, Parameter *event, NSInteger responseCode) {
                if(responseCode == 200) {
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        
                        NSError *error = nil;
                        id object = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &error];
                        
                        if (error != nil) {
                            
                            success(nil, responseCode , error);
                            
                        } else if(data != nil)  {
                            
                            success(object ,responseCode , error);
                        }
                        
                        
                        
                    });
                }
            }];
            
        }
        
        else {
            NSLog(@"Missing Configuration .plist. Please check .plist file and set appropriate values");
        }
    }
    
    
}






-(NSString *) generateEventsPostString:(Parameter *)param {
    
    
    NSString *params = [NSString stringWithFormat:@"cID=%@&methodName=%@&methodParams=%@&userGUID=%@",param.cID,param.methodName,param.parameter,param.userGUID];
    
    return params;
}


@end
