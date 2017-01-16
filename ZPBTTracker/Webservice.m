//
//  Webservice.m
//  ZPBTTracker
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import "Webservice.h"


@implementation Webservice

+ (instancetype)sharedInstance {
    static Webservice *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Webservice alloc] init];
    });
    return sharedInstance;
}

-(void) sendRequestToURL:(NSString *)URL withData:(NSString *)postString  session:(id)track success:(SuccessBlock) success  {
    
    
    NSURLSessionConfiguration *defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration: defaultConfigObject delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    
    
    //Create an URLRequest
    NSURL *url = [NSURL URLWithString:URL];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    
    [urlRequest setHTTPMethod:@"POST"];
    
    NSData *requestdata = [postString dataUsingEncoding:NSUTF8StringEncoding];
    
    if (requestdata != nil) {
        NSURLSessionUploadTask *uploadTask = [defaultSession uploadTaskWithRequest:urlRequest fromData:requestdata completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            NSInteger responseCode = (long)[httpResponse statusCode];
            if (error) {
                
                success(nil,track, responseCode);
                
            } else if(data != nil)  {
                
                success(data,track,responseCode);
            }
            
            
        }];
        
        [uploadTask resume];
    }
    
    

    
}



@end
