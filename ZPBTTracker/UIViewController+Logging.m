//
//  UIViewController+Logging.m
//  Zipp.to
//
//  Created by Zipabout on 05/01/2017.
//  Copyright © 2017 Siju Satheesachandran. All rights reserved.
//



#import "UIViewController+Logging.h"
#import "objc/runtime.h"
#import "ZPBTSessionManager.h"
#import "Common.h"

@implementation UIViewController (Logging)


/*!
 @brief Track opened view using this method. When ever user opened the view the method viewWillAppear will called. Through this we will get the current page name.
 
 @discussion Track opened view using this method. When ever user opened the view the method viewWillAppear will called. Through this we will get the current page name.
 
 */

- (void) logged_viewWillAppear:(BOOL)animated {
    [self logged_viewWillAppear:animated];
    // geting the manual configuration for autotracking. If YES go for automatic tracking else manual tracking
    NSNumber *tracking = [Common automaticSessionTracking];
    
    if(tracking != nil) {
        NSInteger track = [tracking integerValue];
        if(track == 1) {
            NSBundle *bundleOfApp = [NSBundle mainBundle];
            NSLog(@"%@", bundleOfApp.bundlePath);
            
            
            NSBundle *bundleOfT = [NSBundle bundleForClass:[self class]];
            NSLog(@"%@", bundleOfT.bundlePath);
            
            if([bundleOfT.bundlePath hasPrefix:bundleOfApp.bundlePath]) {
                NSLog(@"logged view did appear for %@", NSStringFromClass([self class]));
                NSString *className = [NSString stringWithFormat:@"%@", [self class]];
                ZPBTSessionManager *zpbtSession = [ZPBTSessionManager sharedInstance];
                [zpbtSession trackSessionInPage:className];
            }
        }
    } else {
        [Common showAlertWithTitle:@"Missing Configuration" andMessage:@"Please check .plist file and set appropriate values"];
        
    }
}



+ (void)load {
    static dispatch_once_t once_token;
    dispatch_once(&once_token,  ^{
        SEL viewWillAppearSelector = @selector(viewWillAppear:);
        SEL viewWillAppearLoggerSelector = @selector(logged_viewWillAppear:);
        Method originalMethod = class_getInstanceMethod(self, viewWillAppearSelector);
        Method extendedMethod = class_getInstanceMethod(self, viewWillAppearLoggerSelector);
        method_exchangeImplementations(originalMethod, extendedMethod);
    });
}

@end
