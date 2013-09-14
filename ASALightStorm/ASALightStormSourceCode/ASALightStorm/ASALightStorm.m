//
// Created by AndrewShmig on 9/9/13.
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
#import "ASALightStorm.h"
#import "ASALightStormProfile.h"


// -- Public methods -- //
@implementation ASALightStorm
{
//    Core data stack
    NSManagedObjectModel *_stormManagedObjectModel;
    NSManagedObjectContext *_stormManagedObjectContext;
    NSPersistentStoreCoordinator *_stormPersistentStoreCoordinator;
}

#pragma mark - Main

+ (instancetype)sharedStorm
{
    static ASALightStorm *_sharedStorm = nil;
    dispatch_once_t predicate;

    dispatch_once(&predicate, ^{
        _sharedStorm = [[ASALightStorm alloc] init];
    });

    return _sharedStorm;
}

- (NSManagedObjectModel *)stormManagedObjectModel
{
//    TODO: storm managed object
}

- (NSPersistentStoreCoordinator *)stormPersistentStoreCoordinator
{
//    TODO: storm persistent store coordinator
}

- (NSManagedObjectContext *)stormManagedObjectContext
{
//    TODO: storm managed object context
}

#pragma mark - Profile

- (ASALightStormProfile *)createProfileWithName:(NSString *)name
                                    andPassword:(NSString *)password
{
//    TODO
}

- (ASALightStormProfile *)createProfileWithName:(NSString *)name
{
//    TODO
}

- (BOOL)destroyProfileWithName:(NSString *)name andPassword:(NSString *)password
{
//    TODO
}

- (BOOL)destroyProfileWithName:(NSString *)name
{
//    TODO
}

- (BOOL)destroyAllProfiles
{
//    TODO
}

- (BOOL)loginWithProfileWithName:(NSString *)name
                     andPassword:(NSString *)password
{
//    TODO
}
@end