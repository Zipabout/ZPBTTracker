//
//  PageSession.m
//  ZPBTTracker
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import "PageSession.h"

@interface PageSession ()

@end

@implementation PageSession

- (instancetype)initWithSession:(NSString*)isNewSession cID:(NSString*)cID clickGUID:(NSString*)clickGUID c:(NSString*)c userGUID:(NSString*)userGUID referrer:(NSString*)referrer clickdestination:(NSString*)clickdestination logDate:(NSString *)logdate
{
    self = [super init];
    if (self)
    {
        _isNewSession = isNewSession;
        _cID = cID;
        _clickGUID = clickGUID;
        _c = c;
        _userGUID = userGUID;
        _isNewSession = isNewSession;
        _referrer= referrer;
        _clickdestination = clickdestination;
        _logdate = logdate;
    }
    return self;
}


@end
