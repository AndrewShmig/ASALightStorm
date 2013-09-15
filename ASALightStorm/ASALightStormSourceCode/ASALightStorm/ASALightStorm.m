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
#import "NSString+SHA512.h"


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

@end