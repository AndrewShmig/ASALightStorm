//
//  CDTab.h
//  ASALightStorm
//
//  Created by AndrewShmig on 9/22/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDProfile, CDWebPage;

@interface CDTab : NSManagedObject

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSNumber * isOpened;
@property (nonatomic, retain) CDProfile *profile;
@property (nonatomic, retain) NSSet *webPages;
@end

@interface CDTab (CoreDataGeneratedAccessors)

- (void)addWebPagesObject:(CDWebPage *)value;
- (void)removeWebPagesObject:(CDWebPage *)value;
- (void)addWebPages:(NSSet *)values;
- (void)removeWebPages:(NSSet *)values;

@end
