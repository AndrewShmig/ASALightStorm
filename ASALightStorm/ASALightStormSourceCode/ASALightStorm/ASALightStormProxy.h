//
//  ASALightStormProxy.h
//  ASALightStorm
//
//  Created by AndrewShmig on 9/21/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    ASALightStormProxyHTTPType,
    ASALightStormProxyHTTPSType,
    ASALightStormProxySOCKSType
    
} ASALightStormProxyType;


@interface ASALightStormProxy : NSObject

@end
