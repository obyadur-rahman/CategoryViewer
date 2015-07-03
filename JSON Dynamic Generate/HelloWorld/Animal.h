//
//  Animal.h
//  HelloWorld
//
//  Created by Obyadur Rahman on 7/1/15.
//  Copyright (c) 2015 IMpulse BD Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (nonatomic, strong) NSString *animalName;

- (id)init;
- (id)initWithName:(NSString *)name;

- (void)sleep;
- (void)eat;


- (void)log;

@end
