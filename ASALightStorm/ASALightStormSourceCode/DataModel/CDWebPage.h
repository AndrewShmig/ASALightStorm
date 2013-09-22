//
//  CDWebPage.h
//  ASALightStorm
//
//  Created by AndrewShmig on 9/22/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDOfflineSnapshot, CDSticker, CDTab, CDUserData;

@interface CDWebPage : NSManagedObject

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSSet *snapshots;
@property (nonatomic, retain) NSSet *stickers;
@property (nonatomic, retain) CDTab *tab;
@property (nonatomic, retain) NSSet *userData;
@end

@interface CDWebPage (CoreDataGeneratedAccessors)

- (void)addSnapshotsObject:(CDOfflineSnapshot *)value;
- (void)removeSnapshotsObject:(CDOfflineSnapshot *)value;
- (void)addSnapshots:(NSSet *)values;
- (void)removeSnapshots:(NSSet *)values;

- (void)addStickersObject:(CDSticker *)value;
- (void)removeStickersObject:(CDSticker *)value;
- (void)addStickers:(NSSet *)values;
- (void)removeStickers:(NSSet *)values;

- (void)addUserDataObject:(CDUserData *)value;
- (void)removeUserDataObject:(CDUserData *)value;
- (void)addUserData:(NSSet *)values;
- (void)removeUserData:(NSSet *)values;

@end
