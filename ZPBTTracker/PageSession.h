//
//  PageSession.h
//  ZPBTTracker
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PageSession : NSObject

@property (nonatomic,copy, readonly) NSString *isNewSession;
@property (nonatomic,copy, readonly) NSString *cID;
@property (nonatomic, copy,readonly) NSString *clickGUID;
@property (nonatomic,copy, readonly) NSString *c;
@property (nonatomic, copy,readonly) NSString *userGUID;
@property (nonatomic, copy,readonly) NSString *referrer;
@property (nonatomic,copy, readonly) NSString *clickdestination;
@property (nonatomic,copy, readonly) NSString *logdate;


- (instancetype)initWithSession:(NSString*)isNewSession cID:(NSString*)cID clickGUID:(NSString*)clickGUID c:(NSString*)c userGUID:(NSString*)userGUID referrer:(NSString*)referrer clickdestination:(NSString*)clickdestination logDate:(NSString*) logdate;

@end
