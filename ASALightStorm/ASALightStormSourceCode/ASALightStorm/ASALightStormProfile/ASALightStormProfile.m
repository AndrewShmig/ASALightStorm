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


@implementation ASALightStormProfile
{
    CDProfile *_profileCD;
}

#pragma mark - Class methods

+ (instancetype)profileWithName:(NSString *)name
                       password:(NSString *)password
{
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
    return [ASALightStormProfile profileWithName:name
                                        password:@""];
}

+ (instancetype)logInWithName:(NSString *)name
                     password:(NSString *)password
{
    ASALightStormProfile *profile = [ASALightStormProfile ASALS_profileWithName:name
                                                                       password:password];

    return profile;
}

+ (void)destroyProfileWithName:(NSString *)name
                      password:(NSString *)password
{
    ASALightStormProfile *profile = [ASALightStormProfile ASALS_profileWithName:name
                                                                       password:password];

    if (nil != profile)
        [ASALightStormProfile destroyProfile:profile];
}

+ (void)destroyProfileWithName:(NSString *)name
{
    [ASALightStormProfile destroyProfileWithName:name
                                        password:@""];
}

+ (void)destroyProfile:(ASALightStormProfile *)profile
{
    if (nil != profile) {
        [[[ASALightStorm sharedStorm] stormManagedObjectContext]
                         deleteObject:profile->_profileCD];
        profile->_profileCD = nil;
    }
}

+ (NSArray *)profiles
{
//    configuring fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                                    initWithEntityName:@"CDProfile"];

//    executing fetch request
    NSArray *profiles = [[[ASALightStorm sharedStorm] stormManagedObjectContext]
                                         executeFetchRequest:fetchRequest
                                                       error:nil];

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
    NSArray *profiles = [ASALightStormProfile profiles];

    for (ASALightStormProfile *profile in profiles) {
        [profile destroy];
    }
}

#pragma mark - Init methods

- (instancetype)initWithName:(NSString *)name
                 andPassword:(NSString *)password
{

    if ((self = [super init])) {

        _profileCD = [[CDProfile alloc] init];
        _profileCD.createdAt = [NSDate date];
        _profileCD.name = name;
        _profileCD.passwordHash = [password SHA512];

        if (![[ASALightStorm sharedStorm] saveStormManagedObjectContext]) {
            return nil;
        }
    }

    return self;
}

#pragma mark - Instance methods

- (CDProfile *)profile
{
    return _profileCD;
}

- (void)destroy
{
    [ASALightStormProfile destroyProfile:self];
}

#pragma mark - Private

+ (BOOL)ASALS_existsProfileWithName:(NSString *)name
{
//    configuring fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                                    initWithEntityName:@"CDProfile"];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name == %@)",
                                                              name];
    [fetchRequest setPredicate:predicate];

//    executing fetch request
    NSArray *fetchResult = [[[ASALightStorm sharedStorm]
                                            stormManagedObjectContext]
                                            executeFetchRequest:fetchRequest
                                                          error:nil];

//    no profile with such name
    if (0 == [fetchResult count])
        return NO;

    return YES;
}

+ (ASALightStormProfile *)ASALS_profileWithName:(NSString *)name
                                       password:(NSString *)password
{
//    configuring fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                                    initWithEntityName:@"CDProfile"];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name == %@) && (passwordHash == %@)",
                                                              name,
                                                              [password SHA512]];
    [fetchRequest setPredicate:predicate];

//    performing fetch request
    NSArray *queryResult = [[[ASALightStorm sharedStorm]
                                            stormManagedObjectContext]
                                            executeFetchRequest:fetchRequest
                                                          error:nil];
//    no profile with such name && password
    if (0 == [queryResult count])
        return nil;

//    wrapping CDProfile in ASALightStormProfile
    ASALightStormProfile *profile = [[ASALightStormProfile alloc] init];
    profile->_profileCD = (CDProfile *) [queryResult lastObject];

    return profile;
}

@end