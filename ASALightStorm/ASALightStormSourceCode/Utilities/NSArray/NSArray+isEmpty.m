//
//  NSArray+isEmpty.m
//  ASALightStorm
//
//  Created by AndrewShmig on 9/22/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import "NSArray+isEmpty.h"

@implementation NSArray (isEmpty)

- (BOOL)isEmpty
{
    return (0 == [self count]);
}

@end
