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


@implementation ASALightStormProfile
{
    CDProfile *_profileCD;
}

#pragma mark - Init methods

- (instancetype)initWithName:(NSString *)name
                 andPassword:(NSString *)password {

    if((self = [super init])){

//      trying to login with name and password
        ASALightStormProfile *profile = [[ASALightStorm sharedStorm]
                                                        loginWithProfileWithName:name
                                                                     andPassword:password];
//      profile does not exist so we should create it
        if(nil == profile){

            _profileCD = [[CDProfile alloc] init];
            _profileCD.createdAt = [NSDate date];
            _profileCD.name = name;
            _profileCD.passwordHash = nil; //TODO: password hash must be here

            if(![[ASALightStorm sharedStorm] saveStormManagedObjectContext]){
                return nil;
            }
        } else {

            _profileCD = profile->_profileCD;
        }
    }

    return self;
}

#pragma mark - Private

@end