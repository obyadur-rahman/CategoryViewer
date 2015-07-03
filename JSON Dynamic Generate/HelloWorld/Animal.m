//
//  Animal.m
//  HelloWorld
//
//  Created by Obyadur Rahman on 7/1/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import "Animal.h"

@implementation Animal

@synthesize animalName;

- (id)init
{
    if (self = [super init])
    {
        self.animalName = @"";
    }
    return self;
}

- (id)initWithName:(NSString *)name
{
    if (self = [super init])
    {
        self.animalName = name;
    }
    return self;
}



- (void)sleep
{
    NSLog(@"Animal %@ Sleep", self.animalName);
}

- (void)eat
{
    NSLog(@"Animal %@ Eating", self.animalName);
}



- (void)log
{
    NSLog(@"Animal Name: %@ ", self.animalName);
}

@end
