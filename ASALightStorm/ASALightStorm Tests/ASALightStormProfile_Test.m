//
//  ASALightStormProfile_Test.m
//  ASALightStorm
//
//  Created by AndrewShmig on 9/21/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ASALightStormProfile.h"


@interface ASALightStormProfile_Test : XCTestCase
@end


@implementation ASALightStormProfile_Test

#pragma mark - profileWithName:password:

- (void)testProfileWithNamePassword1
{
    //    setting up
    [ASALightStormProfile destroyAll];
    
    //    testing
    ASALightStormProfile *me = [ASALightStormProfile profileWithName:@"Andrew"
                                                            password:@"123"];
    
    XCTAssertNotNil(me, @"\"me\" can not be nil");
    
    //    cleaning
    [ASALightStormProfile destroyAll];
}

- (void)testProfileWithNamePassword2
{
    //    setting up
    [ASALightStormProfile destroyAll];
    
    //    testing
    __unused ASALightStormProfile *first = [ASALightStormProfile profileWithName:@"Andrew" password:@"123"];
    ASALightStormProfile *second = [ASALightStormProfile profileWithName:@"Andrew" password:@"123"];
    
    XCTAssertNil(second, @"\"second\" should be nil");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

- (void)testProfileWithNamePassword3
{
//    setting up
    [ASALightStormProfile destroyAll];
    
//    testing
    ASALightStormProfile *one = [ASALightStormProfile profileWithName:@"AndrewShmig" password:@"123"];
    ASALightStormProfile *two = [ASALightStormProfile profileWithName:@"Igori" password:@"123"];
    
    XCTAssertTrue(nil != one && nil != two, @"\"one\" and \"two\" can not be nils");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

- (void)testProfileWithNamePassword4
{
    //    setting
    [ASALightStormProfile destroyAll];
    
    //    testing
    ASALightStormProfile *one = [ASALightStormProfile profileWithName:nil
                                                             password:nil];
    
    XCTAssertNil(one, @"'one' should be nil");
    
    //    clearing
    [ASALightStormProfile destroyAll];
}

#pragma mark - profileWithName:

- (void)testProfileWithName1
{
//    setting up
    [ASALightStormProfile destroyAll];
    
//    testing
    ASALightStormProfile *me = [ASALightStormProfile profileWithName:@"Andrew"];
    
    XCTAssertNotNil(me, @"'me' can not be nil.");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

- (void)testProfileWithName2
{
//    setting up
    [ASALightStormProfile destroyAll];
    
//    testing
    __unused ASALightStormProfile *one = [ASALightStormProfile profileWithName:@"Andrew"];
    ASALightStormProfile *two = [ASALightStormProfile profileWithName:@"Andrew"];
    
    XCTAssertNil(two, @"'two' should not be nil.");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

- (void)testProfileWithName3
{
//    setting
    [ASALightStormProfile destroyAll];
    
//    testing
    ASALightStormProfile *one = [ASALightStormProfile profileWithName:@"Andrew"];
    ASALightStormProfile *two = [ASALightStormProfile profileWithName:@"Igori"];
    
    XCTAssertTrue(nil != one && nil != two, @"'one' and 'two' can not be nil.");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

- (void)testProfileWithName4
{
//    setting
    [ASALightStormProfile destroyAll];
    
//    testing
    ASALightStormProfile *one = [ASALightStormProfile profileWithName:nil];
    
    XCTAssertNil(one, @"'one' should be nil.");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

#pragma mark - logInWithName:password:

- (void)testLogInWithNamePassword1
{
//    setting up
    [ASALightStormProfile destroyAll];
    
//    testing
    [ASALightStormProfile profileWithName:@"Andrew"
                                 password:@"12345"];
    
    ASALightStormProfile *me = [ASALightStormProfile logInWithName:@"Andrew"
                                                          password:@"12345"];
    
    XCTAssertNotNil(me, @"'me' can not be nil");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

- (void)testLogInWithNamePassword2
{
//    setting up
    [ASALightStormProfile destroyAll];
    
//    testing
    [ASALightStormProfile profileWithName:@"Andrew"
                                 password:@"12345"];
    ASALightStormProfile *me = [ASALightStormProfile logInWithName:@"Andrew"
                                                          password:@"1"];
    
    XCTAssertNil(me, @"'me' should be nil");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

#pragma mark - destroyProfileWithName:password:

- (void)testDestroyProfileWithNamePassword1
{
//    setting
    [ASALightStormProfile destroyAll];
    
//    test
    [ASALightStormProfile profileWithName:@"Andrew"
                                 password:@"12345"];
    [ASALightStormProfile destroyProfileWithName:@"Andrew"
                                        password:@"12345"];
    
    XCTAssertTrue(0 == [[ASALightStormProfile profiles] count], @"Count should be 0");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

- (void)testDestroyProfileWithNamePassword2
{
//    setting
    [ASALightStormProfile destroyAll];
    
//    testing
    [ASALightStormProfile profileWithName:@"Andrew"
                                 password:@"1234"];
    [ASALightStormProfile destroyProfileWithName:@"Andrew"
                                        password:@"1"];
    
    XCTAssertTrue(0 != [[ASALightStormProfile profiles] count], @"Profiles should not be empty.");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

- (void)testDestroyProfileWithNamePassword3
{
//    setting
    [ASALightStormProfile destroyAll];
    
//    testing
    [ASALightStormProfile profileWithName:@"Andrew"
                                 password:@"12345"];
    [ASALightStormProfile destroyProfileWithName:@"Vasea"
                                        password:@"123"];
    
    XCTAssertTrue(0 != [[ASALightStormProfile profiles] count], @"Profiles should not be empty");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

#pragma mark - destroyProfileWithName

- (void)testDestroyProfileWithName1
{
//    setting
    [ASALightStormProfile destroyAll];
    
//    testing
    [ASALightStormProfile profileWithName:@"Andrew"];
    [ASALightStormProfile destroyProfileWithName:@"Andrew"];
    
    XCTAssertTrue(0 == [[ASALightStormProfile profiles] count], @"Profiles should be empty");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

- (void)testDestroyProfileWithName2
{
//    setting
    [ASALightStormProfile destroyAll];
    
//    testing
    [ASALightStormProfile profileWithName:@"Andrew"
                                 password:@"123"];
    [ASALightStormProfile destroyProfileWithName:@"Andrew"];
    
    XCTAssertTrue(0 != [[ASALightStormProfile profiles] count], @"Profiles should not be empty");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

#pragma mark - destroyProfile:

- (void)testDestroyProfile1
{
//    setting
    [ASALightStormProfile destroyAll];
    
//    testing
    ASALightStormProfile *one = [ASALightStormProfile profileWithName:@"Andrew"
                                                             password:@"1234"];
    [ASALightStormProfile destroyProfile:one];
    
    XCTAssertTrue(0 == [[ASALightStormProfile profiles] count], @"Profiles should be empty");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

#pragma mark - destroy

- (void)testDestroy1
{
//    setting
    [ASALightStormProfile destroyAll];
    
//    testing
    ASALightStormProfile *me = [ASALightStormProfile profileWithName:@"Andrew"
                                                            password:@"12345"];
    [me destroy];
    
    XCTAssertTrue(0 == [[ASALightStormProfile profiles] count], @"Profiles should be empty");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

#pragma mark - profiles

- (void)testProfiles1
{
//    setting
    [ASALightStormProfile destroyAll];
    
//    testing
    [ASALightStormProfile profileWithName:@"Andrew"];
    [ASALightStormProfile profileWithName:@"Igori"];
    [ASALightStormProfile profileWithName:@"Kids"];
    
    XCTAssertTrue(3 == [[ASALightStormProfile profiles] count], @"There should be 3 profiles");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

- (void)testProfiles2
{
//    setting
    [ASALightStormProfile destroyAll];
    
//    testing
    XCTAssertTrue(0 == [[ASALightStormProfile profiles] count], @"There should be no profiles");
    
//    clearing
    [ASALightStormProfile destroyAll];
}

@end
