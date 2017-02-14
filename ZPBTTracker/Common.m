//
//  Common.m
//  ZPBTTracker
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import "Common.h"

@implementation Common

+ (void) setPageClickID:(NSString *)clickID forPage:(NSString *) pageName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // check if user is alraidy Login
    if (defaults != nil ) {
        [defaults setObject:clickID forKey:pageName];
        [defaults synchronize];
    }
}

+(NSString *) getLogDate {
    NSDate *date = [NSDate date];
    NSDateFormatter *format =  [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss"];
    
    NSString *stringFromDate = [format stringFromDate:date];
    return stringFromDate;
    
    
}


+ (NSString *)userID
{
    NSString *deviceId = @"";
    UIDevice *currentDevice = [UIDevice currentDevice];
    if(currentDevice != nil) {
        deviceId = [[currentDevice identifierForVendor] UUIDString];
    }
    return deviceId;
}

+ (NSString *) getClickIDForPage:(NSString *)pageName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *pageClikID = nil;
    // check if user is alraidy Login
    if (defaults != nil ) {
        if([defaults objectForKey:pageName] != nil){
            pageClikID = [defaults objectForKey:pageName];
        }
    }
    return pageClikID;
}


+ (void) showAlertWithTitle:(NSString *) title andMessage:(NSString *) message {
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    [[[[UIApplication sharedApplication] keyWindow] rootViewController] presentViewController:alertController animated:true completion:nil];
    
    
}

+ (NSString *) getParameterURL {
    
    NSString *parameterURL = @"";
    NSString *trackID  = [self getTrackID];
    if(trackID != nil) {
        parameterURL = [NSString stringWithFormat: @"https://c%@.zpbt.uk/sdk/zpbt_callMethod.ashx",trackID];
    }
    return parameterURL;
    
}

+ (NSString *) getSessionURL {
    
    NSString *sessionURL = @"";
    NSString *trackID  = [self getTrackID];
    if(trackID != nil) {
       sessionURL = [NSString stringWithFormat: @"https://c%@.zpbt.uk/sdk/zpbt_trackclick.aspx",trackID];
    }
    return sessionURL;
    
}

+ (NSString *) getEventURL {
    NSString *eventURL = @"";
    NSString *trackID  = [self getTrackID];
    if(trackID != nil) {
        eventURL = [NSString stringWithFormat: @"https://c%@.zpbt.uk/sdk/zpbt_logcustom.aspx",trackID];
    }
    return eventURL;
}

+ (NSString *) getTrackID {
    NSString *trackID = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"TrackID"];
    return trackID;
}

+ (NSNumber *) automaticSessionTracking {
    NSNumber *tracking = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"AutomaticTracking"];
    return tracking;
}



@end
