//
//  Parameter.m
//  ZPBTTracker
//
//  Created by Zipabout on 13/02/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import "Parameter.h"

@implementation Parameter
- (instancetype)initParameterGUID:(NSString*)userGUID cID:(NSString*)cID customParameter:(NSString *)parameter methodName:(NSString*) methodName {
    self = [super init];
    if (self)
    {
        
        _userGUID = userGUID;
        _cID = cID;
        _parameter = parameter;
        _methodName =methodName;
        
    }
    return self;
    
}
@end
