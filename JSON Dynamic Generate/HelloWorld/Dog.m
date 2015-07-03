//
//  Dog.m
//  HelloWorld
//
//  Created by Obyadur Rahman on 7/1/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import "Dog.h"

@implementation Dog

@synthesize dogName;

- (id)init {
    if (self = [super init]) {
        self.dogName = @"";
    }
    return self;
}

- (id)initWithName:(NSString *)name {
    if (self = [self initWithName:name]) {
        self.dogName = name;
    }
    return self;
}

- (void)sleep
{
    NSLog(@"Dog %@ Sleep", self.dogName);
}

- (void)eat
{
    NSLog(@"Dog %@ Eating", self.dogName);
}

- (void)log
{
    NSLog(@"Dog Name: %@ ", self.dogName);
}

@end
