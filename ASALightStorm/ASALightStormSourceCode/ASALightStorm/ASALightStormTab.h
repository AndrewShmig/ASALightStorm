//
//  ASALightStormTab.h
//  ASALightStorm
//
//  Created by AndrewShmig on 9/21/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import <Foundation/Foundation.h>


@class CDTab;
@class ASALightStormProfile;
@class ASALightStormWebPage;


// implementation - add methods like loadWebPage, previousWebPage, nextWebPage etc
// documentation
// tests


@interface ASALightStormTab : NSObject

@property (nonatomic, readonly) CDTab *tab;

- (id)initWithProfile:(ASALightStormProfile *)profile;

- (void)close;
- (void)remove;

@end
