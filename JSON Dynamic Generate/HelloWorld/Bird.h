//
//  Bird.h
//  HelloWorld
//
//  Created by Obyadur Rahman on 7/1/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import "Animal.h"

@interface Bird : Animal

@property (nonatomic, strong) NSString   *birdName;
@property (nonatomic, assign) NSUInteger numberOfWings;
@property (nonatomic, assign) NSUInteger numberOfLegs;

- (id)init;
- (id)initWithName:(NSString *)name;
- (id)initWithName:(NSString *)name numberOfWings:(NSUInteger)noOfWings numberOfLegs:(NSUInteger)noOfLegs;

- (void)sleep;
- (void)eat;


- (void)log;

@end
