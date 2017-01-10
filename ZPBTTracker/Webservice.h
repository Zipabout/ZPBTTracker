//
//  Webservice.h
//  Zipp.to
//
//  Created by Siju Satheesachandran on 06/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PageSession.h"
typedef void (^ SuccessBlock)(NSData *data, id pageSession,  NSError *error);

@interface Webservice : NSObject
+ (instancetype)sharedInstance;
-(void) sendRequestToURL:(NSString *)URL withData:(NSString *)postString session:(id) pageSession  success:(SuccessBlock)success;
@end
