//
//  ZPBTSessionManagerTests.m
//  ZPBTTracker
//
//  Created by Zipabout on 27/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ZPBTSessionManager.h"
#import "Common.h"
#import "Session.h"

@interface ZPBTSessionManagerTests : XCTestCase

@end
ZPBTSessionManager *sessionManager = nil;
Session *session = nil;


@implementation ZPBTSessionManagerTests

- (void)setUp {
    sessionManager = [ZPBTSessionManager sharedInstance];
    session = [Session sharedInstance];
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSessionMangerObjectCreated {
    XCTAssertNotNil(sessionManager, "session manager object created");
    XCTAssertNotNil(session, "session manager object created");
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testSessionInPage{
    [sessionManager trackSessionInPage:@"TestingPage"];
}

@end
