
//
//  Bird.m
//  HelloWorld
//
//  Created by Obyadur Rahman on 7/1/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import "Bird.h"

@implementation Bird

@synthesize birdName, numberOfWings, numberOfLegs;

- (id)init
{
    if (self = [super init])
    {
        self.birdName = @"";
        self.numberOfWings = 0;
        self.numberOfLegs = 0;
    }
    return self;
}

- (id)initWithName:(NSString *)name
{
    if (self = [super initWithName:name])
    {
        self.birdName = name;
        self.numberOfWings = 0;
        self.numberOfLegs = 0;
    }
    return self;
}

- (id)initWithName:(NSString *)name numberOfWings:(NSUInteger)noOfWings numberOfLegs:(NSUInteger)noOfLegs
{
    if (self = [super initWithName:name])
    {
        self.birdName = name;
        self.numberOfWings = noOfWings;
        self.numberOfLegs = noOfLegs;
    }
    return self;
}



- (void)sleep
{
    NSLog(@"Bird %@ Sleep", self.birdName);
}

- (void)eat
{
    NSLog(@"Bird %@ Eating", self.birdName);
}



- (void)log
{
    NSLog(@"%@ has %ld wings and %ld legs",self.birdName, self.numberOfWings, self.numberOfLegs);
}

@end
