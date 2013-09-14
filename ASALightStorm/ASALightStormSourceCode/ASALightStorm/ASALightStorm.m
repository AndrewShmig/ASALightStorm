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
#import <CoreData/CoreData.h>
#import "ASALightStorm.h"
#import "ASALightStormProfile.h"


// -- Public methods -- //
@implementation ASALightStorm {

//    Core data stack
    NSManagedObjectModel *_stormManagedObjectModel;
    NSManagedObjectContext *_stormManagedObjectContext;
    NSPersistentStoreCoordinator *_stormPersistentStoreCoordinator;
}

#pragma mark - Main

+ (instancetype)sharedStorm {

    static ASALightStorm *_sharedStorm = nil;
    dispatch_once_t predicate;

    dispatch_once(&predicate, ^
    {
        _sharedStorm = [[ASALightStorm alloc] init];
    });

    return _sharedStorm;
}

- (BOOL)saveStormManagedObjectContext {

    NSError *error = nil;

    if (![[self stormManagedObjectContext] save:&error]) {

        NSLog(@"==> Error while saving storm context: %@, %@", error, [error userInfo]);
        return NO;
    }

    return YES;
}

- (NSManagedObjectModel *)stormManagedObjectModel {

    if (nil != _stormManagedObjectModel)
        return _stormManagedObjectModel;

    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ASALightStorm"
                                              withExtension:@"momd"];
    _stormManagedObjectModel = [[NSManagedObjectModel alloc]
                                                      initWithContentsOfURL:modelURL];

    return _stormManagedObjectModel;
}

- (NSPersistentStoreCoordinator *)stormPersistentStoreCoordinator {

    if (nil != _stormPersistentStoreCoordinator)
        return _stormPersistentStoreCoordinator;

    NSURL *stormStore = [[[[NSFileManager defaultManager]
                                          URLsForDirectory:NSDocumentDirectory
                                                 inDomains:NSUserDomainMask]
                                          lastObject]
                                          URLByAppendingPathComponent:@"ASALightStorme.sqlite"];

    _stormPersistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]
                                                                      initWithManagedObjectModel:[self stormManagedObjectModel]];

    if (nil != _stormPersistentStoreCoordinator) {

        NSError *error = nil;

        if (![_stormPersistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                            configuration:nil
                                                                      URL:stormStore
                                                                  options:nil
                                                                    error:&error]) {
            NSLog(@"==> Error while adding persistent store: %@, %@", error, [error userInfo]);
            abort();
        }
    }

    return _stormPersistentStoreCoordinator;
}

- (NSManagedObjectContext *)stormManagedObjectContext {

    if (nil != _stormManagedObjectContext)
        return _stormManagedObjectContext;

    NSPersistentStoreCoordinator *stormCoordinator = [self stormPersistentStoreCoordinator];
    if (nil != stormCoordinator) {

        _stormManagedObjectContext = [[NSManagedObjectContext alloc] init];
        [_stormManagedObjectContext setPersistentStoreCoordinator:stormCoordinator];
    }

    return _stormManagedObjectContext;
}

#pragma mark - Profile

- (ASALightStormProfile *)createProfileWithName:(NSString *)name
                                    andPassword:(NSString *)password {

    ASALightStormProfile *newProfile = [[ASALightStormProfile alloc]
                                                              initWithName:name
                                                               andPassword:password];

    return newProfile;
}

- (ASALightStormProfile *)createProfileWithName:(NSString *)name {

    ASALightStormProfile *newProfile = [[ASALightStormProfile alloc]
                                                              initWithName:name
                                                               andPassword:@""];

    return newProfile;
}

- (ASALightStormProfile *)loginWithProfileWithName:(NSString *)name
                                       andPassword:(NSString *)password {

//    TODO: loginWithProfileWithName:andPassword:
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]
                                                    initWithEntityName:@"CDProfile"];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@ AND passwordHash = %@",
                                                              name,
                                                              password];
    [fetchRequest setPredicate:predicate];

    NSArray *result = [[self stormManagedObjectContext]
                             executeFetchRequest:fetchRequest
                                           error:nil];

//    no such name & password
    if (0 == [result count])
        return nil;

//    name & password exist
    return (ASALightStormProfile *) [result lastObject];
}

- (BOOL)destroyProfileWithName:(NSString *)name andPassword:(NSString *)password {

//    TODO: destroyProfileWithName:andPassword:
}

- (BOOL)destroyProfileWithName:(NSString *)name {

//    TODO: sestroyProfileWithName:
}

- (BOOL)destroyAllProfiles {

//    TODO: destroyAllProfiles
}

@end