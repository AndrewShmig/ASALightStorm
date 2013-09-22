//
//  ASALightStormProfile+Tab.m
//  ASALightStorm
//
//  Created by AndrewShmig on 9/21/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import "ASALightStormProfile+Tab.h"
#import "ASALightStormTab.h"
#import "CDTab.h"
#import "NSArray+isEmpty.h"


@implementation ASALightStormProfile (Tab)

#pragma mark - Instance methods

- (ASALightStormTab *)createTab
{
    ASALightStormTab *newTab = [[ASALightStormTab alloc] initWithProfile:self];

    return newTab;
}

- (void)closeAllTabs
{
    NSArray *openedTabs = [self openedTabs];
    
    for(CDTab *tab in openedTabs) {
        tab.isOpened = @NO;
    }
}

- (void)removeAllTabs
{
//    fetch filters
    NSUInteger limit = 0; // no limit
    
//    query
    NSArray *allTabs = [self ASAPrivateMethod_tabsWithPredicate:nil
                                                sortDescriptors:nil
                                                          limit:limit];
    for(CDTab *tab in allTabs) {
        [[[ASALightStorm sharedStorm] stormManagedObjectContext] deleteObject:tab];
    }
}

- (void)removeAllOpenedTabs
{
    NSArray *openedTabs = [self openedTabs];
    
    for(CDTab *tab in openedTabs) {
        [[[ASALightStorm sharedStorm] stormManagedObjectContext] deleteObject:tab];
    }
}

- (void)reopenLastTabs:(NSUInteger)count
{
    //    predicates & descriptors for data fetching
    NSSortDescriptor *sortByDateDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createdAt"
                                                                         ascending:YES];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isOpened == %@", @NO];
    NSUInteger limit = count;
    
    //    quering
    NSArray *result = [self ASAPrivateMethod_tabsWithPredicate:predicate
                                               sortDescriptors:@[sortByDateDescriptor]
                                                         limit:limit];
    for(CDTab *tab in result) {
        tab.isOpened = @YES;
    }
}

- (void)reopenLastTab
{
    [self reopenLastTabs:1];
}

- (NSArray *)openedTabs
{
//    predicates & descriptors for data fetching
    NSSortDescriptor *sortByDateDescriptor = [[NSSortDescriptor alloc] initWithKey:@"createdAt"
                                                                         ascending:YES];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"isOpened == %@", @YES];
    NSUInteger limit = 0; // no limit
    
//    returning query result
    return [self ASAPrivateMethod_tabsWithPredicate:predicate
                                    sortDescriptors:@[sortByDateDescriptor]
                                              limit:limit];
}

#pragma mark - Private methods

- (NSArray *)ASAPrivateMethod_tabsWithPredicate:(NSPredicate *)predicate
                                sortDescriptors:(NSArray *)descriptors
                                          limit:(NSUInteger)limit
{
    //    creating fetch request
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"CDTab"];
    
    //    configuring fetch request
    if(nil != predicate)
        [fetchRequest setPredicate:predicate];
    
    if(nil != descriptors)
        [fetchRequest setSortDescriptors:descriptors];
    
    [fetchRequest setFetchLimit:limit];
    
    //    performing fetch request
    NSArray *result = [[[ASALightStorm sharedStorm] stormManagedObjectContext]
                       executeFetchRequest:fetchRequest error:nil];
    
    return result;
}

@end
