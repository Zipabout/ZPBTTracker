//
//  WebserviceTests.m
//  ZPBTTracker
//
//  Created by Zipabout on 27/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Webservice.h"
#import "Common.h"
#import "PageSession.h"



@interface WebserviceTests : XCTestCase
    
    
    
    @end
Webservice *webservice = nil;

@implementation WebserviceTests
    
- (void)setUp {
    webservice = [Webservice sharedInstance];
   
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
    
    
- (void)testWebserviceObjectCreated {
    
    XCTAssertNotNil(webservice, "should not be nil");

    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
    
    
- (void)testWebserviceClling {
    
      [self measureBlock:^{
      XCTestExpectation *exp = [self expectationWithDescription:@"Track Session"];
    PageSession *pageSession = [[PageSession alloc] initWithSession:@"1" cID:[Common getTrackID] clickGUID:@"123456" c:@"0" userGUID:@"Test" referrer:@"ViewControllerReferrer" clickdestination:@"ViewControllerDestination" logDate:[Common getLogDate]];
    XCTAssertNotNil(pageSession);
    NSString *sessionURL = [Common getSessionURL];
    
    NSString *params = [NSString stringWithFormat:@"isNewSession=%@&cID=%@&clickGUID=%@&c=%@&userGUID=%@&referrer=%@&clickdestination=%@&ssl=true&logdate=%@",pageSession.isNewSession,pageSession.cID,pageSession.clickGUID,pageSession.c,pageSession.userGUID,pageSession.referrer,pageSession.clickdestination,pageSession.logdate];
    
    [webservice  sendRequestToURL:sessionURL withData:params session:pageSession success: ^(NSData *data,PageSession *pageSession,NSInteger responseCode) {
        
        
        if(responseCode == 200) {
            XCTAssert(responseCode);
            XCTAssertEqual(responseCode, 200, "response recived sucess");
            [exp fulfill];
        } else {
            XCTAssertNil(data);
            [exp fulfill];
        }
    }];
    [self waitForExpectationsWithTimeout:30 handler:^(NSError *error) {
        // handle failure
         XCTAssertNil(error);
    }];
           }];
    
}
    
    
    
    
    
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
    
    @end
