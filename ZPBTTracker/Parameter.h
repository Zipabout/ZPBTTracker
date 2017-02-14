//
//  Parameter.h
//  ZPBTTracker
//
//  Created by Zipabout on 13/02/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Parameter : NSObject

@property (nonatomic, readonly) NSString *cID;
@property (nonatomic, readonly) NSString *methodName;
@property (nonatomic, readonly) NSString *parameter;
@property (nonatomic, readonly) NSString *userGUID;

- (instancetype)initParameterGUID:(NSString*)clickGUID cID:(NSString*)cID customParameter:(NSString *)parameter methodName:(NSString*) methodName;




@end
