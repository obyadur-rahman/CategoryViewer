//
//  DynamicClassBinder.h
//  HelloWorld
//
//  Created by Obyadur Rahman on 7/1/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DynamicClassBinder : NSObject

+(NSDictionary*)buildClassFromDictionary:(NSArray*)propNames withName:(NSString*)className;

@end
