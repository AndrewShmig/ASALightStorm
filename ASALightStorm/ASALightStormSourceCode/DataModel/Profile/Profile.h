//
//  Profile.h
//  ASALightStorm
//
//  Created by AndrewShmig on 9/14/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Profile : NSManagedObject

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * passwordHash;
@property (nonatomic, retain) NSSet *adblocks;
@property (nonatomic, retain) NSSet *bookmarks;
@property (nonatomic, retain) NSSet *downloads;
@property (nonatomic, retain) NSSet *filters;
@property (nonatomic, retain) NSSet *proxies;
@property (nonatomic, retain) NSSet *tabs;
@end

@interface Profile (CoreDataGeneratedAccessors)

- (void)addAdblocksObject:(NSManagedObject *)value;
- (void)removeAdblocksObject:(NSManagedObject *)value;
- (void)addAdblocks:(NSSet *)values;
- (void)removeAdblocks:(NSSet *)values;

- (void)addBookmarksObject:(NSManagedObject *)value;
- (void)removeBookmarksObject:(NSManagedObject *)value;
- (void)addBookmarks:(NSSet *)values;
- (void)removeBookmarks:(NSSet *)values;

- (void)addDownloadsObject:(NSManagedObject *)value;
- (void)removeDownloadsObject:(NSManagedObject *)value;
- (void)addDownloads:(NSSet *)values;
- (void)removeDownloads:(NSSet *)values;

- (void)addFiltersObject:(NSManagedObject *)value;
- (void)removeFiltersObject:(NSManagedObject *)value;
- (void)addFilters:(NSSet *)values;
- (void)removeFilters:(NSSet *)values;

- (void)addProxiesObject:(NSManagedObject *)value;
- (void)removeProxiesObject:(NSManagedObject *)value;
- (void)addProxies:(NSSet *)values;
- (void)removeProxies:(NSSet *)values;

- (void)addTabsObject:(NSManagedObject *)value;
- (void)removeTabsObject:(NSManagedObject *)value;
- (void)addTabs:(NSSet *)values;
- (void)removeTabs:(NSSet *)values;

@end
