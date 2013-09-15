//
// Created by AndrewShmig on 9/14/13.
//
// Copyright (c) 2013 Andrew Shmig
// 
// Permission is hereby granted, free of charge, to any person 
// obtaining a copy of this software and associated documentation 
// files (the "Software"), to deal in the Software without 
// restriction, including without limitation the rights to use, 
// copy, modify, merge, publish, distribute, sublicense, and/or 
// sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following 
// conditions:
// 
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
// FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
// THE SOFTWARE.
//
#import "ASALightStormProfile.h"
#import "ASALightStorm.h"
#import "CDProfile.h"
#import "NSString+SHA512.h"
#import <objc/runtime.h>


@implementation ASALightStormProfile
{
    CDProfile *_profileCD;
}

#pragma mark - Class methods

+ (instancetype)profileWithName:(NSString *)name
                       password:(NSString *)password
{
    NSLog(@"%s", __FUNCTION__);

    ASALightStormProfile *newProfile;

    if (![ASALightStormProfile ASALS_existsProfileWithName:name]) {
        newProfile = [[ASALightStormProfile alloc]
                                            initWithName:name
                                             andPassword:password];
    } else {
        return nil;
    }

    return newProfile;
}

+ (instancetype)profileWithName:(NSString *)name
{
    NSLog(@"%s", __FUNCTION__);

    return [ASALightStormProfile profileWithName:name
                                        password:@""];
}

+ (instancetype)logInWithName:(NSString *)name
                     password:(NSString *)password
{
    NSLog(@"%s", __FUNCTION__);

    ASALightStormProfile *profile = [ASALightStormProfile ASALS_profileWithName:name
                                                                       password:password];

    return profile;
}

+ (void)destroyProfileWithName:(NSString *)name
                      password:(NSString *)password
{
    NSLog(@"%s", __FUNCTION__);

    ASALightStormProfile *profile = [ASALightStormProfile ASALS_profileWithName:name
                                                                       password:password];

    if (nil != profile)
        [ASALightStormProfile destroyProfile:profile];
}

+ (void)destroyProfileWithName:(NSString *)name
{
    NSLog(@"%s", __FUNCTION__);

    [ASALightStormProfile destroyProfileWithName:name
                                        password:@""];
}

+ (void)destroyProfile:(ASALightStormProfile *)profile
{
    NSLog(@"%s", __FUNCTION__);

    if (nil != profile) {
        [[[ASALightStorm sharedStorm] stormManagedObjectContext]
                         deleteObject:profile->_profileCD];
        profile->_profileCD = nil;
    }
}

+ (NSArray *)profiles
{
    NSLog(@"%s", __FUNCTION__);

//    configuring fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                                    initWithEntityName:@"Profile"];

//    executing fetch request
    NSError *error = nil;
    NSArray *profiles = [[[ASALightStorm sharedStorm] stormManagedObjectContext]
                                         executeFetchRequest:fetchRequest
                                                       error:&error];
    NSLog(@"Error: %@, %@", error, [error userInfo]);

//    converting CDProfiles to ASALightStormProfiles
    NSMutableArray *lightStormProfiles = [NSMutableArray array];
    for (CDProfile *profile in profiles) {
        ASALightStormProfile *convertedProfile = [[ASALightStormProfile alloc]
                                                                        init];
        convertedProfile->_profileCD = profile;

        [lightStormProfiles addObject:convertedProfile];
    }

    return lightStormProfiles;
}

+ (void)destroyAll
{
    NSLog(@"%s", __FUNCTION__);

    NSArray *profiles = [ASALightStormProfile profiles];

    for (ASALightStormProfile *profile in profiles) {
        [profile destroy];
    }
}

#pragma mark - Init methods

- (instancetype)initWithName:(NSString *)name
                 andPassword:(NSString *)password
{
    NSLog(@"%s", __FUNCTION__);

    self = [super init];

    if (nil != self) {
        _profileCD = (CDProfile *) [NSEntityDescription insertNewObjectForEntityForName:@"Profile"
                                                                 inManagedObjectContext:[[ASALightStorm sharedStorm]
                                                                                                        stormManagedObjectContext]];

        _profileCD.name = name;
        _profileCD.passwordHash = [password SHA512];
        _profileCD.createdAt = [NSDate date];

        if (![[ASALightStorm sharedStorm] saveStormManagedObjectContext]) {
            return nil;
        }
    }

    return self;
}

#pragma mark - Instance methods

- (CDProfile *)profile
{
    NSLog(@"%s", __FUNCTION__);

    return _profileCD;
}

- (void)destroy
{
    NSLog(@"%s", __FUNCTION__);

    [ASALightStormProfile destroyProfile:self];
}

- (NSString *)description
{
    NSMutableDictionary *propertiesDic = [NSMutableDictionary dictionary];
    unsigned propertiesCount;
    objc_property_t *properties = class_copyPropertyList([CDProfile class], &propertiesCount);

    for(int i=0; i<propertiesCount; i++){
        objc_property_t property = properties[i];

        NSString *key = [NSString stringWithFormat:@"%s", property_getName(property)];
        NSString *propertyType = [[NSString stringWithUTF8String:property_getAttributes(property)]
                                            componentsSeparatedByString:@","][0];

        if (![propertyType isEqualToString:@"T@\"NSSet\""])
            propertiesDic[key] = [_profileCD valueForKey:key];
    }

    return [propertiesDic description];
}

#pragma mark - Private

+ (BOOL)ASALS_existsProfileWithName:(NSString *)name
{
    NSLog(@"%s", __FUNCTION__);

//    configuring fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                                    initWithEntityName:@"Profile"];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@",
                                                              name];
    [fetchRequest setPredicate:predicate];

//    executing fetch request
    NSError *error = nil;
    NSArray *fetchResult = [[[ASALightStorm sharedStorm]
                                            stormManagedObjectContext]
                                            executeFetchRequest:fetchRequest
                                                          error:&error];
    NSLog(@"Error: %@, %@", error, [error userInfo]);

//    no profile with such name
    if (0 == [fetchResult count])
        return NO;

    return YES;
}

+ (ASALightStormProfile *)ASALS_profileWithName:(NSString *)name
                                       password:(NSString *)password
{
    NSLog(@"%s", __FUNCTION__);

//    configuring fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                                    initWithEntityName:@"Profile"];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name == %@) && (passwordHash == %@)",
                                                              name,
                                                              [password SHA512]];
    [fetchRequest setPredicate:predicate];

//    performing fetch request
    NSError *error = nil;
    NSArray *queryResult = [[[ASALightStorm sharedStorm]
                                            stormManagedObjectContext]
                                            executeFetchRequest:fetchRequest
                                                          error:&error];

    NSLog(@"Error: %@, %@", error, [error userInfo]);

//    no profile with such name && password
    if (0 == [queryResult count])
        return nil;

//    wrapping CDProfile in ASALightStormProfile
    ASALightStormProfile *profile = [[ASALightStormProfile alloc] init];
    profile->_profileCD = (CDProfile *) [queryResult lastObject];

    return profile;
}

@end