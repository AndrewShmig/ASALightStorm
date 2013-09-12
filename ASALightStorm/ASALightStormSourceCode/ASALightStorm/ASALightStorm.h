//
// Created by AndrewShmig on 9/9/13.
//
// Copyright (c) 2013 Andrew Shmig
// 
// Permission is hereby granted, free of charge, to any person 
// obtaining a copy of this software and associated documentation 
// files (the "Software"), to deal in the Software without 
// restriction, including without limitation the rights to use, 
// copy, modify, merge, publish, distribute, sublicense, and/or 
// sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following 
// conditions:
// 
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
// OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
// FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION 
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
// THE SOFTWARE.
//
#import <Foundation/Foundation.h>


// -- Main -- //
@interface ASALightStorm : NSObject
+ (instancetype)sharedStorm;
@end

// -- Profile -- //
@interface ASALightStorm (Profile)
- (BOOL)Profile_createWithName:(NSString *)name;
- (BOOL)Profile_destroyWithName:(NSString *)name;
- (BOOL)Profile_destroyAll;
- (BOOL)Profile_activateWithName:(NSString *)name;
- (NSString *)Profile_active;
- (NSUInteger)Profile_count;
- (NSArray *)Profile_profiles;
@end

// -- Bookmarks -- //
@interface ASALightStorm (Bookmark)
@end

// -- History -- //
@interface ASALightStorm (History)
@end

// -- Tabs -- //
@interface ASALightStorm (Tab)
@end

// -- Passwords & Logins -- //
@interface ASALightStorm (UserData)
@end

// -- Cache -- //
@interface ASALightStorm (Cache)
@end

// -- Filters -- //
@interface ASALightStorm (Filter)
@end

// -- AdBlock -- //
@interface ASALightStorm (AdBlock)
@end

// -- Stickers -- //
@interface ASALightStorm (Sticker)
@end

// -- Proxy -- //
@interface ASALightStorm (Proxy)
@end

// -- Tor -- //
@interface ASALightStorm (Tor)
@end

// -- Downloads -- //
@interface ASALightStorm (Download)
@end

// -- Browse offline -- //
@interface ASALightStorm (BrowseOffline)
@end