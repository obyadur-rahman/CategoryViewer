//
//  Dog.h
//  HelloWorld
//
//  Created by Obyadur Rahman on 7/1/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import "Animal.h"

@interface Dog : Animal

@property (nonatomic, strong) NSString *dogName;

- (id)init;
- (id)initWithName:(NSString *)name;

- (void)sleep;
- (void)eat;


- (void)log;

@end
