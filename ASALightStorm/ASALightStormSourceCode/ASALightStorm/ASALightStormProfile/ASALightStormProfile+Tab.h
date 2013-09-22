//
//  ASALightStormProfile+Tab.h
//  ASALightStorm
//
//  Created by AndrewShmig on 9/21/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import "ASALightStormProfile.h"


@class ASALightStormTab;


// implementation
// documentation
// tests


@interface ASALightStormProfile (Tab)

- (ASALightStormTab *)createTab;

- (void)closeAllTabs;

- (void)removeAllTabs;
- (void)removeAllOpenedTabs;

- (void)reopenLastTabs:(NSUInteger)count;
- (void)reopenLastTab;

- (NSArray *)openedTabs;

@end
