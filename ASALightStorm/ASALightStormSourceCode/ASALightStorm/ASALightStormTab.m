//
//  ASALightStormTab.m
//  ASALightStorm
//
//  Created by AndrewShmig on 9/21/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import "ASALightStormTab.h"
#import "CDTab.h"
#import "ASALightStormProfile.h"


@implementation ASALightStormTab
{
    CDTab *_tab;
}

#pragma mark - Init methods

- (id)initWithProfile:(ASALightStormProfile *)profile
{
    self = [super init];
    
    if(self) {
        if(nil != profile.profile) {
//            creating new tab
            NSManagedObjectContext *stormContext = [[ASALightStorm sharedStorm] stormManagedObjectContext];
            _tab = [NSEntityDescription insertNewObjectForEntityForName:@"CDTab"
                                                 inManagedObjectContext:stormContext];
            
            _tab.createdAt = [NSDate date];
            _tab.isOpened = @YES;
            _tab.profile = profile.profile;
        } else {
            return nil;
        }
    }
    
    return self;
}

#pragma mark - Instance methods

- (void)close
{
    _tab.isOpened = @NO;
}

- (void)remove
{
    [[[ASALightStorm sharedStorm] stormManagedObjectContext] deleteObject:_tab];
}

@end
