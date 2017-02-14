//
//  CommonTests.m
//  ZPBTTracker
//
//  Created by Zipabout on 27/01/2017.
//  Copyright © 2017 Zipabout. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Common.h"

@interface CommonTests : XCTestCase
    
    @end

@implementation CommonTests
    
    
- (void)setUp {
    
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}
    
- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
    
- (void) testShowAlert {
    [Common showAlertWithTitle:@"Info" andMessage:@"This is a info message"];
}
    
- (void) testsetPageClickID {
    [Common setPageClickID:@"12345" forPage:@"Testing"];
    NSString *clickID = [Common getClickIDForPage:@"Testing"];
    XCTAssertEqualObjects(clickID, @"12345", "click id should be 12345");
    
    NSString *clickIDNil = [Common getClickIDForPage:@"Testing123"];
    XCTAssertNil(clickIDNil, "should be nil");
}
    
    
- (void) testGetEventURL {
    // given
    NSString *trackID = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"TrackID"];
    if (trackID !=nil) {
        NSString *eventURL = [NSString stringWithFormat: @"https://c%@.zpbt.uk/sdk/zpbt_logcustom.aspx",trackID];
        NSString *generatedEventURL = [Common getEventURL];
        XCTAssertTrue(generatedEventURL = eventURL, "eventURL generating correctly");
        
    } else {
        NSString *generatedEventURL = [Common getEventURL];
        XCTAssertTrue(generatedEventURL = @"", "TrackID not set in info plist");
    }
    
}
    
- (void) testAutomaticSessionTracking {
    NSNumber *automaticTracking = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"AutomaticTracking"];
    NSInteger  num = [[Common automaticSessionTracking] integerValue];
    if (automaticTracking != nil) {
        if ([automaticTracking integerValue] == 1) {
            XCTAssertTrue( num = 1, "automaticTracking is set 1 autotracking");
        } else if ([automaticTracking integerValue] == 0)  {
            XCTAssertTrue( num = 0,  "automaticTracking is set 0 mannual tracking");
        }
    } else {
        XCTAssertNil(automaticTracking, "should be nil");
    }
}
    
- (void) testGetLogDate {
    // given
    NSString *str = [Common getLogDate];
    XCTAssertNotNil(str, "Should not be nil");
    
}
    
    
- (void)testGetSessionURL {
    // given
    NSString *trackID = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"TrackID"];
    if (trackID !=nil) {
        NSString *sessionURL = [NSString stringWithFormat: @"https://c%@.zpbt.uk/sdk/zpbt_trackclick.aspx",trackID];
        NSString *generatedSessionURL = [Common getSessionURL];
        XCTAssertTrue(generatedSessionURL = sessionURL, "sessionURL generating correctly");
        
    } else {
        NSString *generatedSessionURL = [Common getSessionURL];
        XCTAssertTrue(generatedSessionURL = @"", "TrackID not set in info plist");
    }
    
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}
    
    
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
    
    @end
