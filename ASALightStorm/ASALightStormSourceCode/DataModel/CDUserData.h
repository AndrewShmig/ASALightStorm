//
//  CDUserData.h
//  ASALightStorm
//
//  Created by AndrewShmig on 9/22/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDWebPage;

@interface CDUserData : NSManagedObject

@property (nonatomic, retain) NSString * fieldName;
@property (nonatomic, retain) NSString * fieldValue;
@property (nonatomic, retain) CDWebPage *webPage;

@end
