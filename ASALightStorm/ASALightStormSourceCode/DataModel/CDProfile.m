//
//  CDProfile.m
//  ASALightStorm
//
//  Created by AndrewShmig on 9/22/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import "CDProfile.h"
#import "CDAdBlock.h"
#import "CDBookmark.h"
#import "CDDownload.h"
#import "CDFilter.h"
#import "CDProxy.h"
#import "CDTab.h"


@implementation CDProfile

@dynamic createdAt;
@dynamic name;
@dynamic passwordHash;
@dynamic adblocks;
@dynamic bookmarks;
@dynamic downloads;
@dynamic filters;
@dynamic proxies;
@dynamic tabs;

@end
