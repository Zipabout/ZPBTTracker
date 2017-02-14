//
//  ZPBTEventManager.m
//  ZPBTTracker
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
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


/*
 @brief ZPBTEventManager provides functionality to pass customParameter objects as a key value pairs, whenever defined events occur in the application
 
 @param  pageName name of the ViewController name.
 @param  customParameter parameter passed to the event.
 
 @code
 
 NSMutableDictionary *customParameter = [NSMutableDictionary dictionary];
 [customParameter setObject: @"OXF"  forKey: @"destinationCRS"];
 [customParameter setObject: @"PAD" forKey:  @"originCRS"];
 
 zpbtEventManager *event = [zpbtEventManager sharedInstance];
 [event trackEventInPage:NSStringFromClass([self class]) customParameter:customParameter];

 @endcode

 */



- (void) trackEventInPage:(NSString *) pageName  customParameter: (NSDictionary *) parameter {
    if(parameter != nil) {
        NSString *trackID = [Common getTrackID];
        if(trackID != nil) {
            NSString *clickID = [Common getClickIDForPage:pageName];
            NSString *dateString = [Common getLogDate];
            if(clickID != nil) {
                Events *event = [[Events alloc] initEventPageclickGUID:clickID cID:[Common getTrackID] customParameter:parameter logDate:dateString];
                Session *session =   [Session  sharedInstance];
                [session.eventArray addObject:event];
                [self trackEventSession];
            } else {
                NSNumber *tracking = [Common automaticSessionTracking];
                if(tracking != nil) {
                    NSInteger track = [tracking integerValue];
                    if(track == 0) {
                        NSLog(@"Please add manual page session in viewWillAppear method to enable event tracking");
                    }
                }
            }
        }
        
        else {
            NSLog(@"Missing Configuration .plist. Please check .plist file and set appropriate values");
        }
    }
}

-(void) trackEventSession {
    if (_timer == nil) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(sendEvent) userInfo:nil repeats:YES];
    }
    
}

-(void) stopSending {

    [_timer invalidate];
    _timer = nil;
}

-(void) sendEvent{
    Session *session = [Session sharedInstance];
    NSString *eventURL = [Common getEventURL];

    if ([session.eventArray count] > 0 ) {
        Events *event = session.eventArray.firstObject;
        NSString * postString = [self generateEventsPostString:event];
     
        Webservice *service = [Webservice sharedInstance];
        
        [service  sendRequestToURL:eventURL withData:postString session:event success: ^(NSData *data, Events *event, NSInteger responseCode) {
            if(responseCode == 200) {
                
                if([session.eventArray containsObject:event]) {
    
                    [session.eventArray removeObject:event];
                    
                }
            } else {
                [self stopSending];
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
