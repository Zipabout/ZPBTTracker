//
//  Webservice.m
//  Zipp.to
//
//  Created by Siju Satheesachandran on 06/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
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
    
    [urlRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
            NSLog(@"response status code: %ld", (long)[httpResponse statusCode]);
             success(nil,track,error);
        } else if(data != nil)  {
             success(data,track,nil);
        }
        
        
    }];
    
    [dataTask resume];
    
}



@end
