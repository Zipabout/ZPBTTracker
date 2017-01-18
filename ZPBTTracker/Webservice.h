//
//  Webservice.h
//  Zipp.to
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PageSession.h"
typedef void (^ SuccessBlock)(NSData *data, id pageSession,  NSInteger responseCode);

@interface Webservice : NSObject
+ (instancetype)sharedInstance;
-(void) sendRequestToURL:(NSString *)URL withData:(NSString *)postString session:(id) pageSession  success:(SuccessBlock)success;
@end
