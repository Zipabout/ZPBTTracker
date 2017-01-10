//
//  Events.m
//  Zipp.to
//
//  Created by Siju Satheesachandran on 06/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
//

#import "Events.h"


@implementation Events
- (instancetype)initEventPageclickGUID:(NSString*)clickGUID cID:(NSString*)cID customParameter:(NSDictionary *)userDictionary logDate:(NSString*) logdate {
    self = [super init];
    if (self)
    {
      
        _clickGUID = clickGUID;
        _cID = cID;
        _userDictionary = userDictionary;
        _logDate =logdate;

    }
    return self;
    
}
@end
