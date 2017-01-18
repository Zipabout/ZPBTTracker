//
//  Events.h
//  Zipp.to
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Events : NSObject

@property (nonatomic, readonly) NSString *cID;
@property (nonatomic, readonly) NSString *clickGUID;
@property (nonatomic, readonly) NSDictionary *userDictionary;
@property (nonatomic, readonly) NSString *logDate;

- (instancetype)initEventPageclickGUID:(NSString*)clickGUID cID:(NSString*)cID customParameter:(NSDictionary *)userDictionary logDate:(NSString*) logdate;
@end
