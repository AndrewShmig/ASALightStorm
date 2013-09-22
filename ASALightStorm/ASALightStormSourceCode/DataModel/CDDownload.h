//
//  CDDownload.h
//  ASALightStorm
//
//  Created by AndrewShmig on 9/22/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDProfile, CDWebPage;

@interface CDDownload : NSManagedObject

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSString * fileName;
@property (nonatomic, retain) NSNumber * fileSize;
@property (nonatomic, retain) CDProfile *profile;
@property (nonatomic, retain) CDWebPage *webPage;

@end
