//
//  ZPBTEventManager.m
//  Zipp.to
//
//  Created by Siju Satheesachandran on 08/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
//

#import "ZPBTEventManager.h"
#import "Common.h"
#import "Events.h"
#import "Session.h"
#import "Webservice.h"

@implementation ZPBTEventManager

+ (instancetype)sharedInstance {
    static ZPBTEventManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[ZPBTEventManager alloc] init];
    });
    return sharedInstance;
}

- (void) trackEventInPage:(NSString *) pageName  customParameter: (NSDictionary *) parameter {
    
    NSString *trackID = [Common getTrackID];
    if(trackID != nil) {
        NSString *clickID = [Common getClickIDForPage:pageName];
        NSString *dateString = [Common getLogDate];
        if(clickID != nil) {
            Events *event = [[Events alloc] initEventPageclickGUID:clickID cID:[Common getTrackID] customParameter:parameter logDate:dateString];
            Session *session =   [Session  sharedInstance];
            [session.eventArray addObject:event];
            [self trackEventSession];
        }
    }
    else {
        [Common showAlertWithTitle:@"Missing Configuration" andMessage:@"Please check .plist file and set appropriate values"];
    }
}

-(void) trackEventSession {
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(sendEvent) userInfo:nil repeats:YES];
    }
    
}

-(void) stopSending {
    NSLog(@"Timer stopped===========>>>>> ");
    [_timer invalidate];
    _timer = nil;
}

-(void) sendEvent{
    Session *session = [Session sharedInstance];
    NSString *eventURL = [Common getEventURL];
    NSLog(@"Session Count ===========>>>>> %lu", (unsigned long)[session.eventArray count]);
    if ([session.eventArray count] > 0 ) {
        Events *event = session.eventArray.firstObject;
        NSString * postString = [self generateEventsPostString:event];
        NSLog(@"Event Post String================>>>>> %@",postString);
        Webservice *service = [Webservice sharedInstance];
        
        [service  sendRequestToURL:eventURL withData:postString session:event success: ^(NSData *data, Events *event, NSError *error) {
            if(data != nil) {
                
                NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                NSLog(@"================>>>>> %@",string);
                if([session.eventArray containsObject:event]) {
                    NSLog(@"Page name===========>>>>> %@", event.clickGUID);
                    [session.eventArray removeObject:event];
                    
                }
            } else {
                if([session.eventArray containsObject:event]) {
                    NSLog(@"Page name===========>>>>> %@", event.clickGUID);
                    [session.eventArray removeObject:event];
                    
                }
                
            }
            

        }];
        
    } else {
        [self stopSending];
    }
}

-(NSString *) generateEventsPostString:(Events *)event {
    
    
    NSString *params = [NSString stringWithFormat:@"cID=%@&clickGUID=%@&logdate=%@",event.cID,event.clickGUID,event.logDate];
    for(id key in event.userDictionary) {
        id value = [event.userDictionary objectForKey:key];
        NSString * customValue = [NSString stringWithFormat:@"&customName=%@&customValue=%@",key,value];
        params = [params stringByAppendingString:customValue];
    }
    return params;
}


@end
