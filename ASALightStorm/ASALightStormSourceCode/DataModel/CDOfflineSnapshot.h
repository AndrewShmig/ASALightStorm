//
//  CDOfflineSnapshot.h
//  ASALightStorm
//
//  Created by AndrewShmig on 9/22/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDWebPage;

@interface CDOfflineSnapshot : NSManagedObject

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) CDWebPage *webPage;

@end
