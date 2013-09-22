//
//  CDProfile.h
//  ASALightStorm
//
//  Created by AndrewShmig on 9/22/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDAdBlock, CDBookmark, CDDownload, CDFilter, CDProxy, CDTab;

@interface CDProfile : NSManagedObject

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

@interface CDProfile (CoreDataGeneratedAccessors)

- (void)addAdblocksObject:(CDAdBlock *)value;
- (void)removeAdblocksObject:(CDAdBlock *)value;
- (void)addAdblocks:(NSSet *)values;
- (void)removeAdblocks:(NSSet *)values;

- (void)addBookmarksObject:(CDBookmark *)value;
- (void)removeBookmarksObject:(CDBookmark *)value;
- (void)addBookmarks:(NSSet *)values;
- (void)removeBookmarks:(NSSet *)values;

- (void)addDownloadsObject:(CDDownload *)value;
- (void)removeDownloadsObject:(CDDownload *)value;
- (void)addDownloads:(NSSet *)values;
- (void)removeDownloads:(NSSet *)values;

- (void)addFiltersObject:(CDFilter *)value;
- (void)removeFiltersObject:(CDFilter *)value;
- (void)addFilters:(NSSet *)values;
- (void)removeFilters:(NSSet *)values;

- (void)addProxiesObject:(CDProxy *)value;
- (void)removeProxiesObject:(CDProxy *)value;
- (void)addProxies:(NSSet *)values;
- (void)removeProxies:(NSSet *)values;

- (void)addTabsObject:(CDTab *)value;
- (void)removeTabsObject:(CDTab *)value;
- (void)addTabs:(NSSet *)values;
- (void)removeTabs:(NSSet *)values;

@end
