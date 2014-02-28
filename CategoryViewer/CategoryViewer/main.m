//
//  main.m
//  CategoryViewer
//
//  Created by Obyadur Rahman on 2/7/14.
//  Copyright (c) 2014 IMpulse (BD) Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        
        CFUUIDRef     myUUID;
        CFStringRef   myUUIDString;
        char          strBuffer[100];
        
        myUUID = CFUUIDCreate(kCFAllocatorDefault);
        myUUIDString = CFUUIDCreateString(kCFAllocatorDefault, myUUID);
        
        // This is the safest way to obtain a C string from a CFString.
        CFStringGetCString(myUUIDString, strBuffer, 100, kCFStringEncodingASCII);
        
        CFStringRef outputString =
        CFStringCreateWithFormat(kCFAllocatorDefault,
                                 NULL,
                                 CFSTR("My UUID is: %s!\n"),
                                 strBuffer);
        CFShow(outputString);
        
//        
//        NSString *uid;
//        uid= [[UIDevice currentDevice] uniqueIdentifier];
//        NSLog(@"udid is %@",uid);
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
