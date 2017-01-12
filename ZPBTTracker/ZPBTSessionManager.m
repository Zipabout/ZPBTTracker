//
//  ZpbtGetSession.m
//  Zipp.to
//
//  Created by Siju Satheesachandran on 06/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
//

#import "ZPBTSessionManager.h"
#import "PageSession.h"
#import "Common.h"
#import "Session.h"
#import "Webservice.h"



@implementation ZPBTSessionManager


+ (instancetype)sharedInstance {
    static ZPBTSessionManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ZPBTSessionManager alloc] init];
    });
    return sharedInstance;
}



-(void) trackSessionInPage:(NSString *) pageName {
    
    NSString *trackID = [Common getTrackID];
    
    if(trackID != nil) {
        NSString *userID = [self userID];
        NSString *clickID = [self clickID];
        NSString *isSession = [self checkSession];
        NSString *referer = [self getPageReferer];
        NSString *logDate = [Common getLogDate];
        PageSession *pageSession = [[PageSession alloc] initWithSession:isSession cID:[Common getTrackID] clickGUID:clickID c:@"0" userGUID:userID referrer:referer clickdestination:pageName logDate:logDate];
        Session *session = [Session  sharedInstance];
        
        [session.sessionArray addObject:pageSession];
        [self trackPageSession];
        [self setReferer:pageName];
        [Common setPageClickID:clickID forPage:pageName]; }
    else {
        NSLog(@"Missing Configuration .plist. Please check .plist file and set appropriate values");
        
    }
    
}


-(void) trackPageSession {
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(startSession) userInfo:nil repeats:YES];
    }
    
}

-(void) startSession{
    Session *session = [Session sharedInstance];
    NSString *sessionURL = [Common getSessionURL];
    NSLog(@"Session Count ===========>>>>> %lu", (unsigned long)[session.sessionArray count]);
    if ([session.sessionArray count] > 0 ) {
        PageSession *pageSession = session.sessionArray.firstObject;
        NSString * postString = [self generateSessionPostString:pageSession];
        NSLog(@"Session Post String================>>>>> %@",postString);
        Webservice *service = [Webservice sharedInstance];
        
        [service  sendRequestToURL:sessionURL withData:postString session:pageSession success: ^(NSData *data,PageSession *pageSession,NSInteger responseCode) {
            if(data != nil) {
                NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"================>>>>> %@",string);
                if([session.sessionArray containsObject:pageSession]) {
                    NSLog(@"Page name===========>>>>> %@", pageSession.clickdestination);
                    [session.sessionArray removeObject:pageSession];
                    
                }
            } else {
                if(responseCode == 0) {
                    [self stopSending];
                } else {
                    if([session.sessionArray containsObject:pageSession]) {
                        NSLog(@"Page name===========>>>>> %@", pageSession.clickdestination);
                        [session.sessionArray removeObject:pageSession];
                        
                    }
                }
            }
        }];
        
    } else {
        [self stopSending];
    }
}

-(void) stopSending {
    NSLog(@"Timer stopped===========>>>>> ");
    [_timer invalidate];
    _timer = nil;
}


-(NSString *) generateSessionPostString:(PageSession *)pageSession {
    
    NSString *params = [NSString stringWithFormat:@"isNewSession=%@&cID=%@&clickGUID=%@&c=%@&userGUID=%@&referrer=%@&clickdestination=%@&ssl=true&logdate=%@",pageSession.isNewSession,pageSession.cID,pageSession.clickGUID,pageSession.c,pageSession.userGUID,pageSession.referrer,pageSession.clickdestination,pageSession.logdate];
    return params;
}


-(NSString *) checkSession {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *isSession = @"0";
    // check if user is alraidy Login
    if (defaults != nil ) {
        if([defaults objectForKey:@"isSession"] != nil){
            isSession = @"0";
        } else {
            [defaults setObject:@"1" forKey:@"isSession"];
            isSession = @"1";
            [defaults synchronize];
        }
    }
    return isSession;
}

-(NSString *) getPageReferer {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *referer = @"";
    // check if user is alraidy Login
    if (defaults != nil ) {
        if([defaults objectForKey:@"referer"] != nil){
            referer = [defaults objectForKey:@"referer"];
            return referer;
            
        }
    }
    return referer;
}

- (void) setPageClickID:(NSString *)clickID forPage:(NSString *) pageName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // check if user is alraidy Login
    if (defaults != nil ) {
        [defaults setObject:clickID forKey:pageName];
        [defaults synchronize];
    }
}

- (NSString *) getClickIDForPage:(NSString *)pageName {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *pageClikID = @"";
    // check if user is alraidy Login
    if (defaults != nil ) {
        if([defaults objectForKey:pageName] != nil){
            pageClikID = [defaults objectForKey:pageName];
        }
    }
    return pageClikID;
}


- (NSString *)userID
{
    NSString *deviceId = @"";
    UIDevice *currentDevice = [UIDevice currentDevice];
    if(currentDevice != nil) {
        deviceId = [[currentDevice identifierForVendor] UUIDString];
    }
    return deviceId;
}


- (void) setReferer:(NSString *) refererPage {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (defaults != nil ) {
        [defaults setObject:refererPage forKey:@"referer"];
        [defaults synchronize];
    }
    
}

- (NSString *)clickID
{
    NSString *UUID = @"";
    UUID = [[NSUUID UUID] UUIDString];
    if (UUID !=nil) {
        return UUID;
    }
    return UUID;
    
}

@end
